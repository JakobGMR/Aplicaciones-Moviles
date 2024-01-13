import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';

class FocusTextFieldScreen extends StatefulWidget {
  const FocusTextFieldScreen({super.key});

  @override
  State<FocusTextFieldScreen> createState() => _FocusTextFieldScreenState();
}

class _FocusTextFieldScreenState extends State<FocusTextFieldScreen> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DrawerWidget getDrawer = DrawerWidget();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Focus TextField'),),
        drawer: getDrawer.getDrawer(context),
        body: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            const TextField(
              autofocus: true,
            ),

            TextField(
              focusNode: myFocusNode,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // When the button is pressed,
          // give focus to the text field using myFocusNode.
          onPressed: () => myFocusNode.requestFocus(),
          tooltip: 'Focus Second Text Field',
          child: const Icon(Icons.edit),
        ),  // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}