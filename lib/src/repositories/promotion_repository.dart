// Database

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/controllers/controllers.dart';
import 'package:hulu_advert/src/models/models.dart';

class PromotionRepository {
  final Logger _logger = Get.find<Logger>();
  final _dbController = Get.find<DatabaseController>();

  Future<PromotionModel> addPromotion(PromotionModel promotion) async {
    final db = await _dbController.database;

    final id = await db.insert(tablePromotions, promotion.toMap());
    promotion = promotion.copyWith(id: id);

    return promotion;
  }

  Future<PromotionModel?> getPromotion(int id) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tablePromotions,
      columns: PromotionFields.values,
      where: '${PromotionFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return PromotionModel.fromMap(maps.first);
    }

    return null;
  }

  Future<List<PromotionModel>> getPromotionByName(String name) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tablePromotions,
      columns: PromotionFields.values,
      where: '${PromotionFields.name} LIKE = ?',
      whereArgs: ['%$name%'],
    );
    _logger.i("getPromotionByName name: $name, result: $maps");
    return maps.map((e) => PromotionModel.fromMap(e)).toList();
  }

  Future<List<PromotionModel>> getAllPromotions() async {
    final db = await _dbController.database;
    final maps = await db.query(
      tablePromotions,
      columns: PromotionFields.values,
      orderBy: "${PromotionFields.createdAt} DESC",
    );
    _logger.i("getAllPromotions, result: $maps");

    return maps.map((e) => PromotionModel.fromMap(e)).toList();
  }
}
