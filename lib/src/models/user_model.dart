class UserModel {
  int? id;
  String? fullName;
  String? username;
  String? phone;
  String? password;
  DateTime? createdAt;
  UserModel({
    this.id,
    this.fullName,
    this.username,
    this.phone,
    this.password,
    this.createdAt,
  });

  UserModel copyWith({
    int? id,
    String? fullName,
    String? username,
    String? phone,
    String? password,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, username: $username, phone: $phone, password: $password, createdAt: $createdAt)';
  }
}
