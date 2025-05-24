import 'package:aatma/color_configuration.dart';
import 'package:aatma/main_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 16, 34, 49),
      body: Stack(children: [
        Positioned.fill(
            left: screen.width * .5,
            top: 0,
            bottom: screen.height * .2,
            right: screen.width * 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                color: goalScreenColor,
              ),
            )),
        Positioned.fill(
            left: 0,
            top: screen.height * 0,
            bottom: 0,
            right: screen.width * .95,
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                color: goalScreenColor,
              ),
            )),
        MainPanel(screen: screen)
      ]),
    );
  }
}

class ReflectionCard extends StatelessWidget {
  final double width;
  final double height;
  const ReflectionCard({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
