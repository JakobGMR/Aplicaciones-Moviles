import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_firsts_apps_global_.dart';

class SnackbarScreen extends StatelessWidget {
  SnackbarScreen({super.key});

  final DrawerFirstsAppsWidget getDrawer = DrawerFirstsAppsWidget();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar')),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: Card(
          elevation: 2,
          child: TextButton(
            child: const Text('SnackBar'),
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Hola, soy un SnackBar'),
                action: SnackBarAction(label: 'Cerrar', onPressed: () {
                  
                },),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}