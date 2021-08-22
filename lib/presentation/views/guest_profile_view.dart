import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class GuestProfileView extends StatefulWidget {
  final String userId;

  const GuestProfileView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _GuestProfileViewState createState() => _GuestProfileViewState();
}

class _GuestProfileViewState extends State<GuestProfileView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final guestProfileVM = context.read<GuestProfileVM>();
      guestProfileVM.setUpSnapshotStreamSubscription(widget.userId);
      await guestProfileVM.getUserMedia(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final guestProfileVM = context.watch<GuestProfileVM>();
    return ResponsiveWidget(
      appBar: CustomAppBar(
        text: guestProfileVM.user.userName,
      ),
      builder: (size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const CustomSpacer(),
              const FollowingHeader(guest: true),
              const CustomSpacer(flex: 5),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: MediaTabView(guest: true),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
