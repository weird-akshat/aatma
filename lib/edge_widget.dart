import 'package:flutter/material.dart';

//takes offset from and to to draw the lines
class EdgeWidget extends StatelessWidget {
  final Offset from;
  final Offset to;

  const EdgeWidget({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: LinePainter(p1: from, p2: to),
        size: Size.infinite,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  Offset p1, p2;
  LinePainter({required this.p1, required this.p2});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    // throw UnimplementedError();return start != oldDelegate.start ||
    return p1 != oldDelegate.p1 || p2 != oldDelegate.p2;
  }
}
