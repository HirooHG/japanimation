import 'package:flutter/material.dart';

class CusAppBar extends StatelessWidget {
  const CusAppBar({super.key});

  final String title = "Japanimation";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2f2f2f),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Ubuntu",
          foreground: Paint()
            ..shader = const LinearGradient(
              colors: <Color>[
                Color(0xFF42d392),
                Color(0xFF4fb2bd),
                Color(0xFF5f8bee),
              ],
          ).createShader(const Rect.fromLTWH(0.0, 100.0, 350.0, 70.0)),
        ),
      ),
    );
  }
}
