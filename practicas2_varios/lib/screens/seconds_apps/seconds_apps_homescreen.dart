import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/home.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/communicate_websockets_screen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/delete_data_internet_screen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/fetch_data_screen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/make_authenticated_requests_screen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/send_data_internet_screen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_screens/networking/update_data_internet_screen.dart';
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
        page = const ArgumentsNamedRouteScreen();
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

      case 6:
        page = const FetchDataScreen();
        break;

      case 7:
        page = const MakeAuthenticatedScreen();
        break;

      case 8:
        page = const SendDataInternetScreen ();
        break;

      case 9:
        page = const UpdateDataInternetScreen();
        break;

      case 10:
        page = const DeleteDataInternetScreen();
        break;

      case 11:
        page = const CommunicateWebsocketsScreen();
        break;
      
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