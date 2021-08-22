import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';
import 'shared.dart';

class Avatar extends StatelessWidget {
  final String? url;
  final bool small;
  final double? size;

  const Avatar({
    Key? key,
    this.small = false,
    this.size,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeVM>();
    return Container(
      height: size ?? (small ? 85.w : 105.w),
      width: size ?? (small ? 85.w : 105.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url ?? homeVM.user.profileImage),
        ),
      ),
    );
  }
}
