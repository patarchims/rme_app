// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_perina_bloc.dart';

enum PemeriksaanFisikPerinaStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
}

class PemeriksaanFisikPerinaState extends Equatable {
  final FisikPerinaModel fisikPerinaModel;
  final VItalSignPerina vitalSignPerina;
  final PemeriksaanFisikPerinaStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultVitalSign;
  const PemeriksaanFisikPerinaState({
    required this.vitalSignPerina,
    required this.status,
    required this.saveResult,
    required this.saveResultVitalSign,
    required this.fisikPerinaModel,
  });

  @override
  List<Object?> get props => [
        status,
        fisikPerinaModel,
        saveResult,
        vitalSignPerina,
      ];

  PemeriksaanFisikPerinaState copyWith({
    PemeriksaanFisikPerinaStatus? status,
    VItalSignPerina? vitalSignPerina,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultVitalSign,
    FisikPerinaModel? fisikPerinaModel,
  }) {
    return PemeriksaanFisikPerinaState(
      saveResultVitalSign: saveResultVitalSign ?? this.saveResultVitalSign,
      vitalSignPerina: vitalSignPerina ?? this.vitalSignPerina,
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
      fisikPerinaModel: fisikPerinaModel ?? this.fisikPerinaModel,
    );
  }

  static PemeriksaanFisikPerinaState initial() => PemeriksaanFisikPerinaState(
      saveResultVitalSign: none(),
      vitalSignPerina: VItalSignPerina(
          warnaKulit: "",
          td: "",
          hr: "",
          rr: "",
          spo2: "",
          bb: "",
          tb: "",
          lingkarKepala: "",
          lingkarLengan: "",
          lingkarDada: "",
          lingkarPerut: ""),
      saveResult: none(),
      fisikPerinaModel: FisikPerinaModel(
        gcsE: "",
        gcsM: "",
        gcsV: "",
        kelainan: "",
        tonickNeck: "",
        kesadaran: "",
        anus: "",
        dada: "",
        ekstremitas: "",
        genetalia: "",
        hidung: "",
        integumen: "",
        kepala: "",
        leherDahBahu: "",
        mulut: "",
        punggung: "",
        refleks: "",
        telinga: "",
        wajah: "",
        abdomen: "",
      ),
      status: PemeriksaanFisikPerinaStatus.initial);
}
