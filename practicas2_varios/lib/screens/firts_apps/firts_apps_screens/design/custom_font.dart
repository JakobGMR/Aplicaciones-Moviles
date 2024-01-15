import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_firsts_apps_global_.dart';

class CustomFontScreen extends StatelessWidget {
  const CustomFontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerFirstsAppsWidget getDrawer = DrawerFirstsAppsWidget();

    return Scaffold(
      // The AppBar uses the app-default Raleway font.
      appBar: AppBar(title: const Text('Custom Fonts')),
      drawer: getDrawer.getDrawer(context),
      body: const Center(
        // This Text widget uses the RobotoMono font.
        child: Text(
          'Roboto Mono sample',
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      ),
    );
  }
}