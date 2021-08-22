import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/models/comment.dart';
import 'package:fluttergram/presentation/view-models/base_view_model.dart';
import 'package:fluttergram/utils/utils.dart';

class CommentVM extends BaseViewModel {
  List<Comment> _comments = [];
  List<Comment> get comments => _comments;

  Future<void> getComments(String postId) async {
    try {
      _comments = [];
      toggleLoading(true);

      final commentRef = FirebaseFirestore.instance
          .collection('comments')
          .withConverter<Comment>(
            fromFirestore: (snapshot, _) => Comment.fromMap(snapshot.data()!),
            toFirestore: (comment, _) => comment.toMap(),
          );

      commentRef.where('postId', isEqualTo: postId).get().then(
        (value) {
          _comments = List<Comment>.from(
            value.docs.map(
              (doc) => doc.data(),
            ),
          );
          notifyListeners();
        },
      );

      toggleLoading(false);
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }

  Future<void> makeComment({
    required String comment,
    required String postId,
    required String userName,
    required String userImageUrl,
  }) async {
    try {
      toggleLoading(true);

      final commentRef = FirebaseFirestore.instance
          .collection('comments')
          .withConverter<Comment>(
            fromFirestore: (snapshot, _) => Comment.fromMap(snapshot.data()!),
            toFirestore: (comment, _) => comment.toMap(),
          );

      await commentRef.add(Comment(
        postId: postId,
        userName: userName,
        comment: comment,
        userImageUrl: userImageUrl,
      ));

      await getComments(postId);

      toggleLoading(false);
    } catch (e) {
      toggleLoading(false);
      AppLogger.logger.d(e);
    }
  }
}
