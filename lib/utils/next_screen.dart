import 'package:flutter/material.dart';

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false,
  );
}