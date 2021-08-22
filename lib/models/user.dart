class UserModel {
  final String id;
  final String userName;
  final String profileImage;
  final String bio;
  final List<String> followers;
  final List<String> following;

  UserModel({
    required this.id,
    required this.userName,
    this.profileImage = '',
    this.bio = '',
    this.followers = const [],
    this.following = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['name'],
      followers: List<String>.from(json['followers'] ?? []),
      following: List<String>.from(json['following'] ?? []),
      profileImage: json['image'],
      bio: json['bio'],
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
