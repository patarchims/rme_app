import 'package:hms_app/domain/entity/meta/meta_entity.dart';

class MetaModel extends MetaEntity {
  const MetaModel({required super.code, required super.message});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      message: json['message'].toString(),
      code: json['code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
    };
  }
}
