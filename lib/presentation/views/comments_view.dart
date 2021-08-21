import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key}) : super(key: key);

  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(
        text: "Comments",
      ),
      builder: (size) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h) +
              EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return CommentCard();
                    }),
              ),
              CustomTextField(
                controller: commentController,
                hint: 'Write a comment..',
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
