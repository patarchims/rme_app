// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_kebidanan_bloc.dart';

enum PengkajianKebidananStatus {
  initial,
  loading,
  loaded,
  loadedPenkajianNutrisi,
  onSelected,
  isLoadingSavePengkajian,
  loadedPengkajian,
  selected,
  error,
  isLoadingGet,
}

class PengkajianKebidananState extends Equatable {
  final AsesmenKebidananModel pengkajianKebidanan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final PengkajianKebidananStatus status;
  const PengkajianKebidananState({
    required this.saveResult,
    required this.pengkajianKebidanan,
    required this.status,
  });

  @override
  List<Object?> get props => [pengkajianKebidanan, status, saveResult];

  static PengkajianKebidananState initial() => PengkajianKebidananState(
      pengkajianKebidanan: AsesmenKebidananModel(
          palpasi: "",
          nyeriTekan: "",
          tbj: "",
          tfu: "",
          hamilMuda: "",
          hamilTua: "",
          gravida: "",
          abortus: "",
          para: "",
          haid: "",
          haidTerakhir: "",
          usiaKehamilan: "",
          partusHpl: "",
          leopold1: "",
          leopold2: "",
          leopold3: "",
          leopold4: "",
          hodge: "",
          inspeksi: "",
          inspekuloV: "",
          inspekuloP: "",
          pemeriksaanDalam: ""),
      saveResult: none(),
      status: PengkajianKebidananStatus.initial);

  PengkajianKebidananState copyWith({
    AsesmenKebidananModel? pengkajianKebidanan,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    PengkajianKebidananStatus? status,
  }) {
    return PengkajianKebidananState(
      pengkajianKebidanan: pengkajianKebidanan ?? this.pengkajianKebidanan,
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
    );
  }
}
