class UpdateProfileModel {
    String message;
    int statusCode;
    UserUpdate user;

    UpdateProfileModel({
         this.message = "no-message",
         this.statusCode = 0,
        required this.user,
    });

    factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
        message: json["message"],
        statusCode: json["statusCode"],
        user: UserUpdate.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "user": user.toJson(),
    };
}

class UserUpdate {
    int id;
    String username;
    String email;
    String image;
    String? emailVerifiedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    UserUpdate({
         this.id = 0,
         this.username = "no-username",
         this.email = "no-email",
         this.image = "no-image",
         this.emailVerifiedAt,
         this.createdAt,
         this.updatedAt,
    });

    factory UserUpdate.fromJson(Map<String, dynamic> json) => UserUpdate(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
