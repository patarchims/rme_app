part of 'indentias_bayi_bloc.dart';

enum IndentiasBayiStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingSaveIdentitas,
}

class IndentiasBayiState extends Equatable {
  final IndentiasBayiStatus status;
  final ResponseIdentitasBayi identitasBayi;
  final bool isActive1;
  final bool isActive2;
  final bool isActive3;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultIdentitas;
  const IndentiasBayiState({
    required this.status,
    required this.identitasBayi,
    required this.isActive1,
    required this.isActive2,
    required this.isActive3,
    required this.saveResult,
    required this.saveResultIdentitas,
  });

  @override
  List<Object?> get props => [
        status,
        isActive1,
        isActive2,
        isActive3,
        saveResult,
        identitasBayi,
        saveResultIdentitas
      ];

  static IndentiasBayiState initial() => IndentiasBayiState(
      saveResultIdentitas: none(),
      identitasBayi: ResponseIdentitasBayi(
          vitalSignPerina: VitalSignPerinaBayi(
              beratLahir: "", warnaKulit: "", panjangBadan: ""),
          identitasBayi: BayiIdentitas(
              nik: "",
              id: "",
              firstname: "",
              jenisKelamin: "",
              tempatLahir: "",
              tglLahir: "",
              umurThn: 0,
              umurBln: 0,
              suku: "",
              alamat: "",
              agama: "",
              keluarahan: "",
              kabupaten: "",
              propinsi: "",
              negara: "",
              telp: "",
              pendidikan: "",
              pekerjaan: "",
              status: "",
              peksuami: "",
              kunjungan: "",
              hp: "",
              namaAyah: "",
              namaIbu: ""),
          imageFiles: ImageFiles(
              jamKelahiran: "",
              namaPemberiGelangBayi: "",
              namaPenentuJK: "",
              namaWali: "",
              ttdWali: "",
              ttdJk: "",
              kakiKananBayi: "",
              kakiKiriBayi: "",
              tanganKiriIbu: "")),
      saveResult: const None(),
      status: IndentiasBayiStatus.initial,
      isActive1: true,
      isActive2: true,
      isActive3: true);

  IndentiasBayiState copyWith(
      {IndentiasBayiStatus? status,
      bool? isActive1,
      bool? isActive2,
      bool? isActive3,
      ResponseIdentitasBayi? identitasBayi,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultIdentitas,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult}) {
    return IndentiasBayiState(
      saveResultIdentitas: saveResultIdentitas ?? this.saveResultIdentitas,
      identitasBayi: identitasBayi ?? this.identitasBayi,
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
      isActive1: isActive1 ?? this.isActive1,
      isActive2: isActive2 ?? this.isActive2,
      isActive3: isActive3 ?? this.isActive3,
    );
  }
}
