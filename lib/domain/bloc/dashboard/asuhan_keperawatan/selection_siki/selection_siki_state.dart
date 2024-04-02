part of 'selection_siki_bloc.dart';

enum SelectionSikiStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  changedShift,
}

class SelectionSikiState extends Equatable {
  final List<DeskripsiSikiModel> deskripsi;
  final SelectionSikiStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getData;
  const SelectionSikiState({
    required this.status,
    required this.getData,
    required this.deskripsi,
  });

  static SelectionSikiState initial() => SelectionSikiState(
        deskripsi: const [],
        getData: none(),
        status: SelectionSikiStatus.initial,
      );

  @override
  List<Object?> get props => [status, getData, deskripsi];

  SelectionSikiState copyWith({
    SelectionSikiStatus? status,
    List<DeskripsiSikiModel>? deskripsi,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getData,
  }) {
    return SelectionSikiState(
      deskripsi: deskripsi ?? this.deskripsi,
      status: status ?? this.status,
      getData: getData ?? this.getData,
    );
  }
}
