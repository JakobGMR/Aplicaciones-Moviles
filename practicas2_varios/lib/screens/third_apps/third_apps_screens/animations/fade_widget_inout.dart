import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

class FadeWidgetInOutScreen extends StatefulWidget {
  const FadeWidgetInOutScreen({super.key});

  @override
  State<FadeWidgetInOutScreen> createState() => _FadeWidgetInOutScreenState();
}

class _FadeWidgetInOutScreenState extends State<FadeWidgetInOutScreen> {
  // Whether the green box should be visible
  bool _visible = true;
  DrawerAppsWidget getDrawer = DrawerAppsWidget(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade a Widget In and Out'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.network('https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2xiaXlkaXJnZGY4NHdqbnQzMWMyY2xlZHdoczI5MnQydWh1emhxZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3NtY188QaxDdC/giphy.gif'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}