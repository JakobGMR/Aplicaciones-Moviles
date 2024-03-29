import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicas2_varios/widgets/drawer_apps_global_.dart';

Future<Album3> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album3.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album3 {
  final int id;
  final String title;

  const Album3({required this.id, required this.title});

  factory Album3.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Album3(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class SendDataInternetScreen extends StatefulWidget {
  const SendDataInternetScreen({super.key});

  @override
  State<SendDataInternetScreen> createState() {
    return _SendDataInternetScreenState();
  }
}

class _SendDataInternetScreenState extends State<SendDataInternetScreen> {
  final TextEditingController _controller = TextEditingController();
  Future<Album3>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    DrawerAppsWidget getDrawer = DrawerAppsWidget(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album3> buildFutureBuilder() {
    return FutureBuilder<Album3>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Id: ${snapshot.data!.id} \n'
                      'Title: ${snapshot.data!.title}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}