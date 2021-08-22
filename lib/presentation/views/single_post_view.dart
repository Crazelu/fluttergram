import 'package:flutter/material.dart';
import 'package:fluttergram/models/post.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class SinglePostView extends StatelessWidget {
  final Post post;
  const SinglePostView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(text: "Photo"),
      builder: (_) {
        return ListView(
          children: [
            PostCard(
              post: post,
              inSingleView: true,
            ),
          ],
        );
      },
    );
  }
}
