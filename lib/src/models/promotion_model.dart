const String tablePromotion = "Promotions";

class PromotionFields {
  static const List<String> values = [
    id,
    name,
    desc,
    unitPrice,
    amount,
    createdAt
  ];

  static const String id = "_id";
  static const String name = "name";
  static const String desc = "desc";
  static const String unitPrice = "unit_price";
  static const String amount = "amount";
  static const String createdAt = "created_at";
}

class PromotionModel {
  int? id;
  String? name;
  String? desc;
  double? unitPrice;
  int? amount;
  DateTime? createdAt;
  List<String> videos;

  PromotionModel({
    this.id,
    this.name,
    this.desc,
    this.unitPrice,
    this.amount,
    this.createdAt,
    this.videos = const [],
  });

  PromotionModel copyWith({
    int? id,
    String? name,
    String? desc,
    double? unitPrice,
    int? amount,
    DateTime? createdAt,
    List<String>? videos,
  }) {
    return PromotionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      unitPrice: unitPrice ?? this.unitPrice,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      PromotionFields.id: id,
      PromotionFields.name: name,
      PromotionFields.desc: desc,
      PromotionFields.unitPrice: unitPrice,
      PromotionFields.amount: amount,
      PromotionFields.createdAt: createdAt?.toIso8601String(),
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      id: map[PromotionFields.id]?.toInt(),
      name: map[PromotionFields.name],
      desc: map[PromotionFields.desc],
      unitPrice: map[PromotionFields.unitPrice],
      amount: map[PromotionFields.amount],
      createdAt: map[PromotionFields.createdAt] != null
          ? DateTime.parse(map[PromotionFields.createdAt])
          : null,
    );
  }

  @override
  String toString() {
    return 'PromotionModel(id: $id, name: $name, desc: $desc, unitPrice: $unitPrice, amount: $amount, createdAt: $createdAt, videos: $videos)';
  }
}
