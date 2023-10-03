part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error(String error) = _Error;

  const AuthState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
