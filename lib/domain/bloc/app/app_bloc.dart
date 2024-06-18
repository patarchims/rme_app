import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/on_boarding/on_boarding_model.dart';
import 'package:hms_app/domain/models/token/token_pref.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/domain/models/version/version_model.dart';
import 'package:hms_app/domain/repository/auth/auth_repository.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:injectable/injectable.dart';

import '../../models/on_boarding/on_boarding_pref.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AuthRepository authRepository;
  AppBloc(this.authRepository) : super(const AppState.initial()) {
    on<AppEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(AppEvent event, Emitter<AppState> emit) async {
    await event.maybeMap(
        orElse: () {},
        started: (e) async {
          final version = await authRepository.checkVersion();
          await version.fold(
              // =>  <= //
              (l) => l.maybeMap(orElse: () {
                    emit(const AppState.failure());
                  }, failure: (e) {
                    emit(const AppState.failure());
                  }, badResponse: (e) {
                    emit(const AppState.badResponse());
                  }, connectionTimeOut: (e) {
                    emit(const AppState.connectionTimeOut());
                  }),
              (r) => r.maybeMap(orElse: () {
                    emit(const AppState.failure());
                  }, loaded: (e) async {
                    VersionModel meta =
                        VersionModel.fromMap(e.value["response"]);

                    double version = (Platform.isAndroid)
                        ? meta.androidVersion
                        : meta.iosVersion;

                    log("$version ${AppConstant.appVersion}");

                    if (version > AppConstant.appVersion) {
                      emit(const AppState.updateNow());
                    } else {
                      // CHECK APAKAH ONBOARDING SUDAH DIJALANKAN
                      // CEK APAKAH SUDAH PERNAH DI INSTALL SEBELUMNYA
                      OnBoardingModel? onBoarding =
                          await OnBoardingPref.getOnBoarding();

                      //
                      // CEK APAKAH SUDAH PERNAH DI INSTALL SEBELUMNYA
                      if (onBoarding == null) {
                        emit(const AppState.runOnBoarding());
                      } else {
                        // CHECK TOKEN USER
                        final checkToken = await authRepository.checkToken();
                        log(" CHECK TOKEN  $checkToken");
                        // CHECK TOKEN
                        await checkToken.fold(
                            (l) => l.maybeMap(
                                orElse: () async {},
                                badResponse: (e) {
                                  emit(const AppState.badResponse());
                                },
                                connectionTimeOut: (e) {
                                  emit(const AppState.connectionTimeOut());
                                },
                                disconectToServer: (e) {
                                  emit(const AppState.diconectToServer());
                                },
                                noConnection: (e) {
                                  emit(const AppState.diconectToServer());
                                },
                                failure: (e) async {
                                  await TokenPref.deleteToken();
                                  emit(AppState.noToken(meta: e.meta));
                                }),
                            (r) => r.maybeMap(
                                orElse: () {},
                                loaded: (e) {
                                  // JIKA TOKEN VERIFY
                                  final UserModel userModel =
                                      UserModel.fromMap(e.value["response"]);
                                  emit(AppState.runMainPage(user: userModel));
                                }));
                      }
                    }
                  }));
        });
  }
}
