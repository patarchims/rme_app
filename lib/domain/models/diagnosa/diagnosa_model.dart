// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiagnosaModel {
  final String code;
  final String description;
  final String type;
  final String table;

  DiagnosaModel({
    required this.code,
    required this.description,
    required this.type,
    required this.table,
  });

  DiagnosaModel copyWith({
    String? code,
    String? description,
    String? type,
    String? table,
  }) {
    return DiagnosaModel(
      code: code ?? this.code,
      table: table ?? this.table,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'diagnosa': code,
      'table': table,
      'description': description,
      'type': type,
    };
  }

  factory DiagnosaModel.fromMap(Map<String, dynamic> map) {
    return DiagnosaModel(
      code: map['diagnosa'] as String,
      table: map['table'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
    );
  }
}
