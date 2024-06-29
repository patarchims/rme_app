// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_kebidanan_bloc.dart';

enum ResikoStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  loadeGet,
  isLoadingSave,
  isLoadingGetResikoJatuh,
  loadedSave,
}

class ResikoJatuhKebidananState extends Equatable {
  final ResikoStatus status;
  final ResikoJatuhKebidananModel resikoJatuhKebidananModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;

  const ResikoJatuhKebidananState(
      {required this.status,
      required this.getResult,
      required this.resikoJatuhKebidananModel,
      required this.saveResult});

  @override
  List<Object?> get props => [
        status,
        getResult,
        saveResult,
        resikoJatuhKebidananModel,
      ];

  static ResikoJatuhKebidananState initial() => ResikoJatuhKebidananState(
      resikoJatuhKebidananModel: ResikoJatuhKebidananModel(
          keterangan: "",
          terpasangInfuse: "",
          noreg: "",
          insertPc: "",
          pelayanan: "",
          kategori: "",
          rJatuh: "",
          diagnosis: "",
          alatBantu1: "",
          alatBantu2: "",
          alatBantu3: "",
          total: 0),
      status: ResikoStatus.initial,
      getResult: none(),
      saveResult: none());

  ResikoJatuhKebidananState copyWith({
    ResikoStatus? status,
    ResikoJatuhKebidananModel? resikoJatuhKebidananModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return ResikoJatuhKebidananState(
      status: status ?? this.status,
      resikoJatuhKebidananModel:
          resikoJatuhKebidananModel ?? this.resikoJatuhKebidananModel,
      getResult: getResult ?? this.getResult,
      saveResult: saveResult ?? this.saveResult,
    );
  }
}
