class SignUpModel {
    String message;
    int statusCode;
    SignUp data;

    SignUpModel({
         this.message = "no-message",
         this.statusCode = 0,
         required this.data,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: SignUp.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
    };
}

class SignUp {
    String token;
    User user;

    SignUp({
         this.token = "no-token",
         required this.user,
    });

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}

class User {
    String username;
    String email;
    DateTime? updatedAt;
    DateTime? createdAt;
    int id;

    User({
         this.username = "no-username",
         this.email = "no-email",
         this.updatedAt,
         this.createdAt,
         this.id = 0,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
