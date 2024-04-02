import 'package:equatable/equatable.dart';

class MetaDataBPJS extends Equatable {
  final String code;
  final String message;

  const MetaDataBPJS({
    required this.code,
    required this.message,
  });

  factory MetaDataBPJS.fromJson(Map<String, dynamic> json) {
    return MetaDataBPJS(
      message: json['message'].toString(),
      code: json['code'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
    };
  }

  @override
  List<Object?> get props => [message, code];
}
