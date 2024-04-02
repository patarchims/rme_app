import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';

abstract class ReportRepositori {
  Future<Either<ApiFailureResult, ApiSuccessResult>> ringkasanPulangReport();
}
