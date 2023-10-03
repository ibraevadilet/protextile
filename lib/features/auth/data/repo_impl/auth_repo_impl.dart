import 'package:protextile/features/auth/domain/repo/auth_repo.dart';
import 'package:protextile/server/catch_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.supabase,
  });
  final SupabaseClient supabase;
  @override
  Future<void> getAuth({
    required String login,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(
        email: login,
        password: password,
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }

  @override
  Future<void> register({
    required String login,
    required String password,
    required String name,
  }) async {
    try {
      await supabase.auth.signUp(
        email: login,
        password: password,
        data: {
          'user_name': name,
          'user_email': login,
        },
      );
      await supabase.from('users').insert(
        {
          'user_name': name,
          'user_email': login,
        },
      );
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
