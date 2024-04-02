part of 'informasi_medis_bloc.dart';

@freezed
class InformasiMedisEvent with _$InformasiMedisEvent {
  const factory InformasiMedisEvent.started() = _Started;
  const factory InformasiMedisEvent.getMasalahMedis() = _GetMasalahMedis;
  const factory InformasiMedisEvent.getInformasiMedis(
      String noReg, String kdBagian) = _GetInformasiMedis;

  const factory InformasiMedisEvent.saveInformasiMedis(
      String noReg,
      String kdBagian,
      String masalahMedis,
      String terapi,
      String pemeriksaanFisik,
      String anjuran) = _SaveInformasiMedis;
  const factory InformasiMedisEvent.saveMedis(
      String noReg,
      String kdBagian,
      String masalahMedis,
      String terapi,
      String pemeriksaanFisik,
      String anjuran) = _SaveMedis;
  const factory InformasiMedisEvent.getTerapi() = _GetTerapi;
  const factory InformasiMedisEvent.selectedMasalahMedis(
      {required String value}) = _SelectedMasalahMedis;
  const factory InformasiMedisEvent.selectedTerapi({required String value}) =
      _SelectedTerapi;
  const factory InformasiMedisEvent.selectedPemeriksaanFisik(
      {required String value}) = _SelectedPemeriksaanFisik;
  const factory InformasiMedisEvent.selectedAnjuran({required String value}) =
      _SelectedAnjuran;
}
