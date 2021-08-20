import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String text;

  CustomAppBar({required this.text})
      : super(
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
}
