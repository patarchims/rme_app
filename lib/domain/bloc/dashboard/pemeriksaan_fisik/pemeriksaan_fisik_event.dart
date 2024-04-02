part of 'pemeriksaan_fisik_bloc.dart';

@freezed
class PemeriksaanFisikEvent with _$PemeriksaanFisikEvent {
  const factory PemeriksaanFisikEvent.started() = _Started;
  // ======================= PENAMBAHAN

  const factory PemeriksaanFisikEvent.onGetPemeriksaanFisikAnak(
      {required String noReg}) = _OnGetPemeriksaanFisikAnak;

  // ================================ KEADAAN UMUM
  const factory PemeriksaanFisikEvent.onSavePemeriksaanFisikAnak({
    required String person,
    required String deviceID,
    required String pelayanan,
    required String kategori,
    required String noReg,
    required PemeriksaanFisikAnakModel pemeriksaanFisikAnak,
  }) = _OnSavePemeriksaanFisikAnak;

  const factory PemeriksaanFisikEvent.heparOnchanged({required String value}) =
      _HeparOnchanged;
  const factory PemeriksaanFisikEvent.heparDetailOnchanged(
      {required String value}) = _HeparDetailOnchanged;
  // ======  ===== //
  const factory PemeriksaanFisikEvent.limpaOnchanged({required String value}) =
      _LimpaOnchanged;
  const factory PemeriksaanFisikEvent.limpaDetailOnchanged(
      {required String value}) = _LimpaDetailOnchanged;

  // ====== GINJAL ===== //
  const factory PemeriksaanFisikEvent.ginjalOnchanged({required String value}) =
      _GinjalOnchanged;
  const factory PemeriksaanFisikEvent.ginjalDetailOnchanged(
      {required String value}) = _GinjalDetailOnchanged;
  const factory PemeriksaanFisikEvent.epigastriumOnchanged(
      {required String value}) = _EpigastriumOnchanged;
  const factory PemeriksaanFisikEvent.suprastermalOnchanged(
      {required String value}) = _SuprastermalOnchanged;
  const factory PemeriksaanFisikEvent.retraksiOnchanged(
      {required String value}) = _RetraksiOnchanged;
  const factory PemeriksaanFisikEvent.tugorKulitOnchanged(
      {required String value}) = _TugorKulitOnchanged;
  const factory PemeriksaanFisikEvent.oufOnchanged({required String value}) =
      _oufOnchanged;

  // ================================================================== TANDA VITAL GANGGUAN PERILAKU
  const factory PemeriksaanFisikEvent.jalanNafasOnchanged(
      {required String value}) = _JalanNafasOnchanged;

  const factory PemeriksaanFisikEvent.tekananDarah2Onchanged(
      {required String value}) = _TekananDarah2Onchanged;

  const factory PemeriksaanFisikEvent.tekananDarahDuachanged(
      {required String value}) = _TekananDarahDuachanged;

  const factory PemeriksaanFisikEvent.pernapasanOnchanged(
      {required String value}) = _PernapasanOnchanged;
  const factory PemeriksaanFisikEvent.pupilKiriOnchanged(
      {required String value}) = _PupilKiriOnchanged;
  const factory PemeriksaanFisikEvent.pupilKananOnchanged(
      {required String value}) = _PupilKananOnchanged;
  const factory PemeriksaanFisikEvent.spo2Onchanged({required String value}) =
      _Spo2Onchanged;
  const factory PemeriksaanFisikEvent.akralOnchanged({required String value}) =
      _AkralOnchanged;
  const factory PemeriksaanFisikEvent.reflekCahayaKiri(
      {required String value}) = _ReflekCahayaKiri;
  const factory PemeriksaanFisikEvent.reflekCahayaKanan(
      {required String value}) = _ReflekCahayaKanan;
  const factory PemeriksaanFisikEvent.gscEOnchanged({required String value}) =
      _GscEOnchanged;
  const factory PemeriksaanFisikEvent.gscVOnchanged({required String value}) =
      _GscVOnchanged;
  const factory PemeriksaanFisikEvent.gscMOnchanged({required String value}) =
      _GscMOnchanged;
  const factory PemeriksaanFisikEvent.gangguanPerilakuOnchanged(
      {required String value}) = _GangguanPerilakuOnchanged;
  const factory PemeriksaanFisikEvent.gangguanPerilakuDetailOnchanged(
      {required String value}) = _GangguanPerilakuDetailOnchanged;

  const factory PemeriksaanFisikEvent.saveGangguanPerilaku({
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required GangguanPerilakuModel gangguanPerilakku,
  }) = _SaveGangguanPerilaku;

  const factory PemeriksaanFisikEvent.getGangguanPerilaku(
      {required String noReg}) = _GetGangguanPerilaku;

  // ================================ KEADAAN UMUM
  const factory PemeriksaanFisikEvent.saveKeadaanUmum({
    required String person,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required KeadaanUmumModel keadaanUmumModel,
  }) = _SaveKeadaanUmum;

  const factory PemeriksaanFisikEvent.getKeadaanUmum({required String noReg}) =
      _GetKeadaanUmum;

  // ================ PEMERIKSAAN FISIK
  const factory PemeriksaanFisikEvent.mataDetailOnchanged(
      {required String value}) = _MataDetailOnchanged;

  const factory PemeriksaanFisikEvent.addMataSelection(
      {required String value}) = _AddMataSelection;
  const factory PemeriksaanFisikEvent.deleteMataSelection(
      {required String value}) = _DeleteMataSelection;

  const factory PemeriksaanFisikEvent.addTelingaSelection(
      {required String value}) = _AddTelingaSelection;
  const factory PemeriksaanFisikEvent.deleteTelingaSelection(
      {required String value}) = _DeleteTelingaSelection;

  const factory PemeriksaanFisikEvent.addHidungSelection(
      {required String value}) = _AddHidungSelection;
  const factory PemeriksaanFisikEvent.deleteHidungSelection(
      {required String value}) = _DeleteHidungSelection;

  const factory PemeriksaanFisikEvent.addTenggorokanSelection(
      {required String value}) = _AddTenggorokanSelection;
  const factory PemeriksaanFisikEvent.deleteTenggorokanSelection(
      {required String value}) = _DeleteTenggorokanSelection;

  const factory PemeriksaanFisikEvent.addMulutSelection(
      {required String value}) = _AddMulutSelection;
  const factory PemeriksaanFisikEvent.deleteMulutSelection(
      {required String value}) = _DeleteMulutSelection;

  const factory PemeriksaanFisikEvent.addGigiSelection(
      {required String value}) = _AddGigiSelection;
  const factory PemeriksaanFisikEvent.deleteGigiSelection(
      {required String value}) = _DeleteGigiSelection;

  const factory PemeriksaanFisikEvent.addleherSelection(
      {required String value}) = _AddleherSelection;
  const factory PemeriksaanFisikEvent.deleteLeherSelection(
      {required String value}) = _DeleteLeherSelection;

  const factory PemeriksaanFisikEvent.addDadaSelection(
      {required String value}) = _AddDadaSelection;
  const factory PemeriksaanFisikEvent.deleteDadaSelection(
      {required String value}) = _DeleteDadaSelection;

  const factory PemeriksaanFisikEvent.addJantungSelection(
      {required String value}) = _AddJantungSelection;
  const factory PemeriksaanFisikEvent.deleteJantungSelection(
      {required String value}) = _DeleteJantungSelection;

  const factory PemeriksaanFisikEvent.addParuSelection(
      {required String value}) = _AddParuSelection;
  const factory PemeriksaanFisikEvent.deleteParuSelection(
      {required String value}) = _DeleteParuSelection;

  const factory PemeriksaanFisikEvent.addPerutSelection(
      {required String value}) = _AddPerutSelection;
  const factory PemeriksaanFisikEvent.deletePerutSelection(
      {required String value}) = _DeletePerutSelection;

  const factory PemeriksaanFisikEvent.addAbdomenSelection(
      {required String value}) = _AddAbdomenSelection;
  const factory PemeriksaanFisikEvent.deleteAbdomenSelection(
      {required String value}) = _DeleteAbdomenSelection;

  const factory PemeriksaanFisikEvent.addPunggungSelection(
      {required String value}) = _AddPunggungSelection;
  const factory PemeriksaanFisikEvent.deletePunggungSelection(
      {required String value}) = _DeletePunggungSelection;

  const factory PemeriksaanFisikEvent.addGenetaliaSelection(
      {required String value}) = _AddGenetaliaSelection;
  const factory PemeriksaanFisikEvent.deleteGenetaliaSelection(
      {required String value}) = _DeleteGenetaliaSelection;

  const factory PemeriksaanFisikEvent.addEkstremitasSelection(
      {required String value}) = _AddEkstremitasSelection;
  const factory PemeriksaanFisikEvent.deleteEkstremitasSelection(
      {required String value}) = _DeleteEkstremitasSelection;

  // ============================================= END VITAL SIGN
  const factory PemeriksaanFisikEvent.keadaanUmumOnchanged(
      {required String value}) = _KeadaanUmumOnchanged;
  const factory PemeriksaanFisikEvent.kesadaranOnchanged(
      {required String value}) = _KesadaranOnchanged;
  const factory PemeriksaanFisikEvent.kesadaranDetailOnchanged(
      {required String value}) = _KesadaranDetailOnchanged;
  // ============================================= END VITAL SIGN

  //================ GET AND POST ==================== //
  const factory PemeriksaanFisikEvent.getVitalSignResult(
      {required String noReg}) = _GetVitalSignResult;

  const factory PemeriksaanFisikEvent.getVitalSignResultPerawat(
      {required String noReg}) = _GetVitalSignResultPerawat;

  const factory PemeriksaanFisikEvent.saveVitalSignResult({
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String kategori,
    required String noReg,
    required VitalSignBangsalModel vitalSignBangsalModel,
  }) = _SaveVitalSignResult;

  const factory PemeriksaanFisikEvent.tekananDarahOnchanged(
      {required String value}) = _TekananDarahOnchanged;
  const factory PemeriksaanFisikEvent.nadiOnchanged({required String value}) =
      _NadiOnchanged;

  // ============================================ END VITAL SIGN
  const factory PemeriksaanFisikEvent.suhuOnchanged({required String value}) =
      _SuhuOnchanged;
  const factory PemeriksaanFisikEvent.tinggiBadanOnchanged(
      {required String value}) = _TinggiBadanOnchanged;
  const factory PemeriksaanFisikEvent.beratBadanOnchanged(
      {required String value}) = _BeratBadanOnchanged;

  // ================ PEMERIKSAAN FISIK BANGSAL
  const factory PemeriksaanFisikEvent.kepalaOnchanged({required String value}) =
      _KepalaOnchanged;
  const factory PemeriksaanFisikEvent.ekstremitasOnchanged(
      {required String value}) = _EkstremitasOnchanged;
  const factory PemeriksaanFisikEvent.leherOnchanged({required String value}) =
      _LeherOnchanged;
  const factory PemeriksaanFisikEvent.abdomenOnchanged(
      {required String value}) = _AbdomenOnchanged;
  const factory PemeriksaanFisikEvent.lainLainOnchanged(
      {required String value}) = _LainLainOnchanged;

  const factory PemeriksaanFisikEvent.getPemeriksaanFisikBangsal(
      {required String noReg}) = _GetPemeriksaanFisikBangsal;

  const factory PemeriksaanFisikEvent.getPemeriksaanFisikBangsalDokter(
      {required String noReg}) = _GetPemeriksaanFisikBangsalDokter;

  const factory PemeriksaanFisikEvent.savePemeriksaanFisikBangsal({
    required String person,
    required String userID,
    required String kategori,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required PemeriksaanFisikBangsalModel pemeriksaanFisikBangsalModel,
  }) = _SavePemeriksaanFisikBangsal;

  const factory PemeriksaanFisikEvent.getPemeriksaanFisikIGD(
      {required String noReg, required String person}) = _GetPemeriksaanFisikIGD;

  const factory PemeriksaanFisikEvent.savePemeriksaanFisikIGD({
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required PemeriksaanFisikIgdModel pemeriksaanFisikIgdModel,
  }) = _SavePemeriksaanFisikIGD;

  const factory PemeriksaanFisikEvent.mataOnchanged({required String value}) =
      _MataOnchanged;
  const factory PemeriksaanFisikEvent.pemeriksaanFisikOchanged(
      {required String value}) = _PemeriksaanFisikOchanged;
  const factory PemeriksaanFisikEvent.thtOnchanged({required String value}) =
      _ThtOnchanged;
  const factory PemeriksaanFisikEvent.telingaOnchanged(
      {required String value}) = _TelingaOnchanged;
  const factory PemeriksaanFisikEvent.tenggorokanOnchanged(
      {required String value}) = _TenggorokanOnchanged;

  const factory PemeriksaanFisikEvent.mulutOnchanged({required String value}) =
      _MulutOnchanged;
  const factory PemeriksaanFisikEvent.gigiOnchanged({required String value}) =
      _GigiOnchanged;
  const factory PemeriksaanFisikEvent.thyroidOnchanged(
      {required String value}) = _ThyroidOnchanged;
  const factory PemeriksaanFisikEvent.leherLainnyaOnchanged(
      {required String value}) = _LeherLainnyaOnchanged;
  const factory PemeriksaanFisikEvent.dadaOnchanged({required String value}) =
      _DadaOnchanged;
  const factory PemeriksaanFisikEvent.jantungOnchanged(
      {required String value}) = _JantungOnchanged;
  const factory PemeriksaanFisikEvent.paruOnchanged({required String value}) =
      _paruOchanged;
  const factory PemeriksaanFisikEvent.perutOnchanged({required String value}) =
      _PerutOnchanged;
  const factory PemeriksaanFisikEvent.kulitOnchanged({required String value}) =
      _KulitOnchanged;
  const factory PemeriksaanFisikEvent.hatiOnchanged({required String value}) =
      _HatiOnchanged;
  const factory PemeriksaanFisikEvent.lienOnchanged({required String value}) =
      _LienOnchanged;
  const factory PemeriksaanFisikEvent.peristaltikUsusOnchanged(
      {required String value}) = _PeristaltikUsusOnchanged;
  const factory PemeriksaanFisikEvent.abdomenLainnyaOnchanged(
      {required String value}) = _AbdomenLainnyaOnchanged;
  const factory PemeriksaanFisikEvent.punggungOnchanged(
      {required String value}) = _PunggungOnchanged;

  const factory PemeriksaanFisikEvent.genetaliaOnchanged(
      {required String value}) = _GenetaliaOnchanged;
  const factory PemeriksaanFisikEvent.superiorOnchanged(
      {required String value}) = _SuperiorOnchanged;
  const factory PemeriksaanFisikEvent.inferiorOnchanged(
      {required String value}) = _InferiorOnchanged;
}
