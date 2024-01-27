import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class NavigateNewScreen extends StatelessWidget {
  const NavigateNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}