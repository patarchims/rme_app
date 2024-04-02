import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';

abstract class OdontogramRepository {
  Future<Either<ApiFailureResult, ApiSuccessResult>> publishOdontogram(
      {required String noReg,
      required String picturePath,
      required String kdBagian});
}
