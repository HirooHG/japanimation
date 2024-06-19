import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const Field({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextField(
        keyboardType: TextInputType.phone,
        cursorColor: const Color(0xFF42d392),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF42d392))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF42d392))),
            label: Text(
              "$text :",
              style: const TextStyle(
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ),
    );
  }
}
