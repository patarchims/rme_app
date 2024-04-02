part of 'deteksi_resiko_jatuh_bloc.dart';

enum DeteksiResikoJatuhStatus {
  initial,
  loading,
  loaded,
  onSelected,
  error,
  isLoadingSave,
}

class DeteksiResikoJatuhState extends Equatable {
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getData;
  final HasilResikoJatuhResponseModel resiko;
  final DeteksiResikoJatuhStatus status;
  const DeteksiResikoJatuhState({
    required this.getData,
    required this.status,
    required this.resiko,
  });

  @override
  List<Object?> get props => [getData, status, resiko];

  static DeteksiResikoJatuhState initial() => DeteksiResikoJatuhState(
      resiko:
          HasilResikoJatuhResponseModel(isShow: false, hasil: "", tindakan: ""),
      getData: none(),
      status: DeteksiResikoJatuhStatus.initial);

  DeteksiResikoJatuhState copyWith({
    HasilResikoJatuhResponseModel? resiko,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getData,
    DeteksiResikoJatuhStatus? status,
  }) {
    return DeteksiResikoJatuhState(
      resiko: resiko ?? this.resiko,
      status: status ?? this.status,
      getData: getData ?? this.getData,
    );
  }
}
