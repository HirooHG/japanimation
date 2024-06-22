import 'package:flutter/material.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';

class EmptyList extends StatelessWidget {
  const EmptyList.small({super.key, required this.option}) : isSmall = true;
  const EmptyList.big({super.key, required this.option}) : isSmall = false;

  final bool isSmall;
  final Options option;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isSmall)
            const Icon(Icons.sentiment_dissatisfied,
                size: 100, color: Color(0xFF42d392)),
          Text("No ${option.name} available",
              style: TextStyle(
                  fontSize: isSmall ? 14 : 20,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF42d392)))
        ],
      ),
    );
  }
}
