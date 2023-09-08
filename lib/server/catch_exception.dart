import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:protextile/core/constants/shared_keys.dart';
import 'package:protextile/routes/mobile_auto_router.dart';
import 'package:protextile/routes/mobile_auto_router.gr.dart';
import 'package:protextile/server/service_locator.dart';
import 'package:protextile/translations/locale_keys.g.dart';
import 'package:protextile/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectionTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.type == DioErrorType.receiveTimeout) {
        return CatchException(message: LocaleKeys.catchExTimeOfProcessing.tr());
      } else if (error.response == null) {
        return CatchException(message: LocaleKeys.catchExNoInternet.tr());
      } else if (error.response!.statusCode == 401) {
        removeToken(error.response!.data['message']);
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 405) {
        return CatchException(message: LocaleKeys.catchExRequestDenied.tr());
      } else if (error.response!.statusCode == 400) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 500) {
        return CatchException(message: error.response!.data['message']);
      } else {
        return CatchException(message: LocaleKeys.catchExSystemError.tr());
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: LocaleKeys.catchExSystemError.tr());
    }
  }
}

void removeToken(String error) async {
  final prefs = sl<SharedPreferences>();
  final route = sl<AppRouter>();
  prefs.remove(SharedKeys.token);
  await Future.delayed(const Duration(milliseconds: 500), () {
    route.pushAndPopUntil(
      const AuthRoute(),
      predicate: (route) => false,
    );
  });

  showErrorSnackBar(error);
}
