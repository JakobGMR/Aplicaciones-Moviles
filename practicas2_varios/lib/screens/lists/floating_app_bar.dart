import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';

class FloatingAppbarScreen extends StatelessWidget {
  const FloatingAppbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerWidget getDrawer = DrawerWidget();

    return Scaffold(
      drawer: getDrawer.getDrawer(context),
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: [
          // Add the app bar to the CustomScrollView.
          const SliverAppBar(
            // Provide a standard title.
            title: Text('Floating AppBar'),
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: Placeholder(),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 200,
          ),
            
            // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => ListTile(title: Text('Item #$index')),
              // Builds 1000 ListTiles
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}