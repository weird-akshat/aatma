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
                    fontWeight: FontWeight.w900),
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
                        Card(
                          child: SizedBox(
                            width: constraints.maxWidth * .4,
                            height: constraints.maxHeight,
                            child: SfCircularChart(
                              legend: Legend(isVisible: true),
                              series: [
                                PieSeries<ChartData, String>(
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
                        Card(
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
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.2),
                      child: Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth * 0.4,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTimeStatRow(
                              "Time spent today:",
                              "2h 30m",
                              constraints.maxHeight * 0.08,
                              FontWeight.bold,
                              Colors.blue.shade700,
                            ),
                            _buildTimeStatRow(
                              "Time spent this week:",
                              "12h 45m",
                              constraints.maxHeight * 0.06,
                              FontWeight.w600,
                              Colors.green.shade700,
                            ),
                            _buildTimeStatRow(
                              "Time spent this month:",
                              "45h 20m",
                              constraints.maxHeight * 0.05,
                              FontWeight.w500,
                              Colors.orange.shade700,
                            ),
                            _buildTimeStatRow(
                              "Time spent this year:",
                              "320h 15m",
                              constraints.maxHeight * 0.05,
                              FontWeight.w500,
                              Colors.purple.shade700,
                            ),
                            _buildTimeStatRow(
                              "Total time spent:",
                              "1,250h 30m",
                              constraints.maxHeight * 0.05,
                              FontWeight.w600,
                              Colors.red.shade700,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 50, child: TodoListWidget())
                    // _buildTasksCard(context)
                    // Text('data'),
                    // StatelessTodoShowpiece()
                  ],
                ),
              ),
            ),

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

// / Helper method to build consistent time stat rows
Widget _buildTimeStatRow(
  String label,
  String value,
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
  );
}
