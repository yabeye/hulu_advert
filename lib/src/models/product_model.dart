const String tableProducts = "Products";

class ProductFields {
  static const List<String> values = [
    id,
    ownerId,
    name,
    desc,
    unitPrice,
    amount,
    createdAt
  ];

  static const String id = "_id";
  static const String ownerId = "owner_id";
  static const String name = "name";
  static const String desc = "desc";
  static const String unitPrice = "unit_price";
  static const String amount = "amount";
  static const String createdAt = "created_at";
}

class ProductModel {
  int? id;
  int? ownerId;
  String? name;
  String? desc;
  double? unitPrice;
  int? amount;
  DateTime? createdAt;
  List<String> images;

  ProductModel({
    this.id,
    this.ownerId,
    this.name,
    this.desc,
    this.unitPrice,
    this.amount,
    this.createdAt,
    this.images = const [],
  });

  ProductModel copyWith({
    int? id,
    int? ownerId,
    String? name,
    String? desc,
    double? unitPrice,
    int? amount,
    DateTime? createdAt,
    List<String>? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      unitPrice: unitPrice ?? this.unitPrice,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ProductFields.id: id,
      ProductFields.ownerId: ownerId,
      ProductFields.name: name,
      ProductFields.desc: desc,
      ProductFields.unitPrice: unitPrice,
      ProductFields.amount: amount,
      ProductFields.createdAt: createdAt?.toIso8601String(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map[ProductFields.id]?.toInt(),
      ownerId: map[ProductFields.ownerId]?.toInt(),
      name: map[ProductFields.name],
      desc: map[ProductFields.desc],
      unitPrice: map[ProductFields.unitPrice],
      amount: map[ProductFields.amount],
      createdAt: map[ProductFields.createdAt] != null
          ? DateTime.parse(map[ProductFields.createdAt])
          : null,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, ownerId: $ownerId, name: $name, desc: $desc, unitPrice: $unitPrice, amount: $amount, createdAt: $createdAt, images: $images)';
  }
}
