import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttergram/models/post.dart';
import 'package:fluttergram/models/user.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';
import 'package:uuid/uuid.dart';

class CreatePostVM extends BaseViewModel {
  File? _pickedFile;
  File? get pickedFile => _pickedFile;

  Future<void> pickImage([bool camera = false]) async {
    try {
      _pickedFile = await imagePickerService.pickImage(camera);
      notifyListeners();
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  Future<void> createPost({
    required String caption,
    String location = "Earth",
  }) async {
    try {
      if (_pickedFile == null) {
        dialogHandler.showDialog(message: "Pick an image to continue");
        return;
      }

      var userId = await storageService.read();

      if (userId != null && userId.isNotEmpty) {
        toggleLoading(true);

        var user;

        //get user record associcated with userId
        final userRef = FirebaseFirestore.instance
            .collection('users')
            .withConverter<UserModel>(
              fromFirestore: (snapshot, _) => UserModel.fromMap(
                snapshot.data()!,
                snapshot.id,
              ),
              toFirestore: (user, _) => user.toMap(),
            );

        userRef.where('id', isEqualTo: userId).get().then(
          (value) {
            user = value.docs.first.data();
          },
        );

        final postImageUrl = await uploadImage();

        final ref =
            FirebaseFirestore.instance.collection('posts').withConverter<Post>(
                  fromFirestore: (snapshot, _) => Post.fromMap(
                    snapshot.data()!,
                    snapshot.id,
                  ),
                  toFirestore: (user, _) => user.toMap(),
                );

        await ref.add(
          Post(
            caption: caption,
            userId: userId,
            location: location,
            userName: user.userName,
            imageUrl: postImageUrl,
            userImageUrl: user.profileImage,
          ),
        );

        _pickedFile = null;
        notifyListeners();
        toggleLoading(false);
        navigationHandler.pushReplacementNamed(HomeViewRoute);
      }
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }

  Future<String> uploadImage() async {
    try {
      var uuid = Uuid().v1();
      final ref = FirebaseStorage.instance.ref('images/$uuid.jpg');
      final upload = ref.putFile(_pickedFile!);

      return await (await upload).ref.getDownloadURL();
    } catch (e) {
      AppLogger.logger.d(e);
      return '';
    }
  }
}
