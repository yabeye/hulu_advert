const String tablePromotions = "Promotions";

class PromotionFields {
  static const List<String> values = [
    id,
    ownerId,
    name,
    desc,
    unitPrice,
    amount,
    createdAt,
    videoUrl,
  ];

  static const String id = "_id";
  static const String ownerId = "owner_id";
  static const String name = "name";
  static const String desc = "desc";
  static const String unitPrice = "unit_price";
  static const String amount = "amount";
  static const String createdAt = "created_at";
  static const String videoUrl = "video_url";
}

class PromotionModel {
  int? id;
  int? ownerId;
  String? name;
  String? desc;
  double? unitPrice;
  int? amount;
  DateTime? createdAt;
  String? videoUrl;

  PromotionModel({
    this.id,
    this.ownerId,
    this.name,
    this.desc,
    this.unitPrice,
    this.amount,
    this.createdAt,
    this.videoUrl,
  });

  PromotionModel copyWith({
    int? id,
    int? ownerId,
    String? name,
    String? desc,
    double? unitPrice,
    int? amount,
    DateTime? createdAt,
    String? videoUrl,
  }) {
    return PromotionModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      unitPrice: unitPrice ?? this.unitPrice,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      PromotionFields.id: id,
      PromotionFields.ownerId: ownerId,
      PromotionFields.name: name,
      PromotionFields.desc: desc,
      PromotionFields.unitPrice: unitPrice,
      PromotionFields.amount: amount,
      PromotionFields.createdAt: createdAt?.toIso8601String(),
      PromotionFields.videoUrl: videoUrl,
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      id: map[PromotionFields.id]?.toInt(),
      ownerId: map[PromotionFields.ownerId]?.toInt(),
      name: map[PromotionFields.name],
      desc: map[PromotionFields.desc],
      unitPrice: map[PromotionFields.unitPrice],
      amount: map[PromotionFields.amount],
      createdAt: map[PromotionFields.createdAt] != null
          ? DateTime.parse(map[PromotionFields.createdAt])
          : null,
      videoUrl: map[PromotionFields.videoUrl],
    );
  }

  @override
  String toString() {
    return 'PromotionModel(id: $id, ownerId: $ownerId, name: $name, desc: $desc, unitPrice: $unitPrice, amount: $amount, createdAt: $createdAt, videoUrl: $videoUrl)';
  }
}
