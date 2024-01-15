import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_seconds_apps_global.dart';

class NavigateNewScreen extends StatelessWidget {
  const NavigateNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerSecondsAppsWidget getDrawer = DrawerSecondsAppsWidget();
    
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