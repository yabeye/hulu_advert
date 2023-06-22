//
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:hulu_advert/src/models/models.dart';
import 'package:hulu_advert/src/utils/constants.dart';

const String _databaseName = "hulu_advert.db";

class DatabaseController extends GetxController {
  final Logger _logger = Get.find<Logger>();
  Database? _database;

  Future<Database> get database async {
    // await dropDatabase();
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
      version: 2,
      onCreate: _onCreateDB,
    );
  }

  Future _onCreateDB(Database db, int version) async {
    _logger.i("Creating a new database ...");

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
    await db.execute('''
        CREATE TABLE $tableProducts (
          ${ProductFields.id} $idType, 
          ${ProductFields.ownerId} $intType, 
          ${ProductFields.name} $textType, 
          ${ProductFields.desc} $textType, 
          ${ProductFields.unitPrice} $floatingType,
          ${ProductFields.amount} $intType,
          ${ProductFields.createdAt} $textType
        )
        ''');

    // Creating promotion table
    await db.execute('''
        CREATE TABLE $tablePromotions (
          ${PromotionFields.id} $idType, 
          ${PromotionFields.ownerId} $intType, 
          ${PromotionFields.name} $textType, 
          ${PromotionFields.desc} $textType, 
          ${PromotionFields.unitPrice} $floatingType,
          ${PromotionFields.amount} $intType,
          ${PromotionFields.createdAt} $textType,
          ${PromotionFields.videoUrl} $textType
        )
        ''');

    // Creating images table
    await db.execute('''
        CREATE TABLE $tableProductImages (
          ${ProductImageFields.id} $idType, 
          ${ProductImageFields.productId} $intType,
          ${ProductImageFields.path} $textType
        )
        ''');
  }

  // ! Danger Zone
  Future dropDatabase() async {
    _logger.w("Database is deleted!");
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    await deleteDatabase(path);
  }
}
