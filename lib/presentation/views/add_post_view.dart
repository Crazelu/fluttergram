import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final locationController = TextEditingController();
  final captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: CustomAppBar(
        text: "New Post",
        actions: [
          GestureDetector(
            onTap: () {},
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
                    CircleAvatar(
                      radius: 15.w,
                    ),
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
                    Container(
                      height: 50.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
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
          ],
        );
      },
    );
  }
}
