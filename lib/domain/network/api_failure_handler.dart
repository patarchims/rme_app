import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
part 'api_failure_handler.freezed.dart';

@freezed
class ApiFailureResult with _$ApiFailureResult {
  const factory ApiFailureResult.failure({required MetaModel meta}) = _Failure;
  const factory ApiFailureResult.unProccessable({required dynamic value}) =
      _UnProccessable;
  const factory ApiFailureResult.noConnection() = _NoConnection;
  const factory ApiFailureResult.disconectToServer() = _DisconectToServer;
  const factory ApiFailureResult.badResponse() = _BadResponse;
  const factory ApiFailureResult.connectionTimeOut() = _ConnectionTimeOut;
}
