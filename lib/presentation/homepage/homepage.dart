import 'package:custom_painter_learn/presentation/clock/clockview.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        color: ColorManager.darkSkyBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("data"),
            SizedBox(height: 32,),
            Text("data"),
            Text("data"),
             ClockView(),
          ],
        ),
      ),
    );
  }
}
