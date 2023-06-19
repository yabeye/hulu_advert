import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/repositories/preference_repository.dart';

void registerGlobalDependencies() {
  Get.put<Logger>(Logger());
  Get.put<PreferenceRepository>(PreferenceRepository());
  Get.put<AuthController>(AuthController());
}
