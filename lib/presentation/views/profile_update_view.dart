import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class ProfileUpdateView extends StatefulWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  _ProfileUpdateViewState createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends State<ProfileUpdateView> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  @override
  void initState() {
    super.initState();
    var homeVM = context.read<HomeVM>();
    nameController = TextEditingController(text: homeVM.user.userName);
    bioController = TextEditingController(text: homeVM.user.bio);
  }

  Future<void> showCameraDialog() async {
    await showDialog(
      builder: (context) {
        final homeVM = context.watch<HomeVM>();
        final profileVM = context.read<ProfileVM>();
        return SimpleDialog(
          children: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await profileVM.changeImage(homeVM.user, true);
              },
              child: Text("Take picture"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await profileVM.changeImage(homeVM.user);
              },
              child: Text("Choose from gallery"),
            ),
          ],
        );
      },
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeVM = context.watch<HomeVM>();
    final profileVM = context.read<ProfileVM>();
    return ResponsiveWidget(
      appBar: CustomAppBar(text: "Update Profile"),
      builder: (size) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                const CustomSpacer(),
                const Avatar(),
                const CustomSpacer(),
                GestureDetector(
                  onTap: () async {
                    await showCameraDialog();
                  },
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
                  label: 'Username',
                  hint: 'Username',
                  controller: nameController,
                ),
                const CustomSpacer(flex: 3),
                CustomTextField(
                  label: 'Bio',
                  hint: 'Bio',
                  maxLines: 4,
                  controller: bioController,
                ),
                const CustomSpacer(flex: 8),
                SizedBox(
                  width: size.width,
                  child: CustomButton(
                    loading: context.watch<ProfileVM>().loading,
                    text: 'Update',
                    onPressed: () {
                      profileVM.updateProfile(homeVM.user, bioController.text);
                    },
                  ),
                ),
                const CustomSpacer(flex: 3),
              ],
            ),
          ),
        );
      },
    );
  }
}
