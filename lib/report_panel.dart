import 'package:aatma/color_configuration.dart';
import 'package:flutter/material.dart';

class ReportPanel extends StatelessWidget {
  const ReportPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
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
              height: MediaQuery.of(context).size.height * .02,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('data'), Text('data'), Text('data')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
