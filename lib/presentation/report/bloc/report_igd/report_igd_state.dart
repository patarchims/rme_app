// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_igd_bloc.dart';

enum ReportIgdStatus {
  initial,
  loading,
  loaded,
  error,
}

class ReportIgdState extends Equatable {
  final ReportIgdStatus status;
  final RingkasanMasukDanKeluar ringkasanMasukDanKeluar;
  const ReportIgdState({
    required this.status,
    required this.ringkasanMasukDanKeluar,
  });

  @override
  List<Object?> get props => [status];
  static ReportIgdState initial() => ReportIgdState(
      status: ReportIgdStatus.initial,
      ringkasanMasukDanKeluar: RingkasanMasukDanKeluar(
          pasienResonse: PasienResonse(
        agama: "",
        alamat: "",
        peksuami: "",
        pendidikan: "",
        propinsi: "",
        status: "",
        suku: "",
        telp: "",
        tempatLahir: "",
        tglLahir: "",
        umurBln: 0,
        umurThn: 0,
        firstname: "",
        hp: "",
        id: "",
        jenisKelamin: "",
        kabupaten: "",
        keluarahan: "",
        kunjungan: "",
        namaAyah: "",
        namaIbu: "",
        negara: "",
        nik: "",
        pekerjaan: "",
      )));

  ReportIgdState copyWith({
    ReportIgdStatus? status,
    RingkasanMasukDanKeluar? ringkasanMasukDanKeluar,
  }) {
    return ReportIgdState(
      ringkasanMasukDanKeluar:
          ringkasanMasukDanKeluar ?? this.ringkasanMasukDanKeluar,
      status: status ?? this.status,
    );
  }
}
