
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Update",
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontWeight: FontWeight.bold
      )
    );
  }
}
