import 'package:flutter/material.dart';
import 'package:practicas2_varios/helpers/drawer_global.dart';

class ListSpacedItemsScreen extends StatelessWidget {
  const ListSpacedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 20;
    final DrawerWidget getDrawer = DrawerWidget();

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