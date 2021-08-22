import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class LoginVM extends BaseViewModel {
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      toggleLoading(true);

      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        await storageService.store(value: user.uid);
      }

      toggleLoading(false);

      navigationHandler.pushNamed(HomeViewRoute);
    } on FirebaseAuthException catch (e) {
      AppLogger.logger.d(e);
      toggleLoading(false);
      if (e.code == 'user-not-found') {
        dialogHandler.showDialog(
            message: 'No user found for that email. Sign up instead.');
      } else if (e.code == 'wrong-password') {
        dialogHandler.showDialog(message: 'Incorrect password');
      } else {
        dialogHandler.showDialog(message: e.message ?? "Unknwon error");
      }
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }
}
