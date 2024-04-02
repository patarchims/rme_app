import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_success_handler.freezed.dart';

@freezed
class ApiSuccessResult with _$ApiSuccessResult {
  const factory ApiSuccessResult.loaded({required dynamic value}) = _Loaded;
  const factory ApiSuccessResult.auAutorized({required dynamic value}) =
      _AuAutorized;
  const factory ApiSuccessResult.emty() = _Emty;
}
