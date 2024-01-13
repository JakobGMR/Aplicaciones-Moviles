import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget {
  // TODO: final List<String> designTitles = ['sa'];
  getDrawer(final BuildContext context) {
    final appState = context.watch<MainProvider>();

    return Drawer(
      backgroundColor: Colors.black26,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://flutteragency.com/wp-content/uploads/2020/06/Logo.png',),
              ),
            ),
            child: Card(
              color: Colors.grey,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text('Soy un Drawer. Seleccione la tarea', style: TextStyle(color: Colors.white, fontSize: 25), textAlign: TextAlign.center,)
            ),
          ),

          const Text('Design', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

          const Divider(color: Colors.amber),

          ListTile(
            title: const Text('Act1: SnackBar', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(0);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act2: GridView', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(1);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act3: TabBar', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(2);
              Navigator.pop(context);
            },
          ),

          const Text('Forms', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

          const Divider(color: Colors.amber),

          ListTile(
            title: const Text('Act4: Form with Validation', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(3);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act5: Style in TextField', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(4);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act6: Focus textFields', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(5);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act7: Handle changes textFields', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(6);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act8: Value textFields', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(7);
              Navigator.pop(context);
            },
          ),

          const Text('Lists', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

          const Divider(color: Colors.amber),

          ListTile(
            title: const Text('Act9: Grid List', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(8);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act10: Horizontal list', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(9);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act11: List with different types of items', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(10);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act12: List with spaced items', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(11);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act13: Floating Appbar', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(12);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act14: Use lists', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(13);
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text('Act15: Long lists', style: TextStyle(color: Colors.white),),
            onTap: () {
              appState.changeIndex(14);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}