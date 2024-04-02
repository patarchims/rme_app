class ReportDTO {
  static Map<String, dynamic> onGetReportAsesmen({
    required String noReg,
    required String person,
    required String noRM,
    required String tanggal,
  }) {
    return {
      "no_rm": noRM,
      "no_reg": noReg,
      "tanggal": tanggal,
      "person": person,
    };
  }

  static Map<String, dynamic> onGetDiagnosaBandingIGD({
    required String noReg,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
    };
  }

  static Map<String, dynamic> onGetPengkajianAwalKebidanan({
    required String noReg,
    required String noRM,
    required String person,
  }) {
    return {
      "no_rm": noRM,
      "no_reg": noReg,
      "person": person,
    };
  }
}
