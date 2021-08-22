import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class UserMediaView extends StatefulWidget {
  const UserMediaView({Key? key}) : super(key: key);

  @override
  _UserMediaViewState createState() => _UserMediaViewState();
}

class _UserMediaViewState extends State<UserMediaView> {
  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeVM>();
    return ResponsiveWidget(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        text: homeVM.user.userName,
        actions: [
          GestureDetector(
            onTap: () {
              homeVM.signOut();
            },
            child: Container(
              padding: EdgeInsets.only(right: 10.w),
              alignment: Alignment.center,
              child: Text(
                "Sign Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      builder: (size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const CustomSpacer(),
              const FollowingHeader(),
              const CustomSpacer(flex: 5),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: MediaTabView(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
