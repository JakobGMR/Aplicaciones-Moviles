import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class UseListScreen extends StatelessWidget {
  const UseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerAppsWidget getDrawer = DrawerAppsWidget(1);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Use Lists'),
        ),
        drawer: getDrawer.getDrawer(context),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      );
  }
}