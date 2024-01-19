import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_seconds_apps_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreKeyValueScreen extends StatefulWidget {
  const StoreKeyValueScreen({super.key});

  @override
  State<StoreKeyValueScreen> createState() => _StoreKeyValueScreenState();
}

class _StoreKeyValueScreenState extends State<StoreKeyValueScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  /// Load the initial counter value from persistent storage on start,
  /// or fallback to 0 if it doesn't exist.
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  /// After a click, increment the counter state and
  /// asynchronously save it to persistent storage.
  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    DrawerSecondsAppsWidget getDrawer = DrawerSecondsAppsWidget();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Key-Value Data on Disk'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}