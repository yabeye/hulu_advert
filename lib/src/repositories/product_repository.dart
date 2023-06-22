// Database

import 'package:get/get.dart';
import 'package:hulu_advert/src/models/product_model.dart';
import 'package:hulu_advert/src/models/prouct_image.dart';
import 'package:logger/logger.dart';

import 'package:hulu_advert/src/controllers/controllers.dart';

class ProductRepository {
  final Logger _logger = Get.find<Logger>();
  final _dbController = Get.find<DatabaseController>();

  Future<ProductModel> addProduct(
    ProductModel product,
    // List<ProductImage> images,
  ) async {
    final db = await _dbController.database;

    final id = await db.insert(tableProducts, product.toMap());
    product = product.copyWith(id: id);

    // Upload images to product images table

    final imageBatch = db.batch();
    for (final row in product.images) {
      imageBatch.insert(
        tableProductImages,
        ProductImage(
          productId: id,
          path: row,
        ).toMap(),
      );
    }
    await imageBatch.commit();

    return product;
  }

  Future<List<ProductImage>> getProductImages(int productId) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableProductImages,
      columns: ProductImageFields.values,
      where: '${ProductFields.id} = ?',
      whereArgs: [productId],
    );
    _logger.i("getProductImages, result: $maps");
    return maps.map((e) => ProductImage.fromMap(e)).toList();
  }

  Future<List<ProductImage>> getAllProductImages() async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableProductImages,
      columns: ProductImageFields.values,
    );
    _logger.i("getAllProductImages, result: $maps");
    return maps.map((e) => ProductImage.fromMap(e)).toList();
  }

  Future<ProductModel?> getProduct(int id) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableProducts,
      columns: ProductFields.values,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      final product = ProductModel.fromMap(maps.first);
      List<ProductImage> allImages = await getProductImages(id);
      return product.copyWith(
        images: allImages.map((e) => e.path ?? "").toList(),
      );
    }

    return null;
  }

  Future<List<ProductModel>> getProductByName(String name) async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableProducts,
      columns: ProductFields.values,
      where: '${ProductFields.name} = ?',
      whereArgs: [name],
    );
    _logger.i("getProductByName name: $name, result: $maps");
    return maps.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<List<ProductModel>> getAllProducts() async {
    final db = await _dbController.database;
    final maps = await db.query(
      tableProducts,
      columns: ProductFields.values,
      orderBy: "${ProductFields.createdAt} DESC",
    );

    final imageMaps = await getAllProductImages();

    List<ProductModel> all = maps.map((e) => ProductModel.fromMap(e)).toList();

    for (int i = 0; i < all.length; i++) {
      final p = all[i];
      all[i].images = imageMaps
          .where((e) => e.productId == p.id)
          .toList()
          .map((e) => e.path ?? "")
          .toList();
    }

    _logger.i("Combine product: getAllProducts $all");

    return all;
  }
}
