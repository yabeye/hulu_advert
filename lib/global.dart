import 'package:get/get.dart';
import 'package:hulu_advert/src/repositories/repositories.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/controllers/controllers.dart';

void registerGlobalDependencies() {
  Get.put<Logger>(Logger());
  Get.put<PreferenceRepository>(PreferenceRepository());
  Get.lazyPut<DatabaseController>(() => DatabaseController());
  Get.lazyPut<UsersRepository>(() => UsersRepository());
  Get.put<AuthController>(AuthController());
}
