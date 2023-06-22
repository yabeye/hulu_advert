import 'package:get/get.dart';

import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/repositories/repositories.dart';

class UserController extends GetxController {
  var feedUsers = <UserModel>[].obs;

  final _usersRepo = Get.find<UsersRepository>();

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
  }

  fetchAllUsers() async {
    feedUsers.value = await _usersRepo.getAllUsers();
  }
}
