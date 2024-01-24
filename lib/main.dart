import 'package:flutter/material.dart';
import 'package:flutter_rest_api/views/home_page_stateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'material app',
      home: HomePageStateful(),
    );
  }
}
