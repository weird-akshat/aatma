import 'package:aatma/color_configuration.dart';
import 'package:aatma/goal_panel_element.dart';
import 'package:aatma/goal_panel_heading.dart';
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
    double div = 16;
    return Container(
      decoration: BoxDecoration(
        color: goalPanelColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      height: height,
      width: width,
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              GoalPanelHeading(
                  icon: Icons.task,
                  text: "Goal Panel",
                  height: height / div * 1.25,
                  width: width),
              Divider(
                color: Colors.white,
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.flag,
                text: "Report",
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.description,
                text: "Description",
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.note,
                text: "Plan",
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.book,
                text: "Journal",
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.error,
                text: "Problems",
              ),
              GoalPanelElement(
                width: width,
                height: height / div,
                icon: Icons.track_changes,
                text: "Manage Goal",
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
