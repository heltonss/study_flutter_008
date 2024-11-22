import 'package:flutter/material.dart';

class Util {
  static alert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        });
  }
}
