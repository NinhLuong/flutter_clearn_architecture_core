// ThinhNguyen
// 14:23 24/9/24

class UserRoleEntity {
  final int id;
  final String name;

  const UserRoleEntity({
    required this.id,
    required this.name,
  });

  UserRoleEntity copyWith({
    int? id,
    String? name,
  }) {
    return UserRoleEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}