import 'package:dartz/dartz.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/domain/repository/report/report_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReportRepositori)
class ReportRepositoriImple implements ReportRepositori {
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> ringkasanPulangReport() {
    return getIt<MyDio>().download(
      endPoint:
          "http://localhost:8080/reports/transactions/download?exportType=PDF",
    );
  }
}
