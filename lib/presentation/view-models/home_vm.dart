import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/models/post.dart';
import 'package:fluttergram/models/user.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class HomeVM extends BaseViewModel {
  List<Post> _userPosts = [];
  List<Post> get userPposts => _userPosts;
  UserModel _user = UserModel(id: "", userName: "");
  UserModel get user => _user;

  late StreamSubscription _streamSubscription;
  late StreamSubscription _userPostStreamSubscription;

  ///Reference to collection on Cloud Firestore
  late Query _queryRef;
  Query get queryRef => _queryRef;

  Future<void> initializeQueryRef() async {
    var userId = await storageService.read() ?? '';
    _queryRef = FirebaseFirestore.instance.collection('users').where(
          'id',
          isEqualTo: userId,
        );
  }

  Future<void> setUpSnapshotStreamSubscription() async {
    try {
      await initializeQueryRef();

      Stream<QuerySnapshot<Object?>> userStream = _queryRef.snapshots();

      _streamSubscription = userStream.listen(
        (querySnapshot) {
          _user = UserModel.fromMap(
            querySnapshot.docs.first.data() as Map<String, dynamic>,
            querySnapshot.docs.first.id,
          );
          notifyListeners();
        },
      );
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  Future<void> getUserMedia() async {
    try {
      toggleLoading(true);
      final userId = await storageService.read() ?? '';

      if (userId.isNotEmpty) {
        final queryRef = FirebaseFirestore.instance.collection('posts').where(
              'userId',
              isEqualTo: userId,
            );

        Stream<QuerySnapshot<Object?>> postStream = queryRef.snapshots();

        _userPostStreamSubscription = postStream.listen(
          (querySnapshot) {
            _userPosts = List<Post>.from(
              querySnapshot.docs.map(
                (doc) {
                  return Post.fromMap(
                    doc.data() as Map<String, dynamic>,
                    doc.id,
                  );
                },
              ),
            );
            notifyListeners();
          },
        );
      }

      toggleLoading(false);
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _userPostStreamSubscription.cancel();
    super.dispose();
  }
}
