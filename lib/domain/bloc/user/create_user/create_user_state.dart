part of 'create_user_bloc.dart';

@freezed
class CreateUserState with _$CreateUserState {
  const factory CreateUserState({
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        failOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        searchDokterfailOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        searchKaryawanfailOrSuccessResult,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        registerFailureOrSuccess,
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        verifyrFailureOrSuccess,
    required bool loading,
    required bool loadingSearchDokter,
    required bool loadingSearchKaryawan,
    required bool pelayananLoading,
    required List<KPelayananModel> pelayanan,
    required String kodeModul,
    required String selectedValue,
    required KaryawanModel userModel,
  }) = _CreateUserState;

  factory CreateUserState.initial() => CreateUserState(
      loadingSearchDokter: false,
      loadingSearchKaryawan: false,
      selectedValue: "",
      verifyrFailureOrSuccess: none(),
      failOrSuccessResult: none(),
      searchDokterfailOrSuccessResult: none(),
      searchKaryawanfailOrSuccessResult: none(),
      registerFailureOrSuccess: none(),
      loading: false,
      pelayanan: <KPelayananModel>[],
      kodeModul: "",
      pelayananLoading: false,
      userModel: const KaryawanModel(
          nik: "-",
          idKaryawan: "-",
          hp: "-",
          alamat: "-",
          photo: "-",
          bagian: "-",
          nama: "-",
          jenisKelamin: "-",
          tglLahir: "-",
          tempatLahir: "-",
          kota: "-",
          usia: "-",
          agama: "-",
          tglMasuk: "-",
          statusKawin: "-",
          email: "-"));
}
