import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class DrawerThirdAppsWidget {
  final List<String> animationTitles = [
    'Act1: Animate a page route transition',
    'Act2: Animate a widget using a physics simulation',
    'Act3: Animate the properties of a container',
    'Act4: Fade a widget in and out',
  ];
  final List<String> effectsTitles = [
    'Act5: Create a download button',
    'Act6: Create a nested navigation flow'
    'Act7: Create a photo filter carousel',
    'Act8: Create a scrolling parallax effect',
    'Act9: Create a shimmer loading effect',
    'Act10: Create a staggered menu animation',
    'Act11: Create a typing indicator',
    'Act12: Create an expandable FAB',
    'Act13: Create gradient chat bubbles',
    'Act14: Drag a UI element'
  ];
  final List<String> gesturesTitles = [
    'Act15: Add Material touch ripples',
    'Act16: Handle taps',
    'Act17: Implement swipe to dismiss',
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

        const Text('Animation', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...animationTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.animation), 
          label: Flexible(child: Text(e)),)
        ),

        const Text('Effects', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...effectsTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.extension_off_outlined), 
          label: Flexible(child: Text(e)),)
        ),

        const Text('Gestures', style: TextStyle(fontSize: 20, color: Colors.purpleAccent), textAlign: TextAlign.center),

        const Divider(color: Colors.brown),

        ...gesturesTitles.map((e) => NavigationDrawerDestination(
          icon: const Icon(Icons.gesture), 
          label: Flexible(child: Text(e)),)
        ),
      ],
    );
  }
}