import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/profile_cubit/profile_cubit.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/widgets/about_program_dialog.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/widgets/exit_dialog.dart';
import 'package:protextile/features/profile/presentation/profile_main_screen/widgets/profile_widget.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:protextile/widgets/app_error_text.dart';
import 'package:protextile/widgets/app_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const AppIndicator(),
                  error: (error) => AppErrorText(error: error),
                  success: (model) => Column(
                    children: [
                      const SizedBox(height: 20),
                      CachedNetworkImage(
                        imageUrl: model.image,
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
                                  model.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 18),
                      Text(
                        model.name,
                        style: AppTextStyles.s18W700(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        model.email,
                        style: AppTextStyles.s18W700(),
                      ),
                      const SizedBox(height: 18),
                      ProfileWidget(
                        title: 'Редактировать профиль',
                        icon: Icons.person_2_outlined,
                        onTap: () => context.router
                            .push(ProfileEditRoute(currantUserData: model))
                            .then(
                              (value) =>
                                  context.read<ProfileCubit>().getProfile(),
                            ),
                      ),
                      ProfileWidget(
                        title: 'Платная подписка',
                        icon: Icons.attach_money_outlined,
                        onTap: () {},
                      ),
                      ProfileWidget(
                        title: 'Избранные',
                        icon: Icons.favorite,
                        onTap: () {},
                      ),
                      ProfileWidget(
                        title: 'О программе',
                        icon: Icons.info_outline,
                        onTap: () => aboutProgramDialog(context),
                      ),
                      ProfileWidget(
                        title: 'Выйти',
                        icon: Icons.exit_to_app,
                        onTap: () => exitDialog(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
