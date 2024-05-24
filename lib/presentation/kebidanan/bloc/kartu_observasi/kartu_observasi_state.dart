// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kartu_observasi_bloc.dart';

enum KartuObservasiStaus {
  initial,
  loading,
  isLoadingGet,
  isLoadingUpdate,
  isLoadingGetKartuCairan,
  isLoadingSave,
  loaded,
  error,
}

class KartuObservasiState extends Equatable {
  final KartuObservasiStaus status;
  final List<KartuCairanRepository> kartuCairan;
  final List<KartuObservasiModelRepository> kartuObservasi;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveVitalSignResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveKartuCairan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onUpdatekartuCairan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      onDeleteKartuObservasiResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      onDeleteKartuCairanResult;
  const KartuObservasiState({
    required this.status,
    required this.onDeleteKartuObservasiResult,
    required this.saveVitalSignResult,
    required this.kartuObservasi,
    required this.kartuCairan,
    required this.saveKartuCairan,
    required this.onDeleteKartuCairanResult,
    required this.onUpdatekartuCairan,
  });

  static KartuObservasiState initial() => KartuObservasiState(
      onDeleteKartuCairanResult: none(),
      kartuObservasi: const [],
      onDeleteKartuObservasiResult: none(),
      saveKartuCairan: none(),
      onUpdatekartuCairan: none(),
      kartuCairan: const [],
      saveVitalSignResult: none(),
      status: KartuObservasiStaus.initial);

  @override
  List<Object?> get props => [
        status,
        saveVitalSignResult,
        onUpdatekartuCairan,
        kartuObservasi,
        saveKartuCairan,
        kartuCairan
      ];

  KartuObservasiState copyWith(
      {KartuObservasiStaus? status,
      List<KartuCairanRepository>? kartuCairan,
      List<KartuObservasiModelRepository>? kartuObservasi,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveKartuCairan,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? onUpdatekartuCairan,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          onDeleteKartuCairanResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          onDeleteKartuObservasiResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          saveVitalSignResult}) {
    return KartuObservasiState(
      onUpdatekartuCairan: onUpdatekartuCairan ?? this.onUpdatekartuCairan,
      onDeleteKartuObservasiResult:
          onDeleteKartuObservasiResult ?? this.onDeleteKartuObservasiResult,
      onDeleteKartuCairanResult:
          onDeleteKartuCairanResult ?? this.onDeleteKartuCairanResult,
      kartuCairan: kartuCairan ?? this.kartuCairan,
      kartuObservasi: kartuObservasi ?? this.kartuObservasi,
      saveKartuCairan: saveKartuCairan ?? this.saveKartuCairan,
      status: status ?? this.status,
      saveVitalSignResult: saveVitalSignResult ?? this.saveVitalSignResult,
    );
  }
}
