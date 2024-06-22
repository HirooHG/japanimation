import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.sentiment_very_dissatisfied,
            size: 100, color: Color(0xFF42d392)),
        Text("Error loading data",
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                color: Color(0xFF42d392)))
      ],
    ));
  }
}
