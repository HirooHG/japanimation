import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xFF2f2f2f),
        ),
        child: Center(
            child: Text(
          "Japanimation",
          style: TextStyle(
            fontSize: 40,
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
        )));
  }
}
