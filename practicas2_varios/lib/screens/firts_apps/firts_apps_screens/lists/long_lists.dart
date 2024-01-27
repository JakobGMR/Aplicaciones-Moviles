import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class LongListsScreen extends StatelessWidget {
  final List<String> items;
  const LongListsScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final DrawerAppsWidget getDrawer = DrawerAppsWidget(1);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Long Lists'),
        ),
        drawer: getDrawer.getDrawer(context),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      );
  }
}