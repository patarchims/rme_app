// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hasil_asuhan_keperawatan_bloc.dart';

enum HasilAsuhanStatus {
  initial,
  loading,
  loaded,
  emty,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  isLoadingUpdate,
  isLoadingDelete,
  isLoadingSaveAll,
  loadedStatus,
  changedShift,
  isLoadingAction,
  isLoadingGetTindakan,
  isLoadingGetResume,
}

class HasilAsuhanKeperawatanState extends Equatable {
  final HasilAsuhanStatus status;
  final List<TindakanModel> listTindakanModel;
  final List<HasilAsuhanKeperawatanModel> hasilAsuhanKeperawatanModel;
  final List<ResumeKeperawatan> resumeKeperawatan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveAllDaskep;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onUpdate;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> deleteData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveActionKeperawatan;
  const HasilAsuhanKeperawatanState({
    required this.status,
    required this.listTindakanModel,
    required this.hasilAsuhanKeperawatanModel,
    required this.getData,
    required this.saveData,
    required this.saveAllDaskep,
    required this.onUpdate,
    required this.onSaveActionKeperawatan,
    required this.deleteData,
    required this.resumeKeperawatan,
  });

  @override
  List<Object?> get props => [
        hasilAsuhanKeperawatanModel,
        status,
        getData,
        saveData,
        onUpdate,
        onSaveActionKeperawatan,
        saveAllDaskep,
        listTindakanModel,
        resumeKeperawatan
      ];

  static HasilAsuhanKeperawatanState initial() => HasilAsuhanKeperawatanState(
        resumeKeperawatan: const [],
        listTindakanModel: const [],
        deleteData: none(),
        onUpdate: none(),
        getData: none(),
        onSaveActionKeperawatan: none(),
        saveAllDaskep: none(),
        hasilAsuhanKeperawatanModel: const [],
        saveData: none(),
        status: HasilAsuhanStatus.initial,
      );

  HasilAsuhanKeperawatanState copyWith({
    HasilAsuhanStatus? status,
    List<TindakanModel>? listTindakanModel,
    List<ResumeKeperawatan>? resumeKeperawatan,
    List<HasilAsuhanKeperawatanModel>? hasilAsuhanKeperawatanModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveAllDaskep,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onUpdate,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? deleteData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onSaveActionKeperawatan,
  }) {
    return HasilAsuhanKeperawatanState(
      resumeKeperawatan: resumeKeperawatan ?? this.resumeKeperawatan,
      onSaveActionKeperawatan:
          onSaveActionKeperawatan ?? this.onSaveActionKeperawatan,
      status: status ?? this.status,
      listTindakanModel: listTindakanModel ?? this.listTindakanModel,
      hasilAsuhanKeperawatanModel:
          hasilAsuhanKeperawatanModel ?? this.hasilAsuhanKeperawatanModel,
      getData: getData ?? this.getData,
      saveData: saveData ?? this.saveData,
      saveAllDaskep: saveAllDaskep ?? this.saveAllDaskep,
      onUpdate: onUpdate ?? this.onUpdate,
      deleteData: deleteData ?? this.deleteData,
    );
  }
}
