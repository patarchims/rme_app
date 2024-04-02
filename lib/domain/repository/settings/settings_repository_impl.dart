import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hms_app/domain/repository/settings/settings_repository.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._sharedPreferences) {
    _getThemeMode();
  }

  final SharedPreferences _sharedPreferences;
  final _themeController = StreamController<ThemeMode>();

  @override
  Stream<ThemeMode> get themeMode => _themeController.stream;

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    await _sharedPreferences.setString(Constants.themeModeKey, mode.value);
    _getThemeMode();
  }

  void _getThemeMode() {
    final themeMode =
        _sharedPreferences.getString(Constants.themeModeKey)?.toThemeMode();
    if (themeMode != null) {
      _themeController.sink.add(themeMode);
    }
  }

  @override
  void dispose() {
    _themeController.close();
  }
}
