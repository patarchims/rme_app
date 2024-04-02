import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:intl/intl.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  // AppLocalizations get localizations => AppLocalizations.of(this);

  NavigatorState get navigator => Navigator.of(this);

  bool get isAndroid => theme.platform == TargetPlatform.android;

  bool get isIOS => theme.platform == TargetPlatform.iOS;

  MediaQueryData get media => MediaQuery.of(this);
}

extension NavigatorStatextensions on NavigatorState {
  void navigate(Widget screen) {
    context.navigator.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void replacement(Widget screen) {
    context.navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void navigateWithArguments(Widget screen, dynamic arguments) {
    context.navigator.push(
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }

  void replacementWithArguments(Widget screen, dynamic arguments) {
    context.navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() => toBeginningOfSentenceCase(this)!;

  String removeLast() {
    if (length == 0) return this;
    return substring(0, length - 1);
  }

  ThemeMode toThemeMode() {
    return ThemeMode.values.firstWhere(
      (s) => s.value == this,
    );
  }

  // LoginMethod toLoginMethod() {
  //   return LoginMethod.values.firstWhere(
  //     (s) => s.value == this,
  //   );
  // }
}

extension DateTimeExtensions on DateTime {
  String toFormattedString() => AppConstant.dateFormat.format(this);
}

extension ThemeModeExtensions on ThemeMode {
  String get value => toString().split('.').last;
}

// extension LocaleExtensions on Locale {
//   String get value => toString().split('.').last;

//   String get asset {
//     switch (languageCode) {
//       case 'en':
//         return Assets.english;
//       case 'sq':
//         return Assets.albanian;
//       default:
//         throw UnimplementedError();
//     }
//   }

//   String nameTranslated(BuildContext context) {
//     return LocaleNames.of(context)!.nameOf(languageCode)!.capitalize();
//   }
// }
