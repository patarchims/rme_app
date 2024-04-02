// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_persistem_bloc.dart';

enum PengkajianPersistemStatus {
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

class PengkajianPersistemState extends Equatable {
  final PengkajianPersistemStatus status;
  final PengkajianPersistemKebidananResponse penkajianKebidanan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const PengkajianPersistemState({
    required this.status,
    required this.penkajianKebidanan,
    required this.saveResult,
  });
  @override
  List<Object?> get props => [status, saveResult, penkajianKebidanan];

  static PengkajianPersistemState initial() => PengkajianPersistemState(
      penkajianKebidanan: PengkajianPersistemKebidananResponse(
          thermoregulasi: "",
          eliminasiBak: "",
          eliminasiBab: "",
          istirahat: "",
          aktivitas: "",
          mandi: "",
          berpakaian: "",
          makan: "",
          eliminasi: "",
          mobilisasi: "",
          kardiovaskuler: "",
          respiratori: "",
          secebral: "",
          perfusiPerifer: "",
          pencernaan: "",
          integumen: "",
          kenyamanan: "",
          proteksi: "",
          papsSmer: "",
          hamil: "",
          pendarahan: "",
          hambatanBahasa: "",
          caraBelajar: "",
          bahasaSehari: "",
          spikologis: "",
          hambatanSosial: "",
          hambatanEkonomi: "",
          spiritual: "",
          responseEmosi: "",
          nilaiKepercayaan: "",
          presepsiSakit: "",
          khususKepercayaan: ""),
      saveResult: none(),
      status: PengkajianPersistemStatus.initial);

  PengkajianPersistemState copyWith({
    PengkajianPersistemStatus? status,
    PengkajianPersistemKebidananResponse? penkajianKebidanan,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return PengkajianPersistemState(
      status: status ?? this.status,
      penkajianKebidanan: penkajianKebidanan ?? this.penkajianKebidanan,
      saveResult: saveResult ?? this.saveResult,
    );
  }
}
