import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class DrawerAppsWidget {
  int numListActivity;

  DrawerAppsWidget(this.numListActivity);

  final Map<int,Map <int,List<String> >> listActivities = {
    1: {
      0: [
        'Act1: SnackBar', 
        'Act2: UI based on orientation',
        'Act3: Use a custom font',
        'Act4: Use themes to share colors and font styles',
        'Act5: TabBar',
      ],
      1: [
        'Act6: Form with Validation',
        'Act7: Style in TextField',
        'Act8: Focus textFields',
        'Act9: Handle changes textFields',
        'Act10: Value textFields',
      ],
      2: [
        'Act11: Grid List',
        'Act12: Horizontal list',
        'Act13: List with different types of items',
        'Act14: List with spaced items',
        'Act15: Floating Appbar',
        'Act16: Use lists',
        'Act17: Long lists',
      ]
    },

    2: {
      0: [
        'Act1: Animate a widget across screens', 
        'Act2: Navigate to a new screen and back',
        'Act3: Navigate with named routes',
        'Act4: Pass arguments to a named route',
        'Act5: Return data from a screen',
        'Act6: Send data to a new screen'
      ],
      1: [
        'Act7: Fetch data from the internet',
        'Act8: Make authenticated requests',
        'Act9: Send data to the internet',
        'Act10: Update data over the internet',
        'Act11: Delete data on the internet',
        'Act12: Communicate with WebSockets',
        'Act13: Parse JSON in the background'
      ],
      2: [
        'Act14: Persist data with SQLite',
        'Act15: Read and write files',
        'Act16: Store key-value data on disk',
      ]
    },

    3: {
      0: [
        'Act1: Animate a page route transition',
        'Act2: Animate a widget using a physics simulation',
        'Act3: Animate the properties of a container',
        'Act4: Fade a widget in and out',
      ],
      1: [
        'Act5: Create a download button',
        'Act6: Create a nested navigation flow',
        'Act7: Create a photo filter carousel',
        'Act8: Create a scrolling parallax effect',
        'Act9: Create a shimmer loading effect',
        'Act10: Create a staggered menu animation',
        'Act11: Create a typing indicator',
        'Act12: Create an expandable FAB',
        'Act13: Create gradient chat bubbles',
        'Act14: Drag a UI element'
      ],
      2: [
        'Act15: Add Material touch ripples',
        'Act16: Handle taps',
        'Act17: Implement swipe to dismiss',
      ]
    }
  };

  final List<String> listTitles = ['Design', 'Forms', 'Lists', 'Navigation', 'Networking', 'Persistence', 'Animation', 'Effects', 'Gestures'];

  getDrawer(final BuildContext context) {
    final appState = context.watch<MainProvider>();
    final List<String>? firstList = listActivities[numListActivity]![0];
    final List<String>? secondList = listActivities[numListActivity]![1];
    final List<String>? thirdList = listActivities[numListActivity]![2];

    final List<String> titles = (numListActivity == 1)
      ? listTitles.sublist(0,3)
      : (numListActivity == 2) 
        ? listTitles.sublist(3,6)
        : listTitles.sublist(6,9);

      final List<Icon> icons = (numListActivity == 1)
      ? const [Icon(Icons.design_services), Icon(Icons.format_list_bulleted_rounded), Icon(Icons.list_sharp)]
      : (numListActivity == 2)
        ? const [Icon(Icons.navigation_outlined), Icon(Icons.network_check_outlined), Icon(Icons.data_object_rounded)]
        : const [Icon(Icons.animation_rounded), Icon(Icons.extension_off_outlined), Icon(Icons.gesture_outlined)];

    return NavigationDrawer(

      selectedIndex: appState.selectedIndex,

      onDestinationSelected: (value) {
        appState.changeIndex(value);
      },

      children: [
        const SizedBox(height: 10,),

        Text(titles[0], style: const TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...firstList!.map((e) => NavigationDrawerDestination(
          icon: icons[0], 
          label: Flexible(child: Text(e)),)
        ),

        Text(titles[1], style: const TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...secondList!.map((e) => NavigationDrawerDestination(
          icon: icons[1], 
          label: Flexible(child: Text(e)),)
        ),

        Text(titles[2], style: const TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...thirdList!.map((e) => NavigationDrawerDestination(
          icon: icons[2], 
          label: Flexible(child: Text(e)),)
        ),
      ],
    );
  }
}