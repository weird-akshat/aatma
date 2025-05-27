import 'package:aatma/chart_data.dart';
import 'package:aatma/color_configuration.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportPanel extends StatelessWidget {
  const ReportPanel({super.key});
  final double mult = .015;
  // TextStyle textStyle = TextStyle(f)
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Goal name',
                style: TextStyle(
                    color: goalPanelColor,
                    fontSize: MediaQuery.of(context).size.height * .03,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                height: constraints.maxHeight * .04,
                width: constraints.maxWidth * .8,
                decoration: BoxDecoration(
                    color: goalPanelColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                    ),
                    // TodoListWidget()
                  ],
                ),
              ),
            ),
            // Divider(
            //   color: Colors.black,
            // ),
            SizedBox(
              height: constraints.maxHeight * .03,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // print(constraints.maxHeight);
                  return SizedBox(
                    // width: constraints.maxWidth * .4,
                    // height: constraints.maxHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: SizedBox(
                              width: constraints.maxWidth * .4,
                              height: constraints.maxHeight,
                              child: SfCircularChart(
                                legend: Legend(isVisible: true),
                                series: [
                                  DoughnutSeries<ChartData, String>(
                                    innerRadius: '70%',
                                    strokeWidth: 0,
                                    dataSource: chartData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    explode: true,
                                    explodeGesture: ActivationMode.singleTap,
                                    // explodeIndex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: SizedBox(
                              width: constraints.maxWidth * .4,
                              height: constraints.maxHeight,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                series: [
                                  StackedLineSeries<ChartData, String>(
                                    dataSource: chartData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    // explode: true,
                                    // explodeGesture: ActivationMode.singleTap,
                                    // explodeIndex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: LayoutBuilder(
              builder: (context, constraints) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeSpentCard(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * .4,
                  ),
                  TimeSpentCard(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * .4,
                  ),
                ],
              ),
            ))
            // Expanded(
            //   child: Row(
            //     children: [Placeholder(), Placeholder()],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class TimeSpentCard extends StatelessWidget {
  const TimeSpentCard({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    double mul = .05;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TimeSpentRow(
                iconData: Icons.today,
                text: 'Time spent today',
                timespent: '3 hours 45 minutes',
                color: const Color.fromARGB(255, 12, 35, 54),
                fontSize: height * mul,
              ),
              TimeSpentRow(
                iconData: Icons.today,
                text: 'Time spent this week',
                timespent: '3 hours 45 minutes',
                color: const Color.fromARGB(255, 12, 35, 54),
                fontSize: height * mul,
              ),
              TimeSpentRow(
                iconData: Icons.today,
                text: 'Time spent this year',
                timespent: '3 hours 45 minutes',
                color: const Color.fromARGB(255, 12, 35, 54),
                fontSize: height * mul,
              ),
              TimeSpentRow(
                iconData: Icons.today,
                text: 'Total time spent',
                timespent: '3 hours 45 minutes',
                color: const Color.fromARGB(255, 12, 35, 54),
                fontSize: height * mul,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSpentRow extends StatelessWidget {
  const TimeSpentRow({
    super.key,
    required this.iconData,
    required this.text,
    required this.timespent,
    required this.color,
    required this.fontSize,
  });

  final IconData iconData;
  final String text;
  final String timespent;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(iconData),
          Text(
            "$text : ",
            style: TextStyle(color: color, fontSize: fontSize),
          ),
          Text(
            timespent,
            style: TextStyle(color: color, fontSize: fontSize),
          )
        ],
      ),
    );
  }
}
