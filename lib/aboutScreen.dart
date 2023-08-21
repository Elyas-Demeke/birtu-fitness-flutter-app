import 'package:flutter/material.dart';

import 'main.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Flutter is fun!'),
      ),
      body: ElevatedButton(
        child: Text('MyApp'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MyApp(),
              ));
        },
      ),
    );
  }
}
