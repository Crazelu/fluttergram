class Comment {
  final String postId;
  final String userName;
  final String userImageUrl;
  final String comment;

  Comment({
    required this.postId,
    required this.userName,
    this.userImageUrl = '',
    required this.comment,
  });

  factory Comment.fromMap(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      userName: json['userName'],
      comment: json['comment'],
      userImageUrl: json['userImageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userName': userName,
      'comment': comment,
      'userImageUrl': userImageUrl,
    };
  }
}
