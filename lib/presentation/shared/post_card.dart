import 'package:flutter/material.dart';
import 'shared.dart';

final kHorizontalPadding = EdgeInsets.symmetric(horizontal: 10.w);

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

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
                CircleAvatar(
                  radius: 17.w,
                  backgroundColor: Colors.pink,
                ),
                const CustomSpacer(horizontal: true),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.screenWidth(.45),
                      child: Text(
                        'Johndoe',
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
                        'New York City',
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
            height: 150.h,
            width: context.screenWidth(),
            decoration: BoxDecoration(
              color: Colors.blue,
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
                      onTap: () {},
                      child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                const CustomSpacer(flex: 1),
                Text("2 likes")
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
                      text: "JohnDoe ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    TextSpan(text: "Some caption"),
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
