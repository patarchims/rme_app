import 'package:equatable/equatable.dart';

class MetaEntity extends Equatable {
  final String? message;
  final int? code;

  const MetaEntity({
    this.message,
    this.code,
  });
  @override
  List<Object?> get props => [message, code];
}
