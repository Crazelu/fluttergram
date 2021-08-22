import 'package:flutter/material.dart';
import 'package:fluttergram/models/comment.dart';
import 'shared.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Avatar(
            url: comment.userImageUrl,
            size: 30.w,
          ),
          const CustomSpacer(horizontal: true),
          SizedBox(
            width: context.screenWidth(.8),
            child: Text(
              comment.comment,
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
