// ThinhNguyen
// 14:35 25/9/24

class UserChildProfileEntity {
  final int? id;
  final String name;
  final int gender;
  final DateTime dateOfBirth;

  UserChildProfileEntity({
    required this.id,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
  });

  UserChildProfileEntity copyWith({
    int? id,
    String? name,
    int? gender,
    DateTime? dateOfBirth,
  }) {
    return UserChildProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserChildProfileEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          gender == other.gender &&
          dateOfBirth == other.dateOfBirth;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ gender.hashCode ^ dateOfBirth.hashCode;

  @override
  String toString() {
    return 'UserChildProfileEntity(id: $id, name: $name, gender: $gender, dateOfBirth: $dateOfBirth)';
  }
}
