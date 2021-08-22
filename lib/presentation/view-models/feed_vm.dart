import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/models/post.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class FeedVM extends BaseViewModel {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  late Stream<QuerySnapshot> _postStream;
  Stream get postStream => _postStream;

  late String _userId;
  String get userId => _userId;

  late StreamSubscription _streamSubscription;

  ///Reference to collection on Cloud Firestore
  late Query _queryRef;
  Query get queryRef => _queryRef;

  initializeQueryRef() {
    _queryRef = FirebaseFirestore.instance.collection('posts');
  }

  Query initializeLastUserQueryRef(String id) {
    return FirebaseFirestore.instance.collection('users').where(
          'id',
          isEqualTo: id,
        );
  }

  Future<void> setUpSnapshotStreamSubscription() async {
    try {
      initializeQueryRef();

      _userId = await storageService.read() ?? '';

      Stream<QuerySnapshot<Object?>> postStream = _queryRef.snapshots();

      _streamSubscription = postStream.listen(
        (querySnapshot) {
          _posts = List<Post>.from(
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
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  bool isLiked(Post post) {
    return post.likers.contains(_userId);
  }

  Future<void> likePost(Post post) async {
    try {
      if (_userId.isNotEmpty) {
        final ref =
            FirebaseFirestore.instance.collection('posts').withConverter<Post>(
                  fromFirestore: (snapshot, _) => Post.fromMap(
                    snapshot.data()!,
                    snapshot.id,
                  ),
                  toFirestore: (post, _) => post.toMap(),
                );
        ref.doc(post.postId).update(post.addLike(userId).toMap());
      }
    } catch (e) {
      AppLogger.logger.d(e);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
