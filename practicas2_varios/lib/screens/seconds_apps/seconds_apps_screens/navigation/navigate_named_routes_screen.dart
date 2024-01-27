import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class NavigateNamedRoutesScreen extends StatelessWidget {
  const NavigateNamedRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}