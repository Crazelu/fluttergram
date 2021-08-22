import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergram/models/user.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class SignUpVM extends BaseViewModel {
  ///Registers a user with email and password credentials
  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      toggleLoading(true);
      User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        final ref = FirebaseFirestore.instance
            .collection('users')
            .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromMap(snapshot.data()!),
              toFirestore: (user, _) => user.toMap(),
            );

        await ref.add(UserModel(id: user.uid, userName: username));
      }

      toggleLoading(false);
      navigationHandler.pushNamed(FeedViewRoute);
    } on FirebaseAuthException catch (e) {
      AppLogger.logger.d(e.stackTrace);
      toggleLoading(false);
      if (e.code == 'weak-password') {
        dialogHandler.showDialog(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        dialogHandler.showDialog(
            message:
                'An account already exists for that email. Log in instead.');
      } else {
        dialogHandler.showDialog(message: e.message ?? 'Unknown error');
      }
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }
}
