import 'dart:async';
import 'dart:math';

import 'package:custom_painter_learn/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var datetime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centreX = size.width / 2;
    var centreY = size.height / 2;
    var centre = Offset(centreX, centreY);
    var radius = min(centreX, centreY);

    var degreePerSec = datetime.second * 6;
    var degreePerMin = datetime.minute * 6;
    var degreePerHour = datetime.hour * 30 + datetime.minute * 0.5;

    /// clock body brushes
    var fillBrush = Paint()..color = ColorManager.indigoDye;
    var outlineBrush = Paint()
      ..color = ColorManager.darkBlueGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centreFillBrush = Paint()..color = ColorManager.darkBlueGrey;

    /// clock hand brushes
    var secHandBrush = Paint()
      ..shader = RadialGradient(
              colors: [ColorManager.secGradient1, ColorManager.secGradient2])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    var minHandBrush = Paint()
      ..shader = RadialGradient(
              colors: [ColorManager.minGradient1, ColorManager.minGradient2])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(
              colors: [ColorManager.hourGradient1, ColorManager.hourGradient2])
          .createShader(Rect.fromCircle(center: centre, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;

    /// dash brush
    var dashBrush = Paint()
      ..color = ColorManager.darkBlueGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(centre, radius - 40, fillBrush);
    canvas.drawCircle(centre, radius - 40, outlineBrush);

    var hourHandX = centreX + 60 * cos(degreePerHour * pi / 180);
    var hourHandY = centreY + 60 * sin(degreePerHour * pi / 180);
    canvas.drawLine(centre, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centreX + 80 * cos(degreePerMin * pi / 180);
    var minHandY = centreY + 80 * sin(degreePerMin * pi / 180);
    canvas.drawLine(centre, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centreX + 80 * cos(degreePerSec * pi / 180);
    var secHandY = centreY + 80 * sin(degreePerSec * pi / 180);
    canvas.drawLine(centre, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(centre, 16, centreFillBrush);

    /// outer dashes circle
    var outerCircleRadius = radius -55;
    var innerCircleRadius = radius - 65;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centreX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centreY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centreX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centreY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

    }

    var outerCircleRadiusForHour = radius -55;
    var innerCircleRadiusForHour = radius - 75;
    for (double i = 0; i < 360; i += 30) {
      var x1 = centreX + outerCircleRadiusForHour * cos(i * pi / 180);
      var y1 = centreY + outerCircleRadiusForHour * sin(i * pi / 180);

      var x2 = centreX + innerCircleRadiusForHour * cos(i * pi / 180);
      var y2 = centreY + innerCircleRadiusForHour * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
