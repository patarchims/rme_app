part of 'triase_bloc.dart';

@freezed
class TriaseEvent with _$TriaseEvent {
  const factory TriaseEvent.started() = _Started;
  // ========================= SKRINING NYERI =====================
  const factory TriaseEvent.getSkriningNyeri({required String noReg}) =
      _GetSkriningNyeri;

  const factory TriaseEvent.skriningNyeriOnchanged({required double value}) =
      _SkriningNyeriOnchanged;

  const factory TriaseEvent.frekuensiNyeriOnchanged({required String value}) =
      _FrekuensiNyeriOnchanged;

  const factory TriaseEvent.lamaNyeriOnchanged({required String value}) =
      _LamaNyeriOnchanged;

  const factory TriaseEvent.menjalarOnchanged({required String value}) =
      _MenjalarOnchanged;

  const factory TriaseEvent.menjalarDetailOnchanged({required String value}) =
      _MenjalarDetailOnchanged;

  const factory TriaseEvent.kualitasNyeriOnchanged({required String value}) =
      _KualitasNyeriOnchanged;

  const factory TriaseEvent.faktorPemicuOnchanged({required String value}) =
      _FaktorPemicuOnchanged;

  const factory TriaseEvent.faktorMengurangi({required String value}) =
      _FaktorMengurangi;

  const factory TriaseEvent.saveSkriningNyeri({
    required SkriningNyeriModel skriningNyeri,
    required String noReg,
    required String person,
    required String deviceID,
    required String pelayanan,
  }) = _SaveSkriningNyeri;
  // ========================= END SKRINING NYERI ===================== //

  // ========================== SKALA TIRASE ====================== //
  const factory TriaseEvent.getTriaseSkala({required String noReg}) =
      _GetTriaseSkala;

  const factory TriaseEvent.saveTriaseSkala({
    required SkalaTriaseModel skalaTriaseModel,
    required String noReg,
    required String keluhanUtama,
    required String statusAlergi,
    required String statusAlergiDetail,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveTriaseSkala;

  // ========================== SKALA FLACC
  const factory TriaseEvent.skalaFlaccWajahOnchanged({required double value}) =
      _SkalaFlaccWajahOnchanged;
  const factory TriaseEvent.skalaFlaccKakiOnchanged({required double value}) =
      _SkalaFlaccKakiOnchanged;
  const factory TriaseEvent.skalaFlaccAktifitasOnchanged(
      {required double value}) = _SkalaFlaccAktifitasOnchanged;
  const factory TriaseEvent.skalaFlaccMenangisOnchanged(
      {required double value}) = _SkalaFlaccMenangisOnchanged;
  const factory TriaseEvent.skalaFlaccBersuaraOnchanged(
      {required double value}) = _SkalaFlaccBersuaraOnchanged;

  // ========================== SKALA
  const factory TriaseEvent.skalaNyeriOnchanged({required double value}) =
      _SkalaNyeriOnchanged;

  const factory TriaseEvent.skalaTriaseOnchanged({required double value}) =
      _SkalaTriaseOnchanged;

  const factory TriaseEvent.provokatifOnchanged({required String value}) =
      _ProvokatifOnchanged;
  const factory TriaseEvent.qualityOnchanged({required String value}) =
      _QualityOnchanged;
  const factory TriaseEvent.radiationOnchanged({required String value}) =
      _RadiationOnchanged;
  const factory TriaseEvent.severityOnchanged({required String value}) =
      _SeverityOnchanged;
  const factory TriaseEvent.timeOnchanged({required String value}) =
      _TimeOnchanged;

  // =========================== RIWAYAT ALERGI
  const factory TriaseEvent.getRiwayatAlergi({required String noReg}) =
      _GetRiwayatAlergi;

  const factory TriaseEvent.saveRiwayatAlergi({
    required String noReg,
    required String keluhanUtama,
    required String statusAlergi,
    required String statusAlergiDetail,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveRiwayatAlergi;

  const factory TriaseEvent.keluhanUtamaOnchanged({required String value}) =
      _KeluhanUtamaOnchanged;

  const factory TriaseEvent.statusAlergiOnchanged({required String value}) =
      _StatusAlergiOnchanged;

  const factory TriaseEvent.statusAlergiDetailOnchanged(
      {required String value}) = _StatusAlergiDetailOnchanged;

  const factory TriaseEvent.getTriase({required String noReg}) = _GetTriase;

  const factory TriaseEvent.saveTriase({required TriaseModel triaseModel}) =
      _SaveTriase;
}
