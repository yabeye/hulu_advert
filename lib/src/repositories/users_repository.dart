// Database

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/models/models.dart';

class UsersRepository {
  final Logger _logger = Get.find<Logger>();
  final _dbController = Get.find<DatabaseController>();

  Future<UserModel> createUser(UserModel user) async {
    final db = await _dbController.database;

    final id = await db.insert(tableUsers, user.toMap());
    user = user.copyWith(id: id);

    return user;
  }

  Future<UserModel?> getUser(int id) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
    _logger.i("getUser id: $id, result: $maps");
    return (maps.isNotEmpty) ? UserModel.fromMap(maps.first) : null;
  }

  Future<UserModel?> getUserByUsername(String username) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.username} = ?',
      whereArgs: [username],
    );
    _logger.i("getUser username: $username, result: $maps");
    return (maps.isNotEmpty) ? UserModel.fromMap(maps.first) : null;
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
    );
    _logger.i("getAllUsers, result: $maps");
    return maps.map((e) => UserModel.fromMap(e)).toList();
  }
}
