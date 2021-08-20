import 'package:flutter/material.dart';
import 'shared.dart';

class CtaText extends StatelessWidget {
  final String desc;
  final String cta;
  final VoidCallback onTap;

  const CtaText({
    Key? key,
    required this.desc,
    required this.cta,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 3.w,
        children: [
          Text(
            desc,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              cta,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
