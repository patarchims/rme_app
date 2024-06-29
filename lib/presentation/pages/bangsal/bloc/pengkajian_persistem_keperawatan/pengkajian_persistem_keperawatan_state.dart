// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_persistem_keperawatan_bloc.dart';

enum PengkajianPersistemKeperawatanStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  isLoadingSave,
  isLoadingGet,
}

class PengkajianPersistemKeperawatanState extends Equatable {
  final PengkajianKeperawatanPesistemModel pengkajianKeperawatanPesistemModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final PengkajianPersistemKeperawatanStatus status;

  const PengkajianPersistemKeperawatanState({
    required this.saveResultFailure,
    required this.pengkajianKeperawatanPesistemModel,
    required this.status,
  });

  @override
  List<Object?> get props =>
      [saveResultFailure, status, pengkajianKeperawatanPesistemModel];

  static PengkajianPersistemKeperawatanState initial() =>
      PengkajianPersistemKeperawatanState(
          pengkajianKeperawatanPesistemModel:
              PengkajianKeperawatanPesistemModel(
                  masalahProstat: "",
                  nutrisi: "",
                  akral: "",
                  batuk: "",
                  merokok: "",
                  suaraNapas: "",
                  kekuatanOtot: "",
                  anggotaGerak: "",
                  bicara: "",
                  perubahanStatusMental: "",
                  riwayatHipertensi: "",
                  sakitKepala: "",
                  sistemusus: "",
                  penerjemah: "",
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
                  khususKepercayaan: "",
                  thermoregulasi: ""),
          saveResultFailure: none(),
          status: PengkajianPersistemKeperawatanStatus.initial);

  PengkajianPersistemKeperawatanState copyWith({
    PengkajianKeperawatanPesistemModel? pengkajianKeperawatanPesistemModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    PengkajianPersistemKeperawatanStatus? status,
  }) {
    return PengkajianPersistemKeperawatanState(
      pengkajianKeperawatanPesistemModel: pengkajianKeperawatanPesistemModel ??
          this.pengkajianKeperawatanPesistemModel,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      status: status ?? this.status,
    );
  }
}
