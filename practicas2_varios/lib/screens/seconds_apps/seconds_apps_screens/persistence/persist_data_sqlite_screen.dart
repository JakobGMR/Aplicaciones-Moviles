import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteScreen extends StatefulWidget {
  const SQLiteScreen({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SQLiteScreenState createState() => _SQLiteScreenState();
}

class _SQLiteScreenState extends State<SQLiteScreen> {
  List<Dog> _dogs = [];
  int id = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _idController.dispose();
    super.dispose();
  }

  void _insertDog() async {

    int? age = int.tryParse(_ageController.text);
    if(age == null)  return;

    var fido = Dog(
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );

    if (kDebugMode) {
      print({fido});
    }

    await insertDog(fido);
    _updateDogList();

    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDog(int id) async {
    int? age = int.tryParse(_ageController.text);
    if(age == null)  return;

    var dog = await getById(id);

    var fido = Dog(
      id: dog.id,
      name: _nameController.text,
      age: int.parse(_ageController.text),
    );

    await updateDog(fido);

    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _deleteDog(int id) async {
    await deleteDog(id);
    _updateDogList();
    _nameController.clear();
    _ageController.clear();
    _idController.clear();
  }

  void _updateDogList() async {
    _dogs = await dogs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    const Text('Nombre del perro:'),
                    
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No dejes este campo vacío';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),
                    
                    const Text('Edad del perro:'),

                    TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa la edad del perro';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              _insertDog();
                            }
                          }, 
                          child: const Text('Añadir perro')
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              if(id == 0) return;
                              _updateDog(id);
                            }
                          },
                          child: const Text('Actualizar perro')
                        )
                      ],
                    )
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text('List of Dogs'),
            Expanded(
              child: FutureBuilder<List<Dog>>(
                future: dogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    _dogs = snapshot.data!;
                    return ListView.builder(
                      itemCount: _dogs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              'Name: ${_dogs[index].name}'),
                          subtitle: Text('Age: ${_dogs[index].age}'),
                          leading: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteDog(_dogs[index].id!);
                            },
                          ),
                          onTap: () {
                            _nameController.text = _dogs[index].name;
                            _ageController.text = _dogs[index].age.toString();
                            id = _dogs[index].id!;
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dog {
  final int? id;
  final String name;
  final int age;

  Dog({
    this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    var map = {
      'name': name,
      'age': age,
    };

    if (id != null) {
      map['id'] = id as Object;
    }

    return map;
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

Database? _database;

Future<Database> initializeDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
}

Future<Database> get database async {
  if (_database != null) return _database!;

  _database = await initializeDatabase();
  return _database!;
}

Future<Dog> getById(int id) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM dogs WHERE id = $id');
  
  if (maps.isNotEmpty) {
    return Dog(
      id: maps[0]['id'] as int,
      name: maps[0]['name'] as String,
      age: maps[0]['age'] as int,
    );
  }

  throw Exception('Id $id not found');
}

Future<void> insertDog(Dog dog) async {
  final db = await database;
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'] as int,
      name: maps[i]['name'] as String,
      age: maps[i]['age'] as int,
    );
  });
}

Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'dogs',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}