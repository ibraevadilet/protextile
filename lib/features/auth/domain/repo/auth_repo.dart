abstract class AuthRepo {
  Future<void> getAuth({required String login, required String password});
  Future<void> register({
    required String login,
    required String password,
    required String name,
  });
}
