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
      backgroundColor: const Color.fromARGB(255, 16, 34, 49),
      body: Stack(children: [
        // Positioned.fill(
        //   child: Image.asset(
        //     'assets/images/background3.png',
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 40,
                color: Colors.white,
                child: SizedBox(
                  // padding: EdgeInsets.all(100),
                  width: screen.width * .8,
                  height: screen.height * .8,

                  child: Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Row(
                        children: [
                          GoalPandel(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth / 5,
                          ),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                children: [
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // ReflectionCard(
                                        //     width: constraints.maxWidth / 3.25,
                                        //     height: constraints.maxHeight / 5),
                                        // ReflectionCard(
                                        //     width: constraints.maxWidth / 3.25,
                                        //     height: constraints.maxHeight / 5),
                                        // ReflectionCard(
                                        //     width: constraints.maxWidth / 3.25,
                                        //     height: constraints.maxHeight / 5)
                                      ],
                                      // ReflectionCard(width: constraints.max,)
                                    ),
                                  ),
                                  Row(
                                    children: [],
                                  ),
                                  Row(
                                    children: [],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class GoalPandel extends StatelessWidget {
  const GoalPandel({
    required this.height,
    required this.width,
    super.key,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      child: ColoredBox(
        color: Color.fromARGB(255, 8, 25, 39),
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Report",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Description",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Plan",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Journal",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Problems",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Manage Goal",
                  ),
                  GoalPanelElement(
                    width: width,
                    height: height / 10,
                    icon: Icons.flag,
                    text: "Goal",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoalPanelElement extends StatelessWidget {
  const GoalPanelElement({
    required this.icon,
    required this.text,
    super.key,
    required this.height,
    required this.width,
  });
  final IconData icon;
  final String text;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          // color: Colors.white,
          height: height,
          width: width - 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .0225,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
