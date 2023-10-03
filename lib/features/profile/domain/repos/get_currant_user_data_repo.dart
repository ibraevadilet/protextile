import 'package:protextile/features/profile/domain/entity/user_entity.dart';

abstract class GetCurrantUserDataRepo {
  Future<UserEntity> getCurrantUserData();
}
