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
  final List<String> networkingTitles = [
    'Act7: Fetch data from the internet',
    'Act8: Make authenticated requests',
    'Act9: Send data to the internet',
    'Act10: Update data over the internet',
    'Act11: Delete data on the internet',
    'Act12: Communicate with WebSockets',
    'Act13: Parse JSON in the background'
  ];
  final List<String>  persistenceTitles = [
    'Act14: Persist data with SQLite',
    'Act15: Read and write files',
    'Act16: Store key-value data on disk',
  ];

  getDrawer(final BuildContext context) {
    final appState = context.watch<MainProvider>();

    return NavigationDrawer(

      selectedIndex: appState.selectedIndex,

      onDestinationSelected: (value) {
        appState.changeIndex(value);
      },

      children: [
        const SizedBox(height: 10,),

        const Text('Navigation', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...navigationTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.navigation_outlined), 
          label: Flexible(child: Text(e)),)
        ),

        const Text('Networking', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...networkingTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.network_check_outlined), 
          label: Flexible(child: Text(e)),)
        ),

        const Text('Persistence', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...persistenceTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.data_object_rounded), 
          label: Flexible(child: Text(e)),)
        ),
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