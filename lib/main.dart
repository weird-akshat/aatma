import 'package:aatma/tree_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TreeScreen(),
      // theme: ThemeData.dark().copyWith(
      // scaffoldBackgroundColor: const Color.fromARGB(255, 46, 45, 45)),
    );
  }
}


//alright the idea is simple have a node class, with positions ofcourse
// then the algorithm to determine the positions of each
//