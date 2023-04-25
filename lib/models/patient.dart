enum Gender {
  male,
  female,
  other,
}

class Patient {
  final int? id;
  final String? name;
  final int? age;
  final String? gender;
  final String? phoneNumber;
  final String? address;

  Patient({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.phoneNumber,
    this.address,
  });

  // 将数据转换为Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  // 通过Map构造Patient对象
  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }
  // 获取表名
  static String get tableName => 'patients';

  // 获取表中字段名和类型的映射
  static Map<String, String> get tableFields => {
    'id': 'INTEGER PRIMARY KEY',
    'name': 'TEXT',
    'age': 'INTEGER',
    'gender': 'TEXT',
    'phoneNumber': 'TEXT',
    'address': 'TEXT',
  };

  // 获取所有字段名
  static List<String> get allFields =>
      tableFields.keys.map((key) => '`$key`').toList();

  // 获取所有字段名和类型
  static List<String> get allFieldsWithTypes =>
      tableFields.entries.map((entry) => '${entry.key} ${entry.value}').toList();

  // 获取WHERE条件子句
  static String getWhereClause(String field) {
    return '`$field` = ?';
  }

  // 获取所有字段的占位符
  static String get allPlaceholders {
    return allFields.map((field) => '?').join(', ');
  }

  // 获取根据id查询的SQL语句
  static String get queryById {
    return 'SELECT * FROM $tableName WHERE id = ?';
  }

  // 获取插入记录的SQL语句
  static String get insert {
    return 'INSERT INTO $tableName (${allFields.join(', ')}) VALUES ($allPlaceholders)';
  }

  // 获取根据id更新记录的SQL语句
  static String get updateById {
    return 'UPDATE $tableName SET ${allFields.map((field) => '$field = ?').join(', ')} WHERE id = ?';
  }

  // 获取根据id删除记录的SQL语句
  static String get deleteById {
    return 'DELETE FROM $tableName WHERE id = ?';
  }

  // 获取查询所有记录的SQL语句
  static String get queryAll {
    return 'SELECT * FROM $tableName';
  }

  // 创建新的Patient对象，但不包含id
  Patient copy({
    String? name,
    int? age,
    String? gender,
    String? phoneNumber,
    String? address,
  }) {
    return Patient(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  // 创建新的Patient对象，包含id
  Patient copyWith({
  int? id,
  String? name,
  int? age,
  String? gender,
  String? phoneNumber,String? address,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Patient &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              age == other.age &&
              gender == other.gender &&
              phoneNumber == other.phoneNumber &&
              address == other.address;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      phoneNumber.hashCode ^
      address.hashCode;

}
