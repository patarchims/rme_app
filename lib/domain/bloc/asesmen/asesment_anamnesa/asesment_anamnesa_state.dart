part of 'asesment_anamnesa_bloc.dart';

class AsesmentAnamnesaState {
  List<BankDataModel> kelUtama;
  List<BankDataModel> riwayatSekarang;
  String pilihKeluhan;
  String pilihRiwayatSekarang;
  List<DiagnosaModel> diagnosa;
  AsesmenDokterModel? asesmenDokterModel;

  AsesmentAnamnesaState({
    this.kelUtama = const [],
    this.riwayatSekarang = const [],
    this.pilihKeluhan = "",
    this.pilihRiwayatSekarang = "",
    this.diagnosa = const [],
    this.asesmenDokterModel,
  });

  AsesmentAnamnesaState copyWith({
    List<BankDataModel>? kelUtama,
    List<BankDataModel>? riwayatSekarang,
    String? pilihKeluhan,
    String? pilihRiwayatSekarang,
    List<DiagnosaModel>? diagnosa,
    AsesmenDokterModel? asesmenDokterModel,
  }) {
    return AsesmentAnamnesaState(
      asesmenDokterModel: asesmenDokterModel ?? this.asesmenDokterModel,
      kelUtama: kelUtama ?? this.kelUtama,
      riwayatSekarang: riwayatSekarang ?? this.riwayatSekarang,
      pilihKeluhan: pilihKeluhan ?? this.pilihKeluhan,
      pilihRiwayatSekarang: pilihRiwayatSekarang ?? this.pilihRiwayatSekarang,
      diagnosa: diagnosa ?? this.diagnosa,
    );
  }
}

// Loading Get Keluhan Utama
class LoadingGetKeluhanUtama extends AsesmentAnamnesaState {}

class LoadingGetAsesmenDokter extends AsesmentAnamnesaState {}

class LoadingGetRiwayatSekarang extends AsesmentAnamnesaState {}

// Loading Get Riwayat Penyakit Sekarang
class LoadingState extends AsesmentAnamnesaState {}

// Failure Get Keluhan Utama
class FailureState extends AsesmentAnamnesaState {}

// Success Get Keluhan Utama
class SuccessState extends AsesmentAnamnesaState {}
