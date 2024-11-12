import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool?> showCustomDialog(BuildContext context, Widget content) async {
    return await showDialog<bool?>(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: content,
          ),
        );
      },
    );
  }
}
