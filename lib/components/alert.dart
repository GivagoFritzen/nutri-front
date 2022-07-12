import 'package:flutter/material.dart';

class Alert {
  static SnackBar message(String text) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
    );
  }
}
