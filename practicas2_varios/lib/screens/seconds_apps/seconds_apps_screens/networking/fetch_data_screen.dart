import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

Future<Album1> fetchAlbum1() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album1.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album1 {
  final int userId;
  final int id;
  final String title;

  const Album1({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album1.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album1(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  late Future<Album1> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum1();
  }

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: FutureBuilder<Album1>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Id: ${snapshot.data!.id} \n'
                'User Id: ${snapshot.data!.userId} \n'
                'Título: ${snapshot.data!.title}' 
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}