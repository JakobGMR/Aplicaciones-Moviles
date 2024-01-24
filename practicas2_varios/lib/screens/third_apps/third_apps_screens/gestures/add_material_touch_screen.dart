import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_third_apps_global.dart';

class AddMaterialTouchScreen extends StatelessWidget {
  const AddMaterialTouchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerThirdAppsWidget getDrawer = DrawerThirdAppsWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Material Touch Ripples'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: const Center(
        child: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Tap'),
        ));
      },
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text('Flat Button'),
      ),
    );
  }
}