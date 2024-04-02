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
}

class HasilAsuhanKeperawatanState extends Equatable {
  final HasilAsuhanStatus status;
  final List<HasilAsuhanKeperawatanModel> hasilAsuhanKeperawatanModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveAllDaskep;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onUpdate;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> deleteData;
  const HasilAsuhanKeperawatanState({
    required this.status,
    required this.deleteData,
    required this.hasilAsuhanKeperawatanModel,
    required this.getData,
    required this.saveData,
    required this.saveAllDaskep,
    required this.onUpdate,
  });

  @override
  List<Object?> get props => [
        hasilAsuhanKeperawatanModel,
        status,
        getData,
        saveData,
        onUpdate,
        saveAllDaskep
      ];

  static HasilAsuhanKeperawatanState initial() => HasilAsuhanKeperawatanState(
      deleteData: none(),
      onUpdate: none(),
      getData: none(),
      saveAllDaskep: none(),
      hasilAsuhanKeperawatanModel: const [],
      saveData: none(),
      status: HasilAsuhanStatus.initial);

  HasilAsuhanKeperawatanState copyWith({
    HasilAsuhanStatus? status,
    List<HasilAsuhanKeperawatanModel>? hasilAsuhanKeperawatanModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? deleteData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onUpdate,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveAllDaskep,
  }) {
    return HasilAsuhanKeperawatanState(
      saveAllDaskep: saveAllDaskep ?? this.saveAllDaskep,
      deleteData: deleteData ?? this.deleteData,
      onUpdate: onUpdate ?? this.onUpdate,
      status: status ?? this.status,
      hasilAsuhanKeperawatanModel:
          hasilAsuhanKeperawatanModel ?? this.hasilAsuhanKeperawatanModel,
      getData: getData ?? this.getData,
      saveData: saveData ?? this.saveData,
    );
  }
}
