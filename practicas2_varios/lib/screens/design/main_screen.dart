import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:practicas2_varios/screens/design/second_screen.dart';
import 'package:practicas2_varios/screens/design/tab_controller.dart';
import 'package:practicas2_varios/screens/forms/focus_text_field.dart';
import 'package:practicas2_varios/screens/forms/form_validation.dart';
import 'package:practicas2_varios/screens/forms/handle_changes_textfield.dart';
import 'package:practicas2_varios/screens/forms/style_text_field.dart';
import 'package:practicas2_varios/screens/forms/value_text_field.dart';
import 'package:practicas2_varios/screens/lists/floating_app_bar.dart';
import 'package:practicas2_varios/screens/lists/grid_list.dart';
import 'package:practicas2_varios/screens/lists/horizontal_list.dart';
import 'package:practicas2_varios/screens/lists/list_spaced_items.dart';
import 'package:practicas2_varios/screens/lists/long_lists.dart';
import 'package:practicas2_varios/screens/lists/types_items.dart';
import 'package:practicas2_varios/screens/lists/use_list.dart';
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
        page = MainScreen();
        break;
      case 1:
        page = const SecondScreen();
        break;
      case 2:
        page = const TabControllerScreen();
        break;
      case 3:
        page = const FormValidationScreen();
        break;
      case 4:
        page = const StyleTextFieldScreen();
        break;
      case 5:
        page = const FocusTextFieldScreen();
        break;

      case 6:
        page = const HandleChangesTextFieldScreen();
        break;

      case 7:
        page = const ValueTextFieldScreen();
        break;

      case 8:
        page = const GridListScreen();
        break;

      case 9:
        page = const HorizontalListScreen();
        break;
      
      case 10:
        page = TypesofItemsScreen(items: List<ListItem>.generate(
          1000,
          (i) => i % 6 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i'),
          )
        );
        break;

      case 11:
        page = const ListSpacedItemsScreen();
        break;

      case 12:
        page = const FloatingAppbarScreen();
        break;

      case 13:
        page = const UseListScreen();
        break;

      case 14:
        page = LongListsScreen(items: List<String>.generate(10000, (i) => 'Item $i'),);
        break;
      default:
        throw UnimplementedError('no widget for ${appState.selectedIndex}');
    }

    return page; 
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final DrawerWidget getDrawer = DrawerWidget();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar')),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: Card(
          elevation: 2,
          child: TextButton(
            child: const Text('SnackBar'),
            onPressed: () {
              final snackBar = SnackBar(
                content: const Text('Hola, soy un SnackBar'),
                action: SnackBarAction(label: 'Cerrar', onPressed: () {
                  
                },),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}