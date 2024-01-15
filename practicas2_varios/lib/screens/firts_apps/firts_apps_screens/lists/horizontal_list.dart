import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_firsts_apps_global_.dart';

class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerFirstsAppsWidget getDrawer = DrawerFirstsAppsWidget();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Horizontal List'),
        ),
        drawer: getDrawer.getDrawer(context),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      );
  }
}