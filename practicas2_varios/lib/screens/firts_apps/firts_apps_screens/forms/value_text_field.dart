import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class ValueTextFieldScreen extends StatefulWidget {
  const ValueTextFieldScreen({super.key});

  @override
  State<ValueTextFieldScreen> createState() => _ValueTextFieldScreenState();
}

class _ValueTextFieldScreenState extends State<ValueTextFieldScreen> {
  //Create a text controller and use it to retrieve the current value
  // of the TextField
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DrawerAppsWidget getDrawer = DrawerAppsWidget(1);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}