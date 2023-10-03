import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:protextile/translations/locale_keys.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    if (error is AuthException) {
      return CatchException(message: error.message);
    } else if (error is StorageException) {
      return CatchException(message: error.message);
    } else if (error is HttpException) {
      return CatchException(message: error.message);
    } else if (error is PostgrestException) {
      return CatchException(message: error.message);
    } else {
      return CatchException(message: LocaleKeys.catchExSystemError.tr());
    }
  }

  @override
  String toString() => message;
}
