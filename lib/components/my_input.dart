import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String label;
  final bool? obscureText;
  final void Function(String) onChanged;

  const MyInput(
      {super.key,
      required this.label,
      required this.obscureText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      autocorrect: false,
      enableSuggestions: false,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: label),
      onChanged: onChanged,
    );
  }
}
