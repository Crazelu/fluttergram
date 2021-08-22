import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    final feedVM = context.watch<FeedVM>();
    return ResponsiveWidget(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const InstagramText(
          inAppBar: true,
        ),
      ),
      builder: (_) {
        return ListView.builder(
          itemCount: feedVM.posts.length,
          itemBuilder: (_, index) {
            return PostCard(
              post: feedVM.posts[index],
            );
          },
        );
      },
    );
  }
}
