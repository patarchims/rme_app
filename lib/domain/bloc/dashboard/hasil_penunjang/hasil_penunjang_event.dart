part of 'hasil_penunjang_bloc.dart';

@freezed
class HasilPenunjangEvent with _$HasilPenunjangEvent {
  const factory HasilPenunjangEvent.started() = _Started;
  // HASIL LABOR
  const factory HasilPenunjangEvent.getHasilLabor({required String noReg}) =
      _GetHasilLabor;

  const factory HasilPenunjangEvent.getHasilLaborOldDB(
      {required String noReg}) = _GetHasilLaborOldDB;

  // HASIL PEMERIKSAAN RADIOLOGI
  const factory HasilPenunjangEvent.getHasilRadiologi({required String noReg}) =
      _GetHasilRadiologi;

  const factory HasilPenunjangEvent.getHasilRadiologiOldDB(
      {required String noReg}) = _GetHasilRadiologiOldDB;
  // HASIL FISIOTERAPI
  const factory HasilPenunjangEvent.getHasilFisioterapi(
      {required String noReg}) = _GetHasilFisioterapi;

  const factory HasilPenunjangEvent.getHasilFisioterapiOldDB(
      {required String noReg}) = _GetHasilFisioterapiOldDB;

  // GET HASIL GIZI
  const factory HasilPenunjangEvent.getHasilPemeriksaanGizi(
      {required String noReg}) = _GetHasilPemeriksaanGizi;

  const factory HasilPenunjangEvent.getHasilPemeriksaanGiziOldDB(
      {required String noReg}) = _GetHasilPemeriksaanGiziOldDB;
}
