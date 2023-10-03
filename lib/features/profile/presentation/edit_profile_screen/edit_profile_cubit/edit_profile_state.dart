part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.error(String error) = _Error;
  const factory EditProfileState.success() = _Success;

  const EditProfileState._();

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: () => true,
      );
}
