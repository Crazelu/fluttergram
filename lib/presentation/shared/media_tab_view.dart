import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';
import 'shared.dart';

class MediaTabView extends StatefulWidget {
  final bool guest;
  const MediaTabView({Key? key, this.guest = false}) : super(key: key);

  @override
  _MediaTabViewState createState() => _MediaTabViewState();
}

class _MediaTabViewState extends State<MediaTabView> {
  @override
  Widget build(BuildContext context) {
    var homeVM;
    if (widget.guest) {
      homeVM = context.watch<GuestProfileVM>();
    } else {
      homeVM = context.watch<HomeVM>();
    }
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
                  if (homeVM.userPposts.isEmpty) ...{
                    const CustomSpacer(flex: 15),
                    SizedBox(
                      width: context.screenWidth(),
                      child: Text(
                        "User has not made any post",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  },
                  Wrap(
                    spacing: 1.w,
                    children: [
                      for (var post in homeVM.userPposts)
                        GestureDetector(
                          onTap: () {
                            locator<NavigationHandler>().pushNamed(
                              SinglePostViewRoute,
                              arg: post,
                            );
                          },
                          child: Container(
                            height: 100.h,
                            width: context.screenWidth(.33),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  post.imageUrl,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                ],
              ),
              if (homeVM.userPposts.isEmpty) ...{
                Column(
                  children: [
                    const CustomSpacer(flex: 15),
                    SizedBox(
                      width: context.screenWidth(),
                      child: Text(
                        "User has not made any post",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                )
              } else
                ListView.builder(
                  itemCount: homeVM.userPposts.length,
                  itemBuilder: (_, index) {
                    return PostCard(post: homeVM.userPposts[index]);
                  },
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                ),
            ],
          ),
        )
      ],
    );
  }
}
