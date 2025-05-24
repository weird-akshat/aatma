import 'package:aatma/configuration.dart';
// import 'package:aatma/goal_hierarchy_page.dart';

import 'package:aatma/goal_screen.dart';
import 'package:aatma/tree_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  initConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2(); // Important

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoalScreen(),
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      // theme: ThemeData.dark().copyWith(
      // scaffoldBackgroundColor: const Color.fromARGB(255, 46, 45, 45)),
    );
  }
}


//alright the idea is simple have a node class, with positions ofcourse
// then the algorithm to determine the positions of each
//