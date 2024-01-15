import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_firsts_apps_global_.dart';

class ListSpacedItemsScreen extends StatelessWidget {
  const ListSpacedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 20;
    final DrawerFirstsAppsWidget getDrawer = DrawerFirstsAppsWidget();

    return Scaffold(
      appBar: AppBar(title: const Text('List with Spaced Items')),
      drawer: getDrawer.getDrawer(context),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  items, (index) => ItemWidget(text: 'Item $index')),
            ),
          ),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}