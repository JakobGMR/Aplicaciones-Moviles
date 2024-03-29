import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class StyleTextFieldScreen extends StatelessWidget {
  const StyleTextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerAppsWidget getDrawer = DrawerAppsWidget(1);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Style TextFormField'),),
      drawer: getDrawer.getDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Introduce un texto',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Soy un textFieldBorder',
              ),
            ),
          ),
        ],
      ),
    );
  }
}