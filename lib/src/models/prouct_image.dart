const String tableProductImages = "ProductImages";

class ProductImageFields {
  static const List<String> values = [
    id,
    productId,
    path,
  ];

  static const String id = "_id";
  static const String productId = "product_id";
  static const String path = "path";
}

class ProductImage {
  int? id;
  int? productId;
  String? path;
  ProductImage({
    this.id,
    this.productId,
    this.path,
  });

  ProductImage copyWith({
    int? id,
    int? productId,
    String? path,
  }) {
    return ProductImage(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ProductImageFields.id: id,
      ProductImageFields.productId: productId,
      ProductImageFields.path: path,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map[ProductImageFields.id],
      productId: map[ProductImageFields.productId],
      path: map[ProductImageFields.path],
    );
  }

  @override
  String toString() =>
      'ProductImage(id: $id, productId: $productId, path: $path)';
}
