import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_global.dart';

class HandleChangesTextFieldScreen extends StatefulWidget {
  const HandleChangesTextFieldScreen({super.key});

  @override
  State<HandleChangesTextFieldScreen> createState() => _HandleChangesTextFieldScreenState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _HandleChangesTextFieldScreenState extends State<HandleChangesTextFieldScreen> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    final text = myController.text;

    // ignore: avoid_print
    print('Second text field: $text (${text.characters.length})');
  }

  @override
  Widget build(BuildContext context) {
    DrawerWidget getdrawer = DrawerWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Changes to TextField'),
      ),
      drawer: getdrawer.getDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                // ignore: avoid_print
                print('First text field: $text (${text.characters.length})');
              },
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}