import 'package:flutter/material.dart';
import 'package:practicas2_varios/providers/main_provider.dart';
import 'package:practicas2_varios/screens/firts_apps/firsts_apps_homescreen.dart';
import 'package:practicas2_varios/screens/seconds_apps/seconds_apps_homescreen.dart';
import 'package:practicas2_varios/screens/third_apps/third_apps_homescreen.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainProvider>();

    return SafeArea(child: Container(
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selecciona la tarea', style: Theme.of(context).textTheme.displaySmall,),

            const SizedBox(height: 50,),

            TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20
                )),
                backgroundColor: MaterialStatePropertyAll(Colors.grey)
              ),
              onPressed: () {
                appState.selectedIndex = 0; // Para evitar posibles problemas y mandar siempre al primer screen
                // Cambiar de pantalla
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirtsAppsHomescreen()));
              },
              child: const Text(
                'Design, Forms & Lists', 
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
        
            const SizedBox(height: 30,),
        
            TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 10, horizontal: 10
                )),
                backgroundColor: MaterialStatePropertyAll(Colors.grey)
              ),
              onPressed: () {
                appState.selectedIndex = 0; // Para evitar posibles problemas y mandar siempre al primer screen
                // Cambiar de pantalla
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondsAppsHomescreen()));
              },
              child: const Text(
                textAlign: TextAlign.center,
                'Navigation, Networking & Persistence',
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
            ),
        
            const SizedBox(height: 30,),
        
            TextButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 20, horizontal: 1
                )),
                backgroundColor: MaterialStatePropertyAll(Colors.grey)
              ),
              onPressed: () {
                appState.selectedIndex = 0; // Para evitar posibles problemas y mandar siempre al primer screen
                // Cambiar de pantalla
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdAppsHomescreen()));
              },
              child: const Text(
                textAlign: TextAlign.center,
                'Animation, Effects & Gestures',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}