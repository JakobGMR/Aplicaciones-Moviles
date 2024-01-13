import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int numberItems = 1;

  @override
  Widget build(BuildContext context) {
    final DrawerWidget getDrawer = DrawerWidget();

    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      drawer: getDrawer.getDrawer(context),
      body: 
          OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                // Create a grid with 2 columns in portrait mode, or 3 columns in
                // landscape mode.
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(30, (index) {
                  return Center(
                    child: Text(
                          'Hola, soy el clon N° ${index+1}',
                          style: Theme.of(context).textTheme.displaySmall,
                    ),
                  );
                }),
              );
            },
          ),

          
        
      );
    
  }
}