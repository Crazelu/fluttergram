import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';
import 'shared.dart';

class FollowingHeader extends StatelessWidget {
  final bool guest;
  const FollowingHeader({Key? key, this.guest = false}) : super(key: key);

  String getGuestText(BuildContext context) {
    bool isFollowing = context
        .read<GuestProfileVM>()
        .isFollowingGuestUser(context.watch<HomeVM>().user.id);

    return isFollowing ? "Unfollow" : "Follow";
  }

  Color getColor(BuildContext context) {
    bool isFollowing = context
        .read<GuestProfileVM>()
        .isFollowingGuestUser(context.read<HomeVM>().user.id);

    return isFollowing
        ? Theme.of(context).highlightColor
        : Theme.of(context).primaryColor;
  }

  Future<void> onPressed(bool guest, BuildContext context) async {
    if (guest) {
      await context.read<GuestProfileVM>().followUser(
            currentUser: context.read<HomeVM>().user,
          );
    } else {
      locator<NavigationHandler>().pushNamed(ProfileUpdateViewRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    var homeVM;
    if (guest) {
      homeVM = context.watch<GuestProfileVM>();
    } else {
      homeVM = context.watch<HomeVM>();
    }
    return Padding(
      padding: kHorizontalPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: guest
                ? () {}
                : () {
                    locator<NavigationHandler>()
                        .pushNamed(ProfileUpdateViewRoute);
                  },
            child: Column(
              children: [
                Avatar(
                  size: 65.w,
                  url: guest ? homeVM.user.profileImage : null,
                ),
                const CustomSpacer(flex: 2),
                Text(
                  homeVM.user.userName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const CustomSpacer(flex: .8),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth(.3),
                  ),
                  child: Text(
                    homeVM.user.bio,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
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
                      text: '${homeVM.userPposts.length}',
                      title: 'posts',
                    ),
                    const Spacer(),
                    TabText(
                      text: '${homeVM.user.followers.length}',
                      title: 'followers',
                    ),
                    const Spacer(),
                    TabText(
                      text: '${homeVM.user.following.length}',
                      title: 'following',
                    ),
                  ],
                ),
              ),
              const CustomSpacer(),
              SizedBox(
                width: context.screenWidth(.6),
                child: CustomButton(
                  loading: homeVM.loading,
                  color: guest
                      ? getColor(context)
                      : Theme.of(context).primaryColor,
                  text: guest ? getGuestText(context) : "Edit Profile",
                  onPressed: () => onPressed(guest, context),
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
