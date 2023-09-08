import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protextile/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:protextile/features/customer/presentation/customer_screen.dart';
import 'package:protextile/features/profile/presentation/profile_screen.dart';
import 'package:protextile/features/sewing_factory/presentation/sewing_factory_screen.dart';
import 'package:protextile/theme/app_colors.dart';

@RoutePage()
class BottomNavigatorScreen extends StatelessWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.index],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.orangeff5733,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.white,
              unselectedFontSize: 12,
              selectedLabelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              unselectedItemColor: AppColors.white.withOpacity(0.5),
              currentIndex: state.index,
              onTap: (index) {
                context.read<BottomNavigatorCubit>().getCurrentPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive),
                  label: 'Заказы',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.factory),
                  label: 'Цехи',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Профиль',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Widget> pages = [
  const CustomerScreen(),
  const SewingFactoryScreen(),
  const ProfileScreen(),
];
