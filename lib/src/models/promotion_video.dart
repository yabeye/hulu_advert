const String tablePromotionVideo = "PromotionVideoModels";

class PromotionVideoFields {
  static const List<String> values = [
    id,
    promotionId,
    path,
  ];

  static const String id = "_id";
  static const String promotionId = "promotion_id";
  static const String path = "path";
}

class PromotionVideoModel {
  int? id;
  int? promotionId;
  String? path;
  PromotionVideoModel({
    this.id,
    this.promotionId,
    this.path,
  });

  PromotionVideoModel copyWith({
    int? id,
    int? promotionId,
    String? path,
  }) {
    return PromotionVideoModel(
      id: id ?? this.id,
      promotionId: promotionId ?? this.promotionId,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      PromotionVideoFields.id: id,
      PromotionVideoFields.promotionId: promotionId,
      PromotionVideoFields.path: path,
    };
  }

  factory PromotionVideoModel.fromMap(Map<String, dynamic> map) {
    return PromotionVideoModel(
      id: map[PromotionVideoFields.id]?.toInt(),
      promotionId: map[PromotionVideoFields.promotionId]?.toInt(),
      path: map[PromotionVideoFields.path],
    );
  }

  @override
  String toString() =>
      'PromotionVideoModel(id: $id, promotionId: $promotionId, path: $path)';
}
