// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cppt_sbar_bangsal_bloc.dart';

enum CPPTSbarBangsalStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingUpdate,
  isLoadingSave,
  loadedSave,
}

class CpptSbarBangsalState extends Equatable {
  final List<CpptSbarDokterModel> cppt;
  final CPPTSbarBangsalStatus status;
  final List<CatatanKeperawatanResponse> catatanKeperawatan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultCatatan;

  const CpptSbarBangsalState({
    required this.cppt,
    required this.status,
    required this.catatanKeperawatan,
    required this.saveResultFailure,
    required this.saveResultCatatan,
  });

  @override
  List<Object?> get props =>
      [cppt, status, saveResultFailure, catatanKeperawatan];

  static CpptSbarBangsalState initial() => CpptSbarBangsalState(
      catatanKeperawatan: const [],
      saveResultFailure: none(),
      saveResultCatatan: none(),
      status: CPPTSbarBangsalStatus.initial,
      cppt: const []);

  CpptSbarBangsalState copyWith({
    List<CpptSbarDokterModel>? cppt,
    CPPTSbarBangsalStatus? status,
    List<CatatanKeperawatanResponse>? catatanKeperawatan,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultCatatan,
  }) {
    return CpptSbarBangsalState(
      catatanKeperawatan: catatanKeperawatan ?? this.catatanKeperawatan,
      cppt: cppt ?? this.cppt,
      saveResultCatatan: saveResultCatatan ?? this.saveResultCatatan,
      status: status ?? this.status,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
    );
  }
}
