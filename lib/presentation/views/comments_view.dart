import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class CommentsView extends StatefulWidget {
  final String postId;

  const CommentsView({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  _CommentsViewState createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await context.read<CommentVM>().getComments(widget.postId);
    });
  }

  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final commentVM = context.watch<CommentVM>();
    final homeVM = context.watch<HomeVM>();
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
                    itemCount: commentVM.comments.length,
                    itemBuilder: (_, index) {
                      return CommentCard(
                        comment: commentVM.comments[index],
                      );
                    }),
              ),
              CustomTextField(
                controller: commentController,
                hint: 'Write a comment..',
                suffix: IconButton(
                  onPressed: () async {
                    await context.read<CommentVM>().makeComment(
                          comment: commentController.text,
                          postId: widget.postId,
                          userName: homeVM.user.userName,
                          userImageUrl: homeVM.user.profileImage,
                        );

                    setState(() {
                      commentController.text = '';
                    });
                  },
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
