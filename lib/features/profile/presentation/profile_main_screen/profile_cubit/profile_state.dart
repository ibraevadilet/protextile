part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.error(String error) = _Error;
  const factory ProfileState.success(UserEntity model) = _Success;
}
