import 'package:flutter/material.dart';
import 'package:fluttergram/models/post.dart';
import 'package:fluttergram/presentation/view-models/feed_vm.dart';
import 'shared.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool inSingleView;

  const PostCard({
    Key? key,
    required this.post,
    this.inSingleView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          //user's info
          Padding(
            padding: kHorizontalPadding,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    locator<NavigationHandler>().pushNamed(
                      GuestProfileViewRoute,
                      arg: post.userId,
                    );
                  },
                  child: Avatar(
                    url: post.userImageUrl,
                    size: 32.w,
                  ),
                ),
                const CustomSpacer(horizontal: true),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.screenWidth(.45),
                      child: Text(
                        post.userName,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth(.45),
                      child: Text(
                        post.location,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(.6),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryColorDark.withOpacity(.6),
                )
              ],
            ),
          ),
          const CustomSpacer(),
          //posted image
          Container(
            height: inSingleView ? 200.h : 150.h,
            width: context.screenWidth(),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(post.imageUrl),
              ),
            ),
          ),
          const CustomSpacer(),

          //like icon row
          Padding(
            padding: kHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<FeedVM>().likePost(post);
                      },
                      child: Icon(
                        context.watch<FeedVM>().isLiked(post)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: context.watch<FeedVM>().isLiked(post)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context)
                                .primaryColorDark
                                .withOpacity(.6),
                        size: 20.w,
                      ),
                    ),
                    const CustomSpacer(horizontal: true),
                    GestureDetector(
                      onTap: () {
                        locator<NavigationHandler>().pushNamed(
                          CommentsViewRoute,
                          arg: post.postId,
                        );
                      },
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 20.w,
                        color:
                            Theme.of(context).primaryColorDark.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
                const CustomSpacer(flex: 1.5),
                Text("${post.likers.length} likes")
              ],
            ),
          ),
          const CustomSpacer(flex: 1),
          //caption
          Padding(
            padding: kHorizontalPadding,
            child: SizedBox(
              width: context.screenWidth(),
              child: RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  children: [
                    TextSpan(
                      text: '${post.userName} ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    TextSpan(text: post.caption),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
