import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class SinglePostView extends StatelessWidget {
  const SinglePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(text: "Photo"),
      builder: (_) {
        return ListView(
          children: [
            const PostCard(
              inSingleView: true,
            ),
          ],
        );
      },
    );
  }
}
