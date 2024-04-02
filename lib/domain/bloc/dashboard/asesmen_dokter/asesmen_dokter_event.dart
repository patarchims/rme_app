part of 'asesmen_dokter_bloc.dart';

@freezed
class AsesmenDokterEvent with _$AsesmenDokterEvent {
  const factory AsesmenDokterEvent.started() = _Started;
  const factory AsesmenDokterEvent.jenisPelayananOnchanged(
      {required String value}) = _JenisPelayananOnchanged;
  const factory AsesmenDokterEvent.keluhanUtamaOnchanged(
      {required String value}) = _KeluhanUtamaOnchanged;
  const factory AsesmenDokterEvent.keluhanTambahanOnchanged(
      {required String value}) = _KeluhanTambahanOnchanged;
  const factory AsesmenDokterEvent.telaahOnchanged({required String value}) =
      _TelaahOnchanged;
  const factory AsesmenDokterEvent.masalahMedisOnchanged(
      {required String value}) = _MasalahMedisOnchanged;
  const factory AsesmenDokterEvent.riwayatSekarangOnchanged(
      {required String value}) = _RiwayatSekarangOnchanged;
  const factory AsesmenDokterEvent.riwayatDuluOnchanged(
      {required String value}) = _RiwayatDuluOnchanged;
  const factory AsesmenDokterEvent.riwayatObatOnchanged(
      {required String value}) = _RiwayatObatOnchanged;
  const factory AsesmenDokterEvent.riwayatKeluargaOnchanged(
      {required String value}) = _RiwayatKeluargaOnchanged;
  const factory AsesmenDokterEvent.riwayatDetailOnchanged(
      {required String value}) = _RiwayatDetailOnchanged;
  const factory AsesmenDokterEvent.anamnesaOnchanged({required String value}) =
      _AnamnesaOnchanged;

  const factory AsesmenDokterEvent.riwayatAlergiOnchanged(
      {required String value}) = _RiwayatAlergiOnchanged;
  const factory AsesmenDokterEvent.onGetAsesment({required String value}) =
      _OnGetAsesment;
  const factory AsesmenDokterEvent.onSaveAsesment({
    required AsesmenDokterModel asesmentDokter,
    required String deviceID,
    required String person,
    required String pelayanan,
    required String noReg,
  }) = _OnSaveAsesment;
}
