const String tableUsers = "Users";

class UserFields {
  static const List<String> values = [
    id,
    fullName,
    username,
    password,
    phone,
    createdAt
  ];

  static const String id = "_id";
  static const String fullName = "full_name";
  static const String username = "username";
  static const String password = "password";
  static const String phone = "phone";
  static const String createdAt = "created_at";
}

class UserModel {
  int? id;
  String? fullName;
  String? username;
  String? password;
  String? phone;
  DateTime? createdAt;
  UserModel({
    this.id,
    this.fullName,
    this.username,
    this.password,
    this.phone,
    this.createdAt,
  });

  UserModel copyWith({
    int? id,
    String? fullName,
    String? username,
    String? password,
    String? phone,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      UserFields.id: id,
      UserFields.fullName: fullName,
      UserFields.username: username,
      UserFields.phone: phone,
      UserFields.password: password,
      UserFields.createdAt: createdAt?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[UserFields.id]?.toInt(),
      fullName: map[UserFields.fullName],
      username: map[UserFields.username],
      phone: map[UserFields.phone],
      password: map[UserFields.password],
      createdAt: map[UserFields.createdAt] != null
          ? DateTime.parse(map[UserFields.createdAt])
          : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, username: $username, password: $password, phone: $phone, createdAt: $createdAt)';
  }
}
