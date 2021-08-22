import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttergram/models/user.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';
import 'package:uuid/uuid.dart';

class ProfileVM extends BaseViewModel {
  File? _pickedFile;
  File? get pickedFile => _pickedFile;

  Future<void> changeImage(UserModel user, [bool useCamera = false]) async {
    try {
      var userId = await storageService.read() ?? '';
      if (userId.isNotEmpty) {
        _pickedFile = await imagePickerService.pickImage(useCamera);

        var uuid = Uuid().v1();

        final ref = FirebaseStorage.instance.ref('images/$uuid.jpg');
        final upload = ref.putFile(_pickedFile!);

        var url = await (await upload).ref.getDownloadURL();

        final userRef = FirebaseFirestore.instance
            .collection('users')
            .withConverter<UserModel>(
              fromFirestore: (snapshot, _) => UserModel.fromMap(
                snapshot.data()!,
                snapshot.id,
              ),
              toFirestore: (user, _) => user.toMap(),
            );

        await userRef.doc(user.docId).update(user.copyWith(image: url).toMap());
      }
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  Future<void> updateProfile(UserModel user, String bio) async {
    try {
      var userId = await storageService.read() ?? '';
      if (userId.isNotEmpty) {
        toggleLoading(true);
        final ref = FirebaseFirestore.instance
            .collection('users')
            .withConverter<UserModel>(
              fromFirestore: (snapshot, _) => UserModel.fromMap(
                snapshot.data()!,
                snapshot.id,
              ),
              toFirestore: (user, _) => user.toMap(),
            );

        await ref.doc(user.docId).update(user.copyWith(bio: bio).toMap());

        navigationHandler.goBack();
      }
      toggleLoading(false);
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }
}
