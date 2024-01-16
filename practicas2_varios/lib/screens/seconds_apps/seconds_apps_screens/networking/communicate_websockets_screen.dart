import 'package:flutter/material.dart';
import 'package:practicas2_varios/widgets/drawer_seconds_apps_global.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CommunicateWebsocketsScreen extends StatefulWidget {
  const CommunicateWebsocketsScreen({
    super.key,
  });

  @override
  State<CommunicateWebsocketsScreen> createState() => _CommunicateWebsocketsScreenState();
}

class _CommunicateWebsocketsScreenState extends State<CommunicateWebsocketsScreen> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  @override
  Widget build(BuildContext context) {
    DrawerSecondsAppsWidget getDrawer = DrawerSecondsAppsWidget();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Communicate with WebSockets'),
      ),
      drawer: getDrawer.getDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}