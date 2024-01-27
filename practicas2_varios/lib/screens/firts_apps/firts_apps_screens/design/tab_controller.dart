import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class TabControllerScreen extends StatelessWidget {
  const TabControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerAppsWidget getDrawer = DrawerAppsWidget(1);
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car),),
              Tab(icon: Icon(Icons.directions_transit),),
              Tab(icon: Icon(Icons.directions_bike),),
            ]
          ),
          title: const Text('Practica TabBar'),
        ),
        drawer: getDrawer.getDrawer(context),

        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
        ]),
      ),
    );
  }
}