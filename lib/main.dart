import 'package:flutter/material.dart';

import 'pages/graph_page.dart';

void main() {
  runApp(const MyGraphApp());
}

class MyGraphApp extends StatelessWidget {
  const MyGraphApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const GraphPage(),
    );
  }
}
