import 'package:flutter/material.dart';

class TranslateButton extends StatelessWidget {
  final void Function() togglelanguage;
  const TranslateButton({super.key, required this.togglelanguage});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: togglelanguage, // Toggle between languages
    );
  }
}
