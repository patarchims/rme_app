import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';

abstract class AuthRepository {
  // CEK TOKEN
  Future<Either<ApiFailureResult, ApiSuccessResult>> checkToken();

  // REGISTER USER
  Future<Either<ApiFailureResult, ApiSuccessResult>> registerUser(
      {required String nik,
      required String kodeModul,
      required String password});

  // VERIFIKASI USER
  Future<Either<ApiFailureResult, ApiSuccessResult>> verifikasiUser(
      {required String activatedCode});

  // CEK VERSI APLIKASI
  Future<Either<ApiFailureResult, ApiSuccessResult>> checkVersion();

  // SIGN IN WITH EMAIL DAN PASSWORD
  Future<Either<ApiFailureResult, ApiSuccessResult>> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String kodeModul});

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      signInWithUserIdAndPassword(
          {required String userID,
          required String password,
          required String kodeModul});

  // CREATE ACCOUNT USER
  Future<Either<ApiFailureResult, ApiSuccessResult>> createAccount({
    required String nik,
    required String email,
    required String kodeModul,
    required String password,
    required String repeatPassword,
  });
}
