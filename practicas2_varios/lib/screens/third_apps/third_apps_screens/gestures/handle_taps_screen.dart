import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_third_apps_global.dart';

class HandleTapsScreen extends StatelessWidget {
  const HandleTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerThirdAppsWidget getDrawer = DrawerThirdAppsWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle taps'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: const Center(
        child: MyButton2(),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}