import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/models/user.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class SearchVM extends BaseViewModel {
  List<UserModel> _users = [];
  List<UserModel> _sortedUsers = [];
  List<UserModel> get sortedUsers => _sortedUsers;

  late StreamSubscription _streamSubscription;

  ///Reference to collection on Cloud Firestore
  late Query _queryRef;
  Query get queryRef => _queryRef;

  void initializeQueryRef() {
    _queryRef = FirebaseFirestore.instance.collection('users');
  }

  void setUpSnapshotStreamSubscription() {
    try {
      initializeQueryRef();

      Stream<QuerySnapshot<Object?>> userStream = _queryRef.snapshots();

      _streamSubscription = userStream.listen(
        (querySnapshot) {
          _users = List<UserModel>.from(
            querySnapshot.docs.map(
              (doc) => UserModel.fromMap(
                doc.data() as Map<String, dynamic>,
                doc.id,
              ),
            ),
          );

          notifyListeners();
        },
      );
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  Future<void> search(String query) async {
    try {
      toggleLoading(true);

      _sortedUsers = _users
          .where((user) =>
              user.userName.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      notifyListeners();
      toggleLoading(false);
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
