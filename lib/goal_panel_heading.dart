import 'package:aatma/color_configuration.dart';
import 'package:flutter/material.dart';

class GoalPanelHeading extends StatelessWidget {
  const GoalPanelHeading({
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

  // bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: isHovered
        // ? goalPanelElementColorSelected
        color: goalPanelElementColor,
        // borderRadius: isHovered
        // ? BorderRadius.all(Radius.circular(5))
        // : BorderRadius.all(Radius.circular(20))),
      ),
      height: height,
      width: width,
      child: Material(
        elevation: 30,
        color: goalPanelElementColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: goalPanelTextColor,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Text(text,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.height * .0125 * 1.25,
                      fontWeight: FontWeight.bold,
                      color: goalPanelTextColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
