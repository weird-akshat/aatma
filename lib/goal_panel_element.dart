import 'package:aatma/color_configuration.dart';
import 'package:flutter/material.dart';

class GoalPanelElement extends StatefulWidget {
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
  State<GoalPanelElement> createState() => _GoalPanelElementState();
}

class _GoalPanelElementState extends State<GoalPanelElement> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        decoration: BoxDecoration(
            color: isHovered
                ? goalPanelElementColorSelected
                : goalPanelElementColor,
            borderRadius: isHovered
                ? BorderRadius.all(Radius.circular(5))
                : BorderRadius.all(Radius.circular(20))),
        height: widget.height,
        width: widget.width,
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
                  widget.icon,
                  color: goalPanelTextColor,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .0225,
                        fontWeight: FontWeight.bold,
                        color: goalPanelTextColor),
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
