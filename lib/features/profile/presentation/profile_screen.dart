import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:protextile/features/profile/presentation/widgets/profile_widget.dart';
import 'package:protextile/theme/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

const avatar = 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CachedNetworkImage(
                imageUrl: avatar,
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          avatar,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Text(
                'Адилет Ибраев',
                style: AppTextStyles.s18W700(),
              ),
              const SizedBox(height: 5),
              Text(
                'ibraevadilet3@gmail.com',
                style: AppTextStyles.s18W700(),
              ),
              const SizedBox(height: 18),
              ProfileWidget(
                title: 'Редактировать профиль',
                icon: Icons.person_2_outlined,
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Избранные',
                icon: Icons.favorite,
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Подписка',
                icon: Icons.monetization_on_outlined,
                onTap: () {},
              ),
              ProfileWidget(
                title: 'О программе',
                icon: Icons.info_outline,
                onTap: () {},
              ),
              ProfileWidget(
                title: 'Выйти',
                icon: Icons.exit_to_app,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
