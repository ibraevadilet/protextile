import 'package:flutter/material.dart';
import 'package:protextile/widgets/custom_app_bar.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Заказы на пошив',
      ),
      body: Center(
        child: Text('CustomerScreen'),
      ),
    );
  }
}
