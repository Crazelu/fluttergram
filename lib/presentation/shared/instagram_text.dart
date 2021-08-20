import 'package:flutter/material.dart';

class InstagramText extends StatelessWidget {
  const InstagramText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Instagram',
        textAlign: TextAlign.center,
      ),
    );
  }
}
