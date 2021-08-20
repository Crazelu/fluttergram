import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class UserMediaView extends StatefulWidget {
  const UserMediaView({Key? key}) : super(key: key);

  @override
  _UserMediaViewState createState() => _UserMediaViewState();
}

class _UserMediaViewState extends State<UserMediaView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        text: "Johndoe",
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
