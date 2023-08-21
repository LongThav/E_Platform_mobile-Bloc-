import 'package:equatable/equatable.dart';

class UserLocal extends Equatable{
  int id;
  String username;
  String email;
  String? image;
  String? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserLocal({
    this.id = 0,
    this.username = "no-username",
    this.email = "no-email",
    this.image = "no-image",
    this.emailVerifiedAt = "no-emailVeri",
    this.createdAt,
    this.updatedAt,
  });

  factory UserLocal.fromJson(Map<String, dynamic> json) => UserLocal(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        image: json["image"] ?? "",
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
      
        @override
        List<Object?> get props => [email, username, email, image];
}
