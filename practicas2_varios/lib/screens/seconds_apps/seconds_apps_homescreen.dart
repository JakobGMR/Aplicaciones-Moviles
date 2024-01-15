import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/home.dart';
import 'package:provider/provider.dart';

class SecondsAppsHomescreen extends StatefulWidget {
  const SecondsAppsHomescreen({super.key});

  @override
  State<SecondsAppsHomescreen> createState() => _SecondsAppsHomescreenState();
}

class _SecondsAppsHomescreenState extends State<SecondsAppsHomescreen> {  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();

    Widget page;
    switch (appState.selectedIndex) {
      case 0:
        page = const AnimateWidgetsScreen();
        break;

      case 1:
        page = const NavigateNewScreen();
        break;

      case 2:
        page = const NavigateNamedRoutesScreen();
        break;

      case 3:
        page = const PassArgumentsScreen(title: 'Pass arguments to a named route', message: 'Hola a todos',);
        break;

      case 4:
        page = const ReturnDataScreen();
        break;

      case 5:
        page = SendDataNewScreen(
          todos: List.generate(
            20,
            (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ),
          ),
        );
        break;

      // case 6:
      //   page = const StyleTextFieldScreen();
      //   break;

      // case 7:
      //   page = const FocusTextFieldScreen();
      //   break;

      // case 8:
      //   page = const HandleChangesTextFieldScreen();
      //   break;

      // case 9:
      //   page = const ValueTextFieldScreen();
      //   break;

      // case 10:
      //   page = const GridListScreen();
      //   break;

      // case 11:
      //   page = const HorizontalListScreen();
      //   break;
      
      // case 12:
      //   page = TypesofItemsScreen(items: List<ListItem>.generate(
      //     1000,
      //     (i) => i % 6 == 0
      //         ? HeadingItem('Heading $i')
      //         : MessageItem('Sender $i', 'Message body $i'),
      //     )
      //   );
      //   break;

      // case 13:
      //   page = const ListSpacedItemsScreen();
      //   break;

      // case 14:
      //   page = const FloatingAppbarScreen();
      //   break;

      // case 15:
      //   page = const UseListScreen();
      //   break;

      // case 16:
      //   page = LongListsScreen(items: List<String>.generate(10000, (i) => 'Item $i'),);
      //   break;
      default:
        throw UnimplementedError('no widget for ${appState.selectedIndex}');
    }

    return page; 
  }
}