import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class DrawerFirstsAppsWidget {
  final List<String> designTitles = [
    'Act1: SnackBar', 
    'Act2: UI based on orientation',
    'Act3: Use a custom font',
    'Act4: Use themes to share colors and font styles',
    'Act5: TabBar',
  ];
  final List<String> formsTitles = [
    'Act6: Form with Validation',
    'Act7: Style in TextField',
    'Act8: Focus textFields',
    'Act9: Handle changes textFields',
    'Act10: Value textFields',
  ];
  final List<String> listsTitles = [
    'Act11: Grid List',
    'Act12: Horizontal list',
    'Act13: List with different types of items',
    'Act14: List with spaced items',
    'Act15: Floating Appbar',
    'Act16: Use lists',
    'Act17: Long lists',
  ];

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

          // Aquí comienza la colección de for
          for(int i = 0; i < designTitles.length; i++)
            ListTile(
              title: Text(designTitles[i], style: const TextStyle(color: Colors.white),),
              onTap: () {
                appState.changeIndex(i);
                Navigator.pop(context);
              },
            ),
          // Aquí termina la colección de for

          const Text('Forms', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

          const Divider(color: Colors.amber),

          for(int i = 0; i < formsTitles.length; i++)
            ListTile(
              title: Text(formsTitles[i], style: const TextStyle(color: Colors.white),),
              onTap: () {
                appState.changeIndex(i+designTitles.length);
                Navigator.pop(context);
              },
            ),

          const Text('Lists', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

          const Divider(color: Colors.amber),

          for(int i = 0; i < listsTitles.length; i++)
            ListTile(
              title: Text(listsTitles[i], style: const TextStyle(color: Colors.white),),
              onTap: () {
                appState.changeIndex(i + (designTitles.length + formsTitles.length) );
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}