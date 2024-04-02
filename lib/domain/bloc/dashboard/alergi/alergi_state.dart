// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'alergi_bloc.dart';

enum AlergiStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  changedShift,
  isLoadingSaveAlergiObat,
  isLoadingSaveAlergiAlergiMakanan,
  isLaodingSaveAlergiLainnya,
  isLoadedAlergiObat,
  isLoadedAlergiMakanan,
  isLoadedAlergiLainnya,
  isLoadingGetRiwayatAlergi,

  // keluarga
  isLoadingPenyakitKeluarga,
  isLoadingRemovePenyakitKeluarga,
  loadedPenyakitKeluarga,

  // delete
  isLoadingDeleteAlergi,
  isLoadedDeleteAlergi,
}

class AlergiState extends Equatable {
  final AlergiStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getData;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveAlergiObat;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveAlergiMakanan;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveAlergiLainnya;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onDeleteAlergi;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onSaveRiwayatAlergi;
  final RiwayatAlergiPasien riwayatAlergi;
  final List<AlergiResponse> alergiData;

  const AlergiState({
    required this.status,
    required this.onSaveRiwayatAlergi,
    required this.saveData,
    required this.getData,
    required this.saveAlergiObat,
    required this.saveAlergiMakanan,
    required this.saveAlergiLainnya,
    required this.onDeleteAlergi,
    required this.alergiData,
    required this.riwayatAlergi,
  });

  static AlergiState initial() => AlergiState(
        onSaveRiwayatAlergi: none(),
        alergiData: const [],
        onDeleteAlergi: none(),
        riwayatAlergi: RiwayatAlergiPasien(
            penyakitDahulu: PenyakitDahulu(tglMasuk: "", riwayatPenyakit: ""),
            alergi: []),
        saveAlergiLainnya: none(),
        saveAlergiMakanan: none(),
        saveAlergiObat: none(),
        saveData: none(),
        getData: none(),
        status: AlergiStatus.initial,
      );

  @override
  List<Object?> get props => [
        onSaveRiwayatAlergi,
        alergiData,
        status,
        saveData,
        saveAlergiLainnya,
        saveAlergiMakanan,
        saveAlergiObat,
        getData,
        onDeleteAlergi,
        riwayatAlergi
      ];

  AlergiState copyWith({
    AlergiStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getData,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveAlergiObat,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveAlergiMakanan,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveAlergiLainnya,
    final Option<Either<ApiFailureResult, ApiSuccessResult>>? onDeleteAlergi,
    final Option<Either<ApiFailureResult, ApiSuccessResult>>?
        onSaveRiwayatAlergi,
    List<AlergiResponse>? alergiData,
    RiwayatAlergiPasien? riwayatAlergi,
  }) {
    return AlergiState(
      onSaveRiwayatAlergi: onSaveRiwayatAlergi ?? this.onSaveRiwayatAlergi,
      alergiData: alergiData ?? this.alergiData,
      riwayatAlergi: riwayatAlergi ?? this.riwayatAlergi,
      status: status ?? this.status,
      saveData: saveData ?? this.saveData,
      getData: getData ?? this.getData,
      onDeleteAlergi: onDeleteAlergi ?? this.onDeleteAlergi,
      saveAlergiObat: saveAlergiObat ?? this.saveAlergiObat,
      saveAlergiMakanan: saveAlergiMakanan ?? this.saveAlergiMakanan,
      saveAlergiLainnya: saveAlergiLainnya ?? this.saveAlergiLainnya,
    );
  }
}
