import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_third_apps_global.dart';

class ImplementSwipeDismissScreen extends StatefulWidget {
  const ImplementSwipeDismissScreen({super.key});

  @override
  State<ImplementSwipeDismissScreen> createState() => _ImplementSwipeDismissScreenState();
}

class _ImplementSwipeDismissScreenState extends State<ImplementSwipeDismissScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  DrawerThirdAppsWidget getDrawer = DrawerThirdAppsWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implement Swipe to Dismiss'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}