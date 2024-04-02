part of 'deskripsi_luaran_slki_bloc.dart';

enum DeskripsiLuaranSlkiStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  changedShift,
}

class DeskripsiLuaranSlkiState extends Equatable {
  final DeskripsiLuaranSlkiStatus status;
  final DeskripsiLuaranSikiModel deskripsiLuaranSikiModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onSaveData;
  const DeskripsiLuaranSlkiState({
    required this.status,
    required this.onSaveData,
    required this.deskripsiLuaranSikiModel,
  });

  @override
  List<Object?> get props => [status, deskripsiLuaranSikiModel, onSaveData];

  static DeskripsiLuaranSlkiState initial() => DeskripsiLuaranSlkiState(
      onSaveData: none(),
      status: DeskripsiLuaranSlkiStatus.initial,
      deskripsiLuaranSikiModel: DeskripsiLuaranSikiModel(
          diagnosa:
              Diagnosa(kode: "", judul: "", defenisi: "", slki: "", siki: ""),
          slki: [],
          siki: []));

  DeskripsiLuaranSlkiState copyWith({
    DeskripsiLuaranSlkiStatus? status,
    DeskripsiLuaranSikiModel? deskripsiLuaranSikiModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onSaveData,
  }) {
    return DeskripsiLuaranSlkiState(
      onSaveData: onSaveData ?? this.onSaveData,
      status: status ?? this.status,
      deskripsiLuaranSikiModel:
          deskripsiLuaranSikiModel ?? this.deskripsiLuaranSikiModel,
    );
  }
}
