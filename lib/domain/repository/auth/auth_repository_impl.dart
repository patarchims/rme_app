import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../di/injection.dart';
import '../../network/my_dio.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> createAccount(
      {required String nik,
      required String email,
      required String kodeModul,
      required String password,
      required String repeatPassword}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.createAccount,
      data: DTO.createAccount(
        nik: nik,
        email: email,
        kodeModul: kodeModul,
        password: password,
        repeatPassword: repeatPassword,
      ),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String kodeModul}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.loginUser,
      data: DTO.signInWithEmailAndPassword(
          email: email, password: password, kodeModul: kodeModul),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> registerUser(
      {required String nik,
      required String kodeModul,
      required String password}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.registerUser,
      data:
          DTO.registerUser(nik: nik, kodeModul: kodeModul, password: password),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> verifikasiUser(
      {required String activatedCode}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.verifikasiUser,
      data: DTO.verifikasiUser(verifikasiUser: activatedCode),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> checkVersion() {
    return getIt<MyDio>().getData(endPoint: EndPoint.checkVersion);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> checkToken() {
    return getIt<MyDio>().getDataWithToken(
      endPoint: EndPoint.session,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      signInWithUserIdAndPassword(
          {required String userID,
          required String password,
          required String kodeModul}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.loginUser,
      data: DTO.signInWithUserIDAndPassword(
          userID: userID, password: password, kodeModul: kodeModul),
    );
  }
}
