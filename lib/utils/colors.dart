import 'package:flutter/material.dart';

Gradient linearGradiente(BuildContext context) {
  return LinearGradient(
    colors: [
      Theme.of(context).colorScheme.secondaryContainer,
      Theme.of(context).colorScheme.primaryContainer,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
