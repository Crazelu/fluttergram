import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final bool automaticallyImplyLeading;
  final String text;
  final List<Widget> actions;

  CustomAppBar({
    required this.text,
    this.automaticallyImplyLeading = true,
    this.actions = const [],
  }) : super(
          actions: actions,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
}
