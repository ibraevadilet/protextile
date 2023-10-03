import 'package:flutter/material.dart';
import 'package:protextile/widgets/custom_button.dart';

Future<void> aboutProgramDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Данная программа разрабатывается в целях заработать лямы\$ с партнерами)',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          CustomButton(
            color: Colors.blue,
            onPress: () => Navigator.pop(context),
            text: 'Ок',
          ),
        ],
      ),
    ),
  );
}
