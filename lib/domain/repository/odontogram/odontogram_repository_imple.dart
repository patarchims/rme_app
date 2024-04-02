import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/odontogram/odontogram_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OdontogramRepository)
class OdontogramRepoImpl implements OdontogramRepository {
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> publishOdontogram(
      {required String noReg,
      required String picturePath,
      required String kdBagian}) {
    throw UnimplementedError();
  }
}
