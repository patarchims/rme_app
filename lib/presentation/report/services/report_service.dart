import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/report/dto/report_dto.dart';

class ReportServices {
  Future<dynamic> getReportAsesmen({
    required String noReg,
    required String person,
    required String noRM,
    required String tanggal,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/report-asesmen-awal-medis-dokter-igd",
      data: ReportDTO.onGetReportAsesmen(
          noRM: noRM, noReg: noReg, person: person, tanggal: tanggal),
    );
  }

  Future<dynamic> onGetPengkajianKebidananReport({
    required String noReg,
    required String noRM,
    required String person,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/report-pengkajian-kebidanan",
      data: ReportDTO.onGetPengkajianAwalKebidanan(
          noReg: noReg, person: person, noRM: noRM),
    );
  }

  Future<dynamic> onGetDiagnosaBanding({
    required String noReg,
    required String person,
  }) {
    return MyDio().getAndToken(
      endPoint: "/v1/diagnosa-banding-dokter",
      data: ReportDTO.onGetDiagnosaBandingIGD(noReg: noReg, person: person),
    );
  }

  Future<dynamic> onGetDiagnosaBandingICD10({
    required String noReg,
    required String person,
  }) {
    return MyDio().getAndToken(
      endPoint: "/v1/diagnosa-banding",
      data: ReportDTO.onGetDiagnosaBandingIGD(noReg: noReg, person: person),
    );
  }
}

final reportServices = ReportServices();
