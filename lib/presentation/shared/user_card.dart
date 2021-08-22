import 'package:flutter/material.dart';
import 'package:fluttergram/models/user.dart';
import 'shared.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationHandler>().pushNamed(
          GuestProfileViewRoute,
          arg: user.id,
        );
      },
      child: Padding(
        padding: kHorizontalPadding,
        child: Row(
          children: [
            Avatar(url: user.profileImage, size: 45.w),
            const CustomSpacer(horizontal: true),
            SizedBox(
              width: context.screenWidth(.65),
              child: Text(
                user.userName,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
