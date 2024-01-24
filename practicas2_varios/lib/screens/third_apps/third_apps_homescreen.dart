import 'package:flutter/material.dart';

import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';
import 'third_apps_screens/home.dart';

class ThirdAppsHomescreen extends StatefulWidget {
  const ThirdAppsHomescreen({super.key});

  @override
  State<ThirdAppsHomescreen> createState() => _ThirdAppsHomescreenState();
}

class _ThirdAppsHomescreenState extends State<ThirdAppsHomescreen> {  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();

    Widget page;
    switch (appState.selectedIndex) {
      case 0:
        page = const AnimatePageRouteScreen();
        break;

      case 1:
        page = const AnimatePhysicsSimulationScreen();
        break;

      case 2:
        page = const AnimatePropertiesContainerScreen();
        break;

      case 3:
        page = const FadeWidgetInOutScreen();
        break;

      case 4:
        page = const CreateDownloadButtonScreen();
        break;

      case 5:
        page = const CreateNestedNavigationScreen();
        break;

      case 6:
        page = const CreatePhotoFilterScreen();
        break;

      case 7:
        page = const CreateScrollingParallaxScreen();
        break;

      case 8:
        page = const CreateShimmerLoadingScreen();
        break;

      case 9:
        page = const CreateStaggeredMenuScreen();
        break;

      case 10:
        page = const CreateTypingIndicatorScreen();
        break;

      case 11:
        page = const CreateExpandableFABScreen();
        break;
      
      case 12:
        page = const CreateGradientChatScreen();
        break;

      case 13:
        page = const DragUIElementScreen();
        break;

      case 14:
        page = const AddMaterialTouchScreen();
        break;

      case 15:
        page = const HandleTapsScreen();
        break;

      case 16:
        page = const ImplementSwipeDismissScreen();
        break;
      default:
        throw UnimplementedError('no widget for ${appState.selectedIndex}');
    }

    return page; 
  }
}