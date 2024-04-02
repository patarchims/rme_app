// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_bloc.dart';

enum ResikoJatuhStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  changedShift,
}

class ResikoJatuhState extends Equatable {
  final ResikoJatuhStatus status;
  final List<IntervensiModel> intervensi;
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final String shiftSelected;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;
  const ResikoJatuhState({
    required this.status,
    required this.intervensi,
    required this.resikoJatuh,
    required this.shiftSelected,
    required this.saveData,
  });

  static ResikoJatuhState initial() => ResikoJatuhState(
      saveData: none(),
      status: ResikoJatuhStatus.initial,
      intervensi: intervensiList,
      shiftSelected: "",
      resikoJatuh: const []);

  @override
  List<Object?> get props =>
      [intervensi, status, intervensi, shiftSelected, resikoJatuh];

  ResikoJatuhState copyWith({
    ResikoJatuhStatus? status,
    List<IntervensiModel>? intervensi,
    List<ResikoJatuhPasienModel>? resikoJatuh,
    String? shiftSelected,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
  }) {
    return ResikoJatuhState(
      status: status ?? this.status,
      intervensi: intervensi ?? this.intervensi,
      resikoJatuh: resikoJatuh ?? this.resikoJatuh,
      shiftSelected: shiftSelected ?? this.shiftSelected,
      saveData: saveData ?? this.saveData,
    );
  }
}

List<String> shiftList = ["Pagi", "Sore", "Malam"];

List<IntervensiModel> intervensiList = [
  IntervensiModel(number: 1, title: "Risiko Rendah", subIntervensi: [
    SubIntervensi(
      isEnable: false,
      number: 1,
      subTitle: "Pastikan bel, peralatan pribadi mudah dijangkau",
    ),
    SubIntervensi(
      isEnable: false,
      number: 2,
      subTitle: "Pastikan posisi tempat tidur pada posisi terndah dan terkunci",
    ),
    SubIntervensi(
      isEnable: false,
      number: 3,
      subTitle: "Pasang pagar tempat tidur/Brankard",
    ),
    SubIntervensi(
      isEnable: false,
      number: 4,
      subTitle:
          "Pasang busa penyanggah pagar tempat tidur pada pasien anak-anak",
    ),
    SubIntervensi(
      isEnable: false,
      number: 5,
      subTitle:
          "Orientasikan pasien/penunggu tentang lingkungan/ruangan sekitar",
    ),
    SubIntervensi(
      isEnable: false,
      number: 6,
      subTitle: "Anjurankan pasien menggunakan alas kaki anti slip/tidak licin",
    ),
    SubIntervensi(
      isEnable: false,
      number: 7,
      subTitle:
          "Edukasi pasien toileting dan edukasi perilaku pencegahan jatuh",
    ),
  ]),
  IntervensiModel(number: 1, title: "Risiko sedang dan tinggi", subIntervensi: [
    SubIntervensi(
      isEnable: false,
      number: 8,
      subTitle:
          "Pasang tanda resiko jatuh (tempel stiker kuning) pada gelang identitas pasien",
    ),
    SubIntervensi(
      isEnable: false,
      number: 9,
      subTitle:
          "Pasang tanda risiko jatuh pada tempat tidur bagian kaki pasien (segitiga kuning/segitiga merah)",
    ),
    SubIntervensi(
      isEnable: false,
      number: 10,
      subTitle: "Beri tanda riisiko jatuh pada pintu kamar pasien (RT) ",
    ),
    SubIntervensi(
      isEnable: false,
      number: 11,
      subTitle:
          "Libatkan Keluarga dengan edukasi lebih ketat tentang pencegahan jatuh",
    ),
    SubIntervensi(
      isEnable: false,
      number: 12,
      subTitle: "Tingkatkan Observasi / bantuan saat abulansi",
    ),
    SubIntervensi(
      isEnable: false,
      number: 13,
      subTitle: "Intruksikan pasien untuk tidak bangun tanpa pertolongan",
    ),
    SubIntervensi(
      isEnable: false,
      number: 14,
      subTitle: "Dampingi pasien dalam kegiatan ADL",
    ),
    SubIntervensi(
      isEnable: false,
      number: 15,
      subTitle: "Kunjungi dan monitor pasien setiap jam",
    ),
    SubIntervensi(
      isEnable: false,
      number: 16,
      subTitle: "Pasien ditempatkan dekat Nurse Station",
    ),
    SubIntervensi(
      isEnable: false,
      number: 17,
      subTitle: "Lakukan Fiksasi fisik (Restrain) dengan persetujuan keluarga",
    ),
  ])
];
