import 'package:protextile/features/profile/domain/entity/user_entity.dart';

abstract class EditProfileRepo {
  Future<void> editProfile(UserEntity newUserData);
}
