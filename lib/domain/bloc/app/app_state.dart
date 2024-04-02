part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.failure() = _Failure;
  const factory AppState.badResponse() = _BadResponse;
  const factory AppState.connectionTimeOut() = _ConnectionTimeOut;
  const factory AppState.noConnection() = _NoConnection;
  const factory AppState.diconectToServer() = _DiconectToServer;
  const factory AppState.updateNow() = _UpdateNow;
  const factory AppState.runOnBoarding() = _RunOnBoarding;
  const factory AppState.noToken({MetaModel? meta}) = _NoToken;
  const factory AppState.loginWithBiometric() = _LoginWithBiometric;
  const factory AppState.runMainPage({required UserModel user}) = _RunMainPage;
}
