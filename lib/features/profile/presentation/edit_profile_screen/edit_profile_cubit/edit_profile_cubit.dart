import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protextile/core/functions/push_router_func.dart';
import 'package:protextile/features/profile/domain/entity/user_entity.dart';
import 'package:protextile/features/profile/domain/repos/edit_profile_repo.dart';
import 'package:protextile/widgets/styled_toasts.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.repo})
      : super(const EditProfileState.initial());
  final EditProfileRepo repo;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String currantImage = '';
  String? newImage;

  void getCurrantUserInfo(UserEntity currantUserData) {
    emailController.text = currantUserData.email;
    nameController.text = currantUserData.name;
    currantImage = currantUserData.image;
  }

  void selectImage(String image) {
    emit(const EditProfileState.initial());
    newImage = image;
    emit(const EditProfileState.success());
  }

  Future<void> saveNewData() async {
    emit(const EditProfileState.loading());
    try {
      await repo.editProfile(
        UserEntity(
          userId: '',
          name: nameController.text,
          email: emailController.text,
          image: newImage ?? currantImage,
        ),
      );
      showSuccessSnackBar('Данные успешно обновлены');
      AppRoutes.pushPop();
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
  }
}
