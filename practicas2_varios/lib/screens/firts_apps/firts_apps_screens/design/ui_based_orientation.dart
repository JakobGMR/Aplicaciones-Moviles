import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_firsts_apps_global_.dart';

class UIBasedOrientationScreen extends StatefulWidget {
  const UIBasedOrientationScreen({super.key});

  @override
  State<UIBasedOrientationScreen> createState() => _UIBasedOrientationScreenState();
}

class _UIBasedOrientationScreenState extends State<UIBasedOrientationScreen> {
  int numberItems = 1;

  @override
  Widget build(BuildContext context) {
    final DrawerFirstsAppsWidget getDrawer = DrawerFirstsAppsWidget();

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