import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class DrawerSecondsAppsWidget {
  final List<String> navigationTitles = [
    'Act1: Animate a widget across screens', 
    'Act2: Navigate to a new screen and back',
    'Act3: Navigate with named routes',
    'Act4: Pass arguments to a named route',
    'Act5: Return data from a screen',
    'Act6: Send data to a new screen'
  ];
  // final List<String> formsTitles = [
  //   'Act6: Form with Validation',
  //   'Act7: Style in TextField',
  //   'Act8: Focus textFields',
  //   'Act9: Handle changes textFields',
  //   'Act10: Value textFields',
  // ];
  // final List<String> listsTitles = [
  //   'Act11: Grid List',
  //   'Act12: Horizontal list',
  //   'Act13: List with different types of items',
  //   'Act14: List with spaced items',
  //   'Act15: Floating Appbar',
  //   'Act16: Use lists',
  //   'Act17: Long lists',
  // ];

  getDrawer(final BuildContext context) {
    final appState = context.watch<MainProvider>();

    return NavigationDrawer(

      selectedIndex: appState.selectedIndex,

      onDestinationSelected: (value) {
        appState.changeIndex(value);
        
      },

      children: [
        ...navigationTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.navigation_outlined), 
          label: Flexible(child: Text(e)),)
        )


      ],
      );
    // return Drawer(
    //   backgroundColor: Colors.black26,
    //   child: ListView(
    //     children: [
    //       const DrawerHeader(
    //         decoration: BoxDecoration(
    //           color: Colors.blue,
    //           image: DecorationImage(
    //             fit: BoxFit.cover,
    //             image: NetworkImage('https://flutteragency.com/wp-content/uploads/2020/06/Logo.png',),
    //           ),
    //         ),
    //         child: Card(
    //           color: Colors.grey,
    //           margin: EdgeInsets.symmetric(vertical: 30),
    //           child: Text('Seleccione la tarea', style: TextStyle(color: Colors.white, fontSize: 25), textAlign: TextAlign.center,)
    //         ),
    //       ),

    //       ListView.builder(
    //         itemCount: navigationTitles.length,
    //         itemBuilder: (context, index) {
    //           final navigationTile = navigationTitles[index];
    //           return ListTile(
    //             title: Text(navigationTile, 
    //             style: const TextStyle(color: Colors.white),),
    //             onTap: () {
    //               appState.changeIndex(index);
    //               Navigator.pop(context);
    //           },);
    //          },
            // children: [

            //   const Text('Navigation', style: TextStyle(fontSize: 20, color: Colors.cyan), textAlign: TextAlign.center),

            //   const Divider(color: Colors.amber),
          

          
              // Aquí comienza la colección de for
             

              // for(int i = 0; i < navigationTitles.length; i++)
              // {
                
              //     title: Text(navigationTitles[i], style: const TextStyle(color: Colors.white),),
              //     onTap: () {
              //       appState.changeIndex(i);
              //       Navigator.pop(context);
              //     },
                
              // }
              
    //       ),
    //     ],
    //   ),
    // );
  }
}