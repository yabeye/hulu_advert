import 'dart:io';

import 'package:bcrypt/bcrypt.dart';
import 'package:get/get.dart';
import 'package:hulu_advert/src/repositories/repositories.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/models/preference_model.dart';
import 'package:hulu_advert/src/models/user_model.dart';
import 'package:hulu_advert/src/routes/routes.dart';

class AuthController extends GetxController {
  Rx<UserModel> currentUser = UserModel().obs;
  late final PreferenceRepository _prefRepo;
  late final UsersRepository _usersRepo;

  late final Logger _logger;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _logger = Get.find<Logger>();
    _prefRepo = Get.find<PreferenceRepository>();
    _usersRepo = Get.find<UsersRepository>();
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
    // Get.offAllNamed(AppRoutes.home);
    // return;
    final Preference pref = await _prefRepo.getAppPref();
    currentUser.value = pref.currentUser ?? UserModel();

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

  Future signUp({required UserModel user}) async {
    final prevUser = await _usersRepo.getUserByUsername(user.username ?? "");
    if (prevUser != null) {
      throw const HttpException("username already taken");
    }

    String hashedPassword = BCrypt.hashpw(
      user.password!,
      BCrypt.gensalt(),
    );
    user = user.copyWith(password: hashedPassword);
    currentUser.value = await _usersRepo.createUser(user);

    await _prefRepo.setAppPref(
        value: Preference(
      currentUser: currentUser.value,
    ));
  }

  Future login({required String username, required String password}) async {
    UserModel? user = await _usersRepo.getUserByUsername(username);
    if (user == null) {
      throw const HttpException("No user found");
    }

    if (!BCrypt.checkpw(password, user.password!)) {
      throw const HttpException("Wrong password");
    }

    await _prefRepo.setAppPref(value: Preference(currentUser: user));
    currentUser.value = user;
  }

  logout() async {
    await _prefRepo.removeAuth();
    currentUser.value = UserModel();
    Get.offAndToNamed(AppRoutes.login);
  }
}
