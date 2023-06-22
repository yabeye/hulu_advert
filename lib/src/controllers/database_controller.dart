//
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:hulu_advert/src/models/user_model.dart';
import 'package:hulu_advert/src/utils/constants.dart';

const String _databaseName = "hulu_advert.db";

class DatabaseController extends GetxController {
  final Logger _logger = Get.find<Logger>();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(_databaseName);

    return _database!;
  }

  @override
  void onClose() async {
    _logger.i("Closing a database ...");
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
    super.onClose();
  }

  Future<Database> _initDB(String filePath) async {
    _logger.i("Opening database ...");
    return await openDatabase(
      filePath,
      version: 1,
      onCreate: _onCreateDB,
    );
  }

  Future _onCreateDB(Database db, int version) async {
    _logger.i("Creating a new database ...");

    // Creating images table

    // Creating users table
    await db.execute('''
        CREATE TABLE $tableUsers (
          ${UserFields.id} $idType, 
          ${UserFields.fullName} $textType, 
          ${UserFields.username} $textType, 
          ${UserFields.password} $textType,
          ${UserFields.phone} $textType,
          ${UserFields.createdAt} $textType
        )
        ''');
    // Creating products table

    // Creating promotion table
  }

  // ! Danger Zone
  Future dropDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    await deleteDatabase(path);
  }
}
