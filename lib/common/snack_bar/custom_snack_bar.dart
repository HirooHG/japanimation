
import 'package:flutter/material.dart';

class CustomSnackBar {
  const CustomSnackBar.error({
    required this.content
  })
    : isError = true;

  const CustomSnackBar.notice({
    required this.content
  })
    : isError = false;

  final bool isError;
  final String content;

  SnackBar buildSnackBar(BuildContext context) {
    return SnackBar(
      content: Text(
        content,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface
        )
      ),
      backgroundColor: isError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.surface
    );
  }
}
