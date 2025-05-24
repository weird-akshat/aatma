import 'package:aatma/color_configuration.dart';
import 'package:aatma/goal_panel_element.dart';
import 'package:flutter/material.dart';

class GoalPanel extends StatelessWidget {
  const GoalPanel({
    required this.height,
    required this.width,
    super.key,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: goalPanelColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: height,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.flag,
                  text: "Report",
                ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.description,
                  text: "Description",
                ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.note,
                  text: "Plan",
                ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.book,
                  text: "Journal",
                ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.error,
                  text: "Problems",
                ),
                GoalPanelElement(
                  width: width,
                  height: height / 10,
                  icon: Icons.track_changes,
                  text: "Manage Goal",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
