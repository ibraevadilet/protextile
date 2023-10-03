import 'package:protextile/core/images/app_images.dart';

class UserEntity {
  final String userId;
  final String name;
  final String email;
  final String image;
  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      userId: map['user_id'],
      name: map['user_name'],
      email: map['user_email'],
      image: map['user_avatar'] ?? AppImages.avatar,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': userId,
      'user_name': name,
      'user_email': email,
      'user_avatar': image,
    };
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.image == image;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ name.hashCode ^ email.hashCode ^ image.hashCode;
  }
}
