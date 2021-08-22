import 'package:flutter/material.dart';

class InstagramText extends StatelessWidget {
  final bool inAppBar;
  const InstagramText({Key? key, this.inAppBar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inAppBar ? null : MediaQuery.of(context).size.width,
      child: Text(
        'Instagram',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Billabong",
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}
