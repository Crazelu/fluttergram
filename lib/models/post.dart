class Post {
  final String caption;
  final String userId;
  final String postId;
  final String location;
  final String userName;
  final String imageUrl;
  final String userImageUrl;
  final List<String> likers;

  Post({
    this.caption = '',
    required this.userId,
    this.postId = '',
    required this.location,
    required this.userName,
    required this.imageUrl,
    this.userImageUrl = '',
    this.likers = const [],
  });

  factory Post.fromMap(Map<String, dynamic> json, String postId) {
    return Post(
      postId: postId,
      caption: json['caption'] ?? '',
      userId: json['userId'] ?? '',
      location: json['location'] ?? '',
      userName: json['userName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      userImageUrl: json['userImageUrl'] ?? '',
      likers: List<String>.from(json['likers'] ?? []),
    );
  }

  Post copyWith(String newUserImageUrl) {
    return Post(
      imageUrl: imageUrl,
      location: location,
      caption: caption,
      postId: postId,
      userId: userId,
      userName: userName,
      userImageUrl: newUserImageUrl,
      likers: likers,
    );
  }

  Post addLike(String liker) {
    var newLikers = likers;
    if (newLikers.contains(liker)) {
      newLikers.remove(liker);
    } else {
      newLikers.add(liker);
    }
    return Post(
      imageUrl: imageUrl,
      location: location,
      caption: caption,
      postId: postId,
      userId: userId,
      userName: userName,
      userImageUrl: userImageUrl,
      likers: newLikers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'caption': caption,
      "location": location,
      "userName": userName,
      "imageUrl": imageUrl,
      "userImageUrl": userImageUrl,
      "userId": userId,
      "likers": likers,
      "postId": postId,
    };
  }
}
