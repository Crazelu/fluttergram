import 'package:flutter/material.dart';
import 'shared.dart';

class InstagramText extends StatelessWidget {
  final bool inAppBar;
  final double fontSize;

  const InstagramText({
    Key? key,
    this.inAppBar = false,
    this.fontSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inAppBar ? null : MediaQuery.of(context).size.width,
      child: Text(
        'Fluttergram',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontFamily: "Billabong",
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}
