import 'package:flutter/material.dart';
import 'package:practicas2_varios/screens/firts_apps/home.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();

    Widget page;
    switch (appState.selectedIndex) {
      case 0:
        page = SnackbarScreen();
        break;

      case 1:
        page = const UIBasedOrientationScreen();
        break;

      case 2:
        page = const CustomFontScreen();
        break;

      case 3:
        page = const ThemeColorsScreen();
        break;

      case 4:
        page = const TabControllerScreen();
        break;

      case 5:
        page = const FormValidationScreen();
        break;

      case 6:
        page = const StyleTextFieldScreen();
        break;

      case 7:
        page = const FocusTextFieldScreen();
        break;

      case 8:
        page = const HandleChangesTextFieldScreen();
        break;

      case 9:
        page = const ValueTextFieldScreen();
        break;

      case 10:
        page = const GridListScreen();
        break;

      case 11:
        page = const HorizontalListScreen();
        break;
      
      case 12:
        page = TypesofItemsScreen(items: List<ListItem>.generate(
          1000,
          (i) => i % 6 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i'),
          )
        );
        break;

      case 13:
        page = const ListSpacedItemsScreen();
        break;

      case 14:
        page = const FloatingAppbarScreen();
        break;

      case 15:
        page = const UseListScreen();
        break;

      case 16:
        page = LongListsScreen(items: List<String>.generate(10000, (i) => 'Item $i'),);
        break;
      default:
        throw UnimplementedError('no widget for ${appState.selectedIndex}');
    }

    return page; 
  }
}