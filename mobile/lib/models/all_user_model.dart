class AllUserModel {
  bool success;
  String message;
  List<AllUser> user;
  AllUserModel(
      {this.success = false, this.message = "no-message",  this.user = const []});

  factory AllUserModel.fromJson(Map<String, dynamic> json) {
    return AllUserModel(
        success: json["success"],
        message: json["message"],
        user: List<AllUser>.from(json["user"].map((e) => AllUser.fromJson(e)))
      );
  }
}

class AllUser {
  int id;
  String username;
  String email;
  String? image;
  String? emailVerify;

  AllUser({
    this.id = 0,
    this.username = "no-username",
    this.email = "no-email",
    this.image = "no-image",
    this.emailVerify,
  });

  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      image: json["image"] ?? "",
      emailVerify: json["email_verified_at"] == null ? null : json["email_verified_at"]
    );
}
