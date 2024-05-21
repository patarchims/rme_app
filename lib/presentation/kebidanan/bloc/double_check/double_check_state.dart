part of 'double_check_bloc.dart';

enum DoubleCheckStatus {
  initial,
  loading,
  isLoadingGetData,
  loaded,
  error,
  isChanged,
  isLoadingSave
}

class DoubleCheckState extends Equatable {
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final DoubleCheckRepository doubleCheckRepository;
  final List<DoubleCheckRepository> listCheck;
  final DoubleCheckStatus status;

  const DoubleCheckState(
      {required this.saveResult,
      required this.doubleCheckRepository,
      required this.status,
      required this.listCheck});

  @override
  List<Object?> get props =>
      [saveResult, doubleCheckRepository, status, listCheck];

  static DoubleCheckState initial() => DoubleCheckState(
        listCheck: const [],
        saveResult: none(),
        status: DoubleCheckStatus.isChanged,
        doubleCheckRepository: DoubleCheckRepository(
          cara: false,
          dokumentasi: false,
          dosis: false,
          informasi: false,
          obat: false,
          pasien: false,
          waktu: false,
          keterangan: "",
        ),
      );

  DoubleCheckState copyWith({
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    DoubleCheckRepository? doubleCheckRepository,
    DoubleCheckStatus? status,
    List<DoubleCheckRepository>? listCheck,
  }) {
    return DoubleCheckState(
      listCheck: listCheck ?? this.listCheck,
      saveResult: saveResult ?? this.saveResult,
      status: DoubleCheckStatus.initial,
      doubleCheckRepository:
          doubleCheckRepository ?? this.doubleCheckRepository,
    );
  }
}
