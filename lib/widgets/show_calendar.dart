import 'package:flutter/material.dart';
import 'package:protextile/theme/app_colors.dart';

Future<DateTimeRange?> showCalendar(BuildContext context) async {
  DateTimeRange? date = await showDateRangePicker(
    context: context,
    locale: const Locale('ru'),
    firstDate: DateTime(DateTime.now().year - 100),
    lastDate: DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.color65C130,
            onPrimary: Colors.white,
            onSurface: AppColors.black,
          ),
          dialogBackgroundColor: AppColors.black,
        ),
        child: child!,
      );
    },
  );

  return date;
}
