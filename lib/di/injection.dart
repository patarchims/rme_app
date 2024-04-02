import 'package:get_it/get_it.dart';
import 'package:hms_app/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
// GetIt configureDependencies() => getIt.init();
GetIt configureDependencies() => getIt.init();
