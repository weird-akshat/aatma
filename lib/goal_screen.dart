import 'package:aatma/color_configuration.dart';
import 'package:aatma/main_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: goalScreenColor,
      // backgroundColor: const Color.fromARGB(255, 16, 34, 49),
      body: Stack(children: [
        CustomBackground()
        // Positioned.fill(
        //     left: screen.width * .7,
        //     top: 0,
        //     bottom: screen.height * .5,
        //     right: screen.width * 0,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         borderRadius:
        //             BorderRadius.only(bottomLeft: Radius.circular(50)),
        //         color: goalPanelColor,
        //       ),
        //     )),
        // Positioned.fill(
        //     left: 0,
        //     top: screen.height * .85,
        //     bottom: 0,
        //     right: screen.width * 0,
        //     child: Container(
        //       decoration: BoxDecoration(
        //         // borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
        //         color: goalPanelColor,
        //       ),
        //     )),
        ,
        MainPanel(screen: screen)
      ]),
    );
  }
}

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff1E1F2F),
            const Color(0xff1E1F2F).withOpacity(0.8),
            const Color(0xff2A2B3D),
          ],
        ),
      ),
      child: CustomPaint(
        painter: BackgroundPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.03);

    // Draw subtle geometric shapes in corners
    // Top-left corner circles
    canvas.drawCircle(
      Offset(-50, -50),
      80,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.05),
      40,
      paint,
    );

    // Bottom-right corner shapes
    canvas.drawCircle(
      Offset(size.width + 30, size.height + 30),
      60,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.95),
      35,
      paint,
    );

    // Subtle lines for additional texture
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withOpacity(0.02)
      ..strokeWidth = 1;

    // Diagonal lines in corners
    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width * 0.3, 0),
      linePaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.7, size.height),
      Offset(size.width, size.height * 0.7),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Usage example with elevated panel
class BackgroundWithPanel extends StatelessWidget {
  const BackgroundWithPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Custom background
          const CustomBackground(),

          // Elevated panel in the center
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 500,
              ),
              child: Card(
                elevation: 12,
                shadowColor: Colors.black.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Your Content Here',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1F2F),
                      ),
                    ),
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
