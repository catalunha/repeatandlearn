import 'dart:convert';

// Perfil de usuario
class UserProfileModel {
  final String id;
  final String email;
  final String? name;
  final bool isActive;

  UserProfileModel({
    required this.id,
    required this.email,
    this.name,
    required this.isActive,
  });

  UserProfileModel copyWith({
    String? id,
    String? email,
    String? name,
    bool? isActive,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    if (name != null) {
      result.addAll({'name': name});
    }
    result.addAll({'isActive': isActive});

    return result;
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(id: $id, email: $email, name: $name, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ name.hashCode ^ isActive.hashCode;
  }
}
