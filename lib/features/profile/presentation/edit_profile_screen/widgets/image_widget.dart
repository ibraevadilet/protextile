import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:protextile/features/profile/presentation/edit_profile_screen/edit_profile_cubit/edit_profile_cubit.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.currantImage});
  final String currantImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return SizedBox(
              height: 130,
              width: 130,
              child: Align(
                alignment: Alignment.center,
                child: context.read<EditProfileCubit>().newImage == null
                    ? CachedNetworkImage(
                        imageUrl: currantImage,
                        placeholder: (_, url) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.4),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          );
                        },
                        imageBuilder: (_, imageProvider) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  currantImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              File(context.read<EditProfileCubit>().newImage!),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            );
          },
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () async {
            final imagePicker = ImagePicker();
            XFile? file = await imagePicker.pickImage(
              source: ImageSource.gallery,
            );
            if (file != null) {
              if (!context.mounted) return;
              context.read<EditProfileCubit>().selectImage(file.path);
            }
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
