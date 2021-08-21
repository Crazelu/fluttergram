import 'package:flutter/material.dart';
import 'shared.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16.w,
          ),
          const CustomSpacer(horizontal: true),
          SizedBox(
            width: context.screenWidth(.8),
            child: Text(
              "Hello",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
