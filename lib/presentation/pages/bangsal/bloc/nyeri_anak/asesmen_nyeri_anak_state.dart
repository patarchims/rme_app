// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_anak_bloc.dart';

enum AsesmenNyeriAnakStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  isLoadingSave,
  isLoadingGet,
}

class AsesmenNyeriAnakState extends Equatable {
  final AsesmenNyeriAnakStatus status;
  final PengkajianNyeriNips penkajianNyeri;
  final NyeriIcuModel nyeriICUModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;

  const AsesmenNyeriAnakState({
    required this.status,
    required this.penkajianNyeri,
    required this.nyeriICUModel,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props =>
      [status, penkajianNyeri, nyeriICUModel, saveResultFailure];

  static AsesmenNyeriAnakState initial() => AsesmenNyeriAnakState(
      saveResultFailure: none(),
      status: AsesmenNyeriAnakStatus.initial,
      nyeriICUModel: NyeriIcuModel(
          frekuensiNyeri: "",
          kualitasNyeri: "",
          lokasiNyeri: "",
          nyeri: 0,
          nyeriMenjalar: ""),
      penkajianNyeri: PengkajianNyeriNips(
          noreg: "",
          ekspresiWajah: "",
          tangisan: "",
          polaNapas: "",
          tangan: "",
          kaki: "",
          kesadaran: "",
          total: 0,
          nyeri: 0,
          lokasiNyeri: "",
          frekuensiNyeri: "",
          nyeriMenjalar: "",
          kualitasNyeri: ""));

  AsesmenNyeriAnakState copyWith({
    AsesmenNyeriAnakStatus? status,
    PengkajianNyeriNips? penkajianNyeri,
    NyeriIcuModel? nyeriICUModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return AsesmenNyeriAnakState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      status: status ?? this.status,
      nyeriICUModel: nyeriICUModel ?? this.nyeriICUModel,
      penkajianNyeri: penkajianNyeri ?? this.penkajianNyeri,
    );
  }
}
