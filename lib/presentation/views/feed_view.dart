import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (_, index) {
            return PostCard();
          },
        );
      },
    );
  }
}
