import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class ProfileUpdateView extends StatefulWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  _ProfileUpdateViewState createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends State<ProfileUpdateView> {
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(text: "Update Profile"),
      builder: (size) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            const CustomSpacer(),
            CircleAvatar(
              radius: 55.w,
              backgroundColor: Colors.grey,
            ),
            const CustomSpacer(),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: size.width,
                child: Text(
                  "Change Photo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const CustomSpacer(flex: 10),
            CustomTextField(
              readOnly: true,
              hint: 'Username',
              controller: nameController,
            ),
            const CustomSpacer(flex: 3),
            CustomTextField(
              hint: 'Bio',
              maxLines: 4,
              controller: bioController,
            ),
            const CustomSpacer(flex: 8),
            CustomButton(
              text: 'Update',
              onPressed: () {},
            ),
            const CustomSpacer(flex: 3),
          ],
        );
      },
    );
  }
}
