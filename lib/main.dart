import 'package:flutter/material.dart';
import 'package:text_to_speech_test/home.dart';
import 'package:text_to_speech_test/pilihan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PilihanPage(),
    );
  }
}
