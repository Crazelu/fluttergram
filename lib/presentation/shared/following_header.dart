import 'package:flutter/material.dart';
import 'shared.dart';

class FollowingHeader extends StatelessWidget {
  const FollowingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 45.w,
                backgroundColor: Colors.blueGrey,
              ),
              const CustomSpacer(flex: 2),
              Text("Johndoe"),
              const CustomSpacer(flex: .8),
              Text("Sample bio")
            ],
          ),
          const Spacer(),
          Column(
            children: [
              SizedBox(
                width: context.screenWidth(.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TabText(
                      text: '3',
                      title: 'posts',
                    ),
                    const Spacer(),
                    TabText(
                      text: '0',
                      title: 'followers',
                    ),
                    const Spacer(),
                    TabText(
                      text: '3',
                      title: 'following',
                    ),
                  ],
                ),
              ),
              const CustomSpacer(),
              SizedBox(
                width: context.screenWidth(.6),
                child: CustomButton(
                  color: Theme.of(context).highlightColor,
                  text: "Unfollow",
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TabText extends StatelessWidget {
  final String text;
  final String title;

  const TabText({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomSpacer(flex: .8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColorDark.withOpacity(.4),
          ),
        ),
      ],
    );
  }
}
