import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final bool automaticallyImplyLeading;
  final String text;

  CustomAppBar({
    required this.text,
    this.automaticallyImplyLeading = true,
  }) : super(
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
}
