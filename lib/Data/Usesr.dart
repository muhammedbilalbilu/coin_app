class Useradd {
  final String email;
  final String uid;

  final String username;
  final String bio;
  final List followers;
  final List following;

  Useradd(
      {required this.email,
      required this.uid,
      required this.username,
      required this.bio,
      required this.following,
      required this.followers});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
