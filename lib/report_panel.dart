import 'package:aatma/color_configuration.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportPanel extends StatelessWidget {
  const ReportPanel({super.key});
  final double mult = .015;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Column(
            children: [
              Text(
                'Goal name',
                style: TextStyle(
                    color: goalPanelColor,
                    fontSize: MediaQuery.of(context).size.height * .06,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: constraints.maxHeight * .04,
                width: constraints.maxWidth * .9,
                decoration: BoxDecoration(
                    color: goalPanelColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Tasks Completed: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * mult),
                    ),
                    Text(
                      'Currently Active Tasks: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * mult),
                    ),
                    Text(
                      'Goal Status',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * mult),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
