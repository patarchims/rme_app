class RencanaTindaklanjutModel {
  final String kdBagian;
  final String anjuran;
  final String noReg;
  final String alasanOpname;
  final String konsulKe;
  final String alasanKonsul;
  final String prognosis;

  RencanaTindaklanjutModel({
    required this.kdBagian,
    required this.anjuran,
    required this.noReg,
    required this.alasanOpname,
    required this.konsulKe,
    required this.alasanKonsul,
    required this.prognosis,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noreg': noReg,
      'kdBagian': kdBagian,
      'terapi': anjuran,
      'alasan_opname': alasanOpname,
      'konsul_ke': konsulKe,
      'alasan_konsul': alasanKonsul,
      'prognosis': prognosis,
    };
  }

  factory RencanaTindaklanjutModel.fromMap(Map<String, dynamic> map) {
    return RencanaTindaklanjutModel(
      prognosis: map['prognosis'] as String,
      noReg: map['noreg'] as String,
      kdBagian: map['kdBagian'] as String,
      anjuran: map['terapi'] as String,
      alasanOpname: map['alasan_opname'] as String,
      konsulKe: map['konsul_ke'] as String,
      alasanKonsul: map['alasan_konsul'] as String,
    );
  }
}
