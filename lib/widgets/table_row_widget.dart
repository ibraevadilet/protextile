import 'package:flutter/material.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600),
      )),
    );
  }
}
