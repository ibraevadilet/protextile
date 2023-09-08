import 'package:flutter/material.dart';
import 'package:protextile/widgets/custom_app_bar.dart';

class SewingFactoryScreen extends StatelessWidget {
  const SewingFactoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Цехи, готовые взять ваш заказ',
      ),
      body: Center(
        child: Text('SewingFactoryScreen'),
      ),
    );
  }
}
