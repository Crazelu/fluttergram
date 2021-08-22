class UserModel {
  final String id;
  final String docId;
  final String userName;
  final String profileImage;
  final String bio;
  final List<String> followers;
  final List<String> following;

  UserModel({
    required this.id,
    required this.userName,
    this.docId = '',
    this.profileImage = '',
    this.bio = '',
    this.followers = const [],
    this.following = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> json, String docId) {
    return UserModel(
      docId: docId,
      id: json['id'] ?? '',
      userName: json['name'] ?? '',
      followers: List<String>.from(json['followers'] ?? []),
      following: List<String>.from(json['following'] ?? []),
      profileImage: json['image'] ?? '',
      bio: json['bio'] ?? '',
    );
  }

  UserModel copyWith({
    String? bio,
    String? image,
    String? newFollower,
    String? newFollowing,
  }) {
    var newFollowers = followers;

    if (newFollower != null) {
      if (newFollowers.contains(newFollower)) {
        newFollowers.remove(newFollower);
      } else {
        newFollowers.add(newFollower);
      }
    }
    var newFollowings = following;

    if (newFollowing != null) {
      if (newFollowings.contains(newFollowing)) {
        newFollowings.remove(newFollowing);
      } else {
        newFollowings.add(newFollowing);
      }
    }

    return UserModel(
      profileImage: image ?? profileImage,
      id: id,
      userName: userName,
      bio: bio ?? this.bio,
      followers: newFollowers,
      following: newFollowings,
      docId: docId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": userName,
      "followers": followers,
      "following": following,
      "image": profileImage,
      "bio": bio,
    };
  }
}
