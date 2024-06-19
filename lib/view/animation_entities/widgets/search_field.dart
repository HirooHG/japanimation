import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 50),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF42d392),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            cursorColor: const Color(0xFF42d392),
            style: const TextStyle(fontFamily: "Ubuntu"),
            onChanged: (value) {
              // TODO: implement cubit search
            },
            decoration: const InputDecoration(
                labelText: "Search",
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Ubuntu"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
      ),
    );
  }
}
