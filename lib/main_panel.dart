import 'package:aatma/color_configuration.dart';
import 'package:aatma/goal_panel.dart';
import 'package:aatma/report_panel.dart';
import 'package:flutter/material.dart';

class MainPanel extends StatelessWidget {
  const MainPanel({
    super.key,
    required this.screen,
  });

  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 40,
            // color: Colors.white,
            color: mainPanelColor,
            child: SizedBox(
              // padding: EdgeInsets.all(100),
              width: screen.width * .7,
              height: screen.height * .8,

              child: Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      GoalPanel(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth / 7,
                      ),
                      // Text('data')
                      ReportPanel()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
