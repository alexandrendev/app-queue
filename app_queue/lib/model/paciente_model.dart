import 'dart:convert';

class PacienteModel {
  final String name;
  final String birthDate; // <= DateTime construindo apenas com a data??
  final String cpf;
  final String phone;
  final String parentName;
  final String address;

  PacienteModel({
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.phone,
    required this.parentName,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birth_date': birthDate,
      'cpf': cpf,
      'phone': phone,
      'parent_name': parentName,
      'address': address,
    };
  }

  String toJson() => json.encode(toMap());

  factory PacienteModel.fromMap(Map<String, dynamic> map) {
    return PacienteModel(
      name: map['name'] as String,
      birthDate: map['birth_date'] as String,
      cpf: map['cpf'] as String,
      phone: map['phone'] as String,
      parentName: map['parent_name'] as String,
      address: map['address'] as String,
    );
  }

  factory PacienteModel.fromJson(String source) =>
      PacienteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PacienteModel(name: $name, birthDate: $birthDate, cpf: $cpf, phone: $phone, parentName: $parentName, address: $address)';
  }

  @override
  bool operator ==(covariant PacienteModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.birthDate == birthDate &&
        other.cpf == cpf &&
        other.phone == phone &&
        other.parentName == parentName &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        birthDate.hashCode ^
        cpf.hashCode ^
        phone.hashCode ^
        parentName.hashCode ^
        address.hashCode;
  }
}
