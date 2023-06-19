import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerSingleton<Logger>(Logger());
}
