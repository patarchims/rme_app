import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/app_widget.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      backgroundColor: ThemeColor.primaryColor,
      title: "Electronic Medical Record",
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setAsFrameless();
      await WindowManager.instance.setFullScreen(true);
    });
  }

  configureDependencies();

  // =================================||===================================== //
  // =================================||===================================== //
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const App());
}
