import 'package:flutter/material.dart';
import 'shared.dart';

class MediaTabView extends StatefulWidget {
  const MediaTabView({Key? key}) : super(key: key);

  @override
  _MediaTabViewState createState() => _MediaTabViewState();
}

class _MediaTabViewState extends State<MediaTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Theme.of(context).primaryColor,
          tabs: [
            Tab(
              child: Icon(
                Icons.window,
              ),
            ),
            Tab(
              child: Icon(
                Icons.reorder,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                children: [
                  Wrap(
                    spacing: 1.w,
                    children: [
                      Container(
                        height: 100.h,
                        width: context.screenWidth(.33),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      Container(
                        height: 100.h,
                        width: context.screenWidth(.33),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      Container(
                        height: 100.h,
                        width: context.screenWidth(.33),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                children: [
                  PostCard(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
