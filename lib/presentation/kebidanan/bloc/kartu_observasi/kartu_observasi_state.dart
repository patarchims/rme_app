// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kartu_observasi_bloc.dart';

enum KartuObservasiStaus {
  initial,
  loading,
  isLoadingGet,
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
  const KartuObservasiState({
    required this.status,
    required this.saveVitalSignResult,
    required this.kartuObservasi,
    required this.kartuCairan,
    required this.saveKartuCairan,
  });

  static KartuObservasiState initial() => KartuObservasiState(
      kartuObservasi: const [],
      saveKartuCairan: none(),
      kartuCairan: const [],
      saveVitalSignResult: none(),
      status: KartuObservasiStaus.initial);

  @override
  List<Object?> get props => [
        status,
        saveVitalSignResult,
        kartuObservasi,
        saveKartuCairan,
        kartuCairan
      ];

  KartuObservasiState copyWith(
      {KartuObservasiStaus? status,
      List<KartuCairanRepository>? kartuCairan,
      List<KartuObservasiModelRepository>? kartuObservasi,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveKartuCairan,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          saveVitalSignResult}) {
    return KartuObservasiState(
      kartuCairan: kartuCairan ?? this.kartuCairan,
      kartuObservasi: kartuObservasi ?? this.kartuObservasi,
      saveKartuCairan: saveKartuCairan ?? this.saveKartuCairan,
      status: status ?? this.status,
      saveVitalSignResult: saveVitalSignResult ?? this.saveVitalSignResult,
    );
  }
}
