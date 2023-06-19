import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/models/preference_model.dart';
import 'package:hulu_advert/src/models/user_model.dart';
import 'package:hulu_advert/src/repositories/preference_repository.dart';
import 'package:hulu_advert/src/routes/routes.dart';

class AuthController extends GetxController {
  Rx<UserModel> currentUser = UserModel().obs;
  late final PreferenceRepository _prefRepo;
  late final Logger _logger;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _logger = Get.find<Logger>();
    _prefRepo = Get.find<PreferenceRepository>();
    loadAuth();
  }

  bool get isAuth => currentUser.value.id != null;

  loadAuth() {
    //TODO: Latter get this from local database
    // final storedUser = UserModel(
    //   id: 123,
    //   fullName: "Yeabsera Bekele",
    //   phone: "123456789",
    //   password: "123456",
    //   createdAt: DateTime(2022, DateTime.november),
    // );
    // currentUser.value = storedUser;
  }

  navigateToPage() async {
    final Preference pref = await _prefRepo.getAppPref();

    _logger.i("Pref: ${pref.toString()}");

    if (pref.isFirstTime == null) {
      Get.offAllNamed(AppRoutes.onboarding);
      return;
    }

    if (!isAuth) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }
}
