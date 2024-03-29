import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

Future<Album2> fetchAlbum2() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );
  
  final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

  return Album2.fromJson(responseJson);
}

class Album2 {
  final int userId;
  final int id;
  final String title;

  const Album2({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album2.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album2(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class MakeAuthenticatedScreen extends StatefulWidget {
  const MakeAuthenticatedScreen({super.key});

  @override
  State<MakeAuthenticatedScreen> createState() => _MakeAuthenticatedScreenState();
}

class _MakeAuthenticatedScreenState extends State<MakeAuthenticatedScreen> {
  late Future<Album2> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum2();
  }

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Authenticated Request'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Center(
        child: FutureBuilder<Album2>(
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