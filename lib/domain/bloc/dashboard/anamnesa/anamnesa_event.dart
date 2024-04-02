part of 'anamnesa_bloc.dart';

@freezed
class AnamnesaEvent with _$AnamnesaEvent {
  const factory AnamnesaEvent.started() = _Started;
  const factory AnamnesaEvent.saveData({
    required String noReg,
    required String kelUtama,
    required String riwayatSekarang,
    required String penySekarang,
    required String penyKeluarga,
    required String riwayatAlergi,
    required String riwayatAlergiDetail,
    required String jenisPelayanan,
    required String gigi1,
    required String gigi2,
    required String gigi3,
    required String gigi4,
    required String gigi5,
    required String gigi5Detail,
  }) = _SaveData;
  const factory AnamnesaEvent.getAsesmenAnamnesa({required String noReg}) =
      _GetAsesmenAnamnesa;
  // GET KELUHAN UTAMA
  const factory AnamnesaEvent.getKeluhanUtama() = _GetKeluhanUtama;
  // GET RIWAYAT KELUARGA
  const factory AnamnesaEvent.getRiwayatKeluarga() = _GetRiwayatKeluarga;
  // GET RIWAYAT PENYAKIT SEKARANG
  const factory AnamnesaEvent.riwayatPenyakitSekarang() =
      _RiwayatPenyakitSekarang;

  // SELECT KELUHAN UTAMA
  const factory AnamnesaEvent.selectKeluhanUtama({required String value}) =
      _SelectKeluhanUtama;
  // SELECT RIWAYAT PENYAKIT SEKARANG
  const factory AnamnesaEvent.selectedRiwayatPenyakitSekarang(
      {required String value}) = _SelectedRiwayatPenyakitSekarang;
  // SELECTED RIWAYAT PENYAKIT KELUARGA
  const factory AnamnesaEvent.selectedRiwayatPenyakitKeluarga(
      {required String value}) = _SelectedRiwayatPenyakitKeluarga;
}
