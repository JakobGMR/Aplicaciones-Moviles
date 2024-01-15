import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_seconds_apps_global.dart';

class SendDataNewScreen extends StatelessWidget {
  const SendDataNewScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    DrawerSecondsAppsWidget getDrawer = DrawerSecondsAppsWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreens(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreens extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreens({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}