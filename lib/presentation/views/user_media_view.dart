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
