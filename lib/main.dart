import 'package:flutter/material.dart';

import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: const Key('MyApp'),
        title: 'List Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView());
  }
}
