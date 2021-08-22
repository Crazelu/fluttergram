import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final locationController = TextEditingController(text: 'Earth');
  final captionController = TextEditingController();

  Future<void> showCameraDialog() async {
    await showDialog(
      builder: (context) {
        final createPostVM = context.read<CreatePostVM>();
        return SimpleDialog(
          children: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await createPostVM.pickImage(true);
              },
              child: Text("Take picture"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await createPostVM.pickImage();
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
    final createPostVM = context.read<CreatePostVM>();
    final rxCreatePostVM = context.watch<CreatePostVM>();
    return ResponsiveWidget(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        text: "New Post",
        actions: [
          GestureDetector(
            onTap: () {
              createPostVM.createPost(
                caption: captionController.text,
                location: locationController.text,
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 10.w),
              alignment: Alignment.center,
              child: Text(
                "Share",
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
        return ListView(
          padding: kHorizontalPadding,
          children: [
            const CustomSpacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CustomSpacer(flex: 2.5),
                    Avatar(size: 32.w),
                  ],
                ),
                const CustomSpacer(horizontal: true),
                SizedBox(
                  width: size.width * .62,
                  child: CustomTextField(
                    hint: 'Write a caption...',
                    maxLines: 3,
                    controller: captionController,
                    transparent: true,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    const CustomSpacer(),
                    GestureDetector(
                      onTap: () async {
                        await showCameraDialog();
                      },
                      child: Container(
                        height: 50.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          image: rxCreatePostVM.pickedFile != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(rxCreatePostVM.pickedFile!),
                                )
                              : null,
                        ),
                        child: rxCreatePostVM.pickedFile == null
                            ? Icon(Icons.camera_alt)
                            : null,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const CustomSpacer(flex: 5),
            CustomTextField(
              prefix: Icon(Icons.gps_fixed),
              hint: 'Add location',
              controller: locationController,
            ),
            const CustomSpacer(flex: 3),
            if (rxCreatePostVM.loading)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
