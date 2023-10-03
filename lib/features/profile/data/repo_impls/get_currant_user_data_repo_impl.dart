import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:protextile/core/images/app_images.dart';
import 'package:protextile/features/profile/domain/entity/user_entity.dart';
import 'package:protextile/features/profile/domain/repos/get_currant_user_data_repo.dart';
import 'package:protextile/server/catch_exception.dart';

class GetCurrantUserDataRepoImpl implements GetCurrantUserDataRepo {
  GetCurrantUserDataRepoImpl({
    required this.supabase,
  });
  final SupabaseClient supabase;
  @override
  Future<UserEntity> getCurrantUserData() async {
    try {
      final User user = supabase.auth.currentUser!;

      return UserEntity(
        userId: user.id,
        name: user.userMetadata!['user_name'],
        email: user.email!,
        image: user.userMetadata?['user_avatar'] ?? AppImages.avatar,
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
