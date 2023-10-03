import 'dart:developer';

import 'package:protextile/core/functions/upload_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:protextile/features/profile/domain/entity/user_entity.dart';
import 'package:protextile/features/profile/domain/repos/edit_profile_repo.dart';
import 'package:protextile/server/catch_exception.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  const EditProfileRepoImpl({required this.supabase});
  final SupabaseClient supabase;
  @override
  Future<void> editProfile(UserEntity newUserData) async {
    try {
      final uploadData = await userData(newUserData);
      await supabase.auth.updateUser(
        UserAttributes(
          email: newUserData.email.trim(),
          data: uploadData,
        ),
      );
      final userId = supabase.auth.currentUser!.id;

      final userNewData = uploadData
        ..addEntries(
          [
            MapEntry('user_email', newUserData.email),
          ],
        );
      await supabase.from('users').update(userNewData).eq('user_id', userId);
    } catch (e) {
      log(CatchException.convertException(e).message);
      throw CatchException.convertException(e).message;
    }
  }

  Future<Map<String, dynamic>> userData(UserEntity newUserData) async {
    Map<String, dynamic> uploadData = {
      'user_name': newUserData.name.trim(),
    };

    if (!newUserData.image.contains('https://')) {
      final imageUrl = await uploadImage(
        storageBucket: 'profiles',
        storagePath: 'profile',
        imageLocalPath: newUserData.image,
      );
      uploadData.addEntries(
        [
          MapEntry(
            'user_avatar',
            imageUrl,
          )
        ],
      );
    }

    return uploadData;
  }
}
