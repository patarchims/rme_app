part of 'asesmen_igd_bloc.dart';

@freezed
class AsesmenIgdEvent with _$AsesmenIgdEvent {
  const factory AsesmenIgdEvent.started() = _Started;
  // ============================================= TINDAK LANJUT ================================= //
  const factory AsesmenIgdEvent.kondisiPasienOnchanged(
      {required String value}) = _KondisiPasienOnchanged;
  const factory AsesmenIgdEvent.transportasiPulangOnchanged(
      {required String value}) = _TransportasiPulangOnchanged;

  const factory AsesmenIgdEvent.caraPulangOnChanged({required String value}) =
      _CaraPulangOnChanged;
  const factory AsesmenIgdEvent.jamOnchanged({required String value}) =
      _JamOnchanged;
  const factory AsesmenIgdEvent.menitOnchanged({required String value}) =
      _MenitOnchanged;

  const factory AsesmenIgdEvent.pendidikanKesehatanOnchanged(
      {required String value}) = _PendidikanKesehatanOnchanged;
  const factory AsesmenIgdEvent.pendidikanKesehatanOnchangedDetail(
      {required String value}) = _PendidikanKesehatanOnchangedDetail;
  const factory AsesmenIgdEvent.getTindakLanjut({required String noreg}) =
      _GetTindakLanjut;

  const factory AsesmenIgdEvent.saveTindakLanjut({
    required TindakLanjutIgdModel tindakLanjut,
    // PENAMBHAN USER ID
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  }) = _SaveTindakLanjut;

  // ============================================= RIWAYAT KEHAMILAN =========================== //
  const factory AsesmenIgdEvent.getRiwayatKehamilan({required String noreg}) =
      _GetRiwayatKehamilan;

  const factory AsesmenIgdEvent.saveRiwayatKehamilan({
    required RiwayatKehamilanModel riwayatKehamilan,
    required String noreg,
    // PENAMBHAN USER ID
    required String person,
    required String deviceID,
    required String pelayanan,
  }) = _SaveRiwayatKehamilan;

  const factory AsesmenIgdEvent.hamilOnchanged({required bool value}) =
      _HamilOnchanged;

  const factory AsesmenIgdEvent.gravidaOnchanged({required String value}) =
      _GravidaOnchanged;

  const factory AsesmenIgdEvent.paraOnchanged({required String value}) =
      _ParaOnchanged;
  const factory AsesmenIgdEvent.abortusOnchanged({required String value}) =
      _AbourtusOnchanged;
  const factory AsesmenIgdEvent.hphtOnchanged({required String value}) =
      _HphtOnchanged;
  const factory AsesmenIgdEvent.ttpOnchanged({required String value}) =
      _TtpOnchanged;
  const factory AsesmenIgdEvent.leopoid1Onchanged({required String value}) =
      _Leopoid1Onchanged;
  const factory AsesmenIgdEvent.leopoid2Onchanged({required String value}) =
      _Leopoid2Onchanged;
  const factory AsesmenIgdEvent.leopoid3Onchanged({required String value}) =
      _Leopoid3Onchanged;
  const factory AsesmenIgdEvent.leopoid4Onchanged({required String value}) =
      _Leopoid4Onchanged;
  const factory AsesmenIgdEvent.ddjOnchanged({required String value}) =
      _DdjOnchanged;
  const factory AsesmenIgdEvent.vtOnchanged({required String value}) =
      _VtOnchanged;
  //============================================ END RIWAYAT KEHAMILAN ==========================
  // ======================================= SKRINING   RESIKO DEKUBITUS ============================================= //
  const factory AsesmenIgdEvent.dekubitusOnchaged1({required String value}) =
      _DekubitusOnchaged1;
  const factory AsesmenIgdEvent.dekubitusOnchaged2({required String value}) =
      _DekubitusOnchaged2;
  const factory AsesmenIgdEvent.dekubitusOnchaged3({required String value}) =
      _DekubitusOnchaged3;
  const factory AsesmenIgdEvent.dekubitusOnchaged4({required String value}) =
      _DekubitusOnchaged4;
  const factory AsesmenIgdEvent.dekubitusOnchagedAnak({required String value}) =
      _DekubitusOnchagedAnak;

  const factory AsesmenIgdEvent.getSkriningResikoDekubitus(
      {required String noreg}) = _GetSkriningResikoDekubitus;

  const factory AsesmenIgdEvent.saveSkriningResikoDekubitus({
    required SkriningResikoDekubitusModel skringinResikoDekubitusModel,
    required String noreg,
    // PENAMBHAN USER ID
    required String person,
    required String deviceID,
    required String pelayanan,
  }) = _SaveSkriningResikoDekubitus;

  // ======================================= END SKRINING   RESIKO DEKUBITUS ============================================= //

  // ===================================== ASESMEN INFORMASI DAN KELUHAN PADA ASESMEN IGD  ===================================== //
  const factory AsesmenIgdEvent.selectedInformasi({required String value}) =
      _SelectedInformasi;

  const factory AsesmenIgdEvent.selectedInformasiDetail(
      {required String value}) = _SelectedInformasiDetail;

  const factory AsesmenIgdEvent.beratBadanOnchanged({required String value}) =
      _BeratBadanOnchanged;

  const factory AsesmenIgdEvent.caraMasukOnchanged({required String value}) =
      _CaraMasukOnchanged;
  const factory AsesmenIgdEvent.caraMasukDetailOnchanged(
      {required String value}) = _CaraMasukDetailOnchanged;
  const factory AsesmenIgdEvent.asalMasukOnchanged({required String value}) =
      _AsalMasukOnchanged;
  const factory AsesmenIgdEvent.asalMasukDetailOnchanged(
      {required String value}) = _AsalMasukDetailOnchanged;
  const factory AsesmenIgdEvent.tinggiBadanOnchanged({required String value}) =
      _TinggiBadanOnchanged;
  const factory AsesmenIgdEvent.riwayatPenyakitOnchanged(
      {required String value}) = _RiwayatPenyakitOnchanged;
  const factory AsesmenIgdEvent.riwayatObatOnchanged({required String value}) =
      _RiwayatObatOnchanged;
  const factory AsesmenIgdEvent.fungsionalOnchanged({required String value}) =
      _FungsionalOnchanged;
  const factory AsesmenIgdEvent.resikoJatuh1Onchanged({required String value}) =
      _ResikoJatuhOnchanged;
  const factory AsesmenIgdEvent.resikoJatuh2Onchanged({required String value}) =
      _ResikoJatuh2Onchanged;
  const factory AsesmenIgdEvent.hasilKajiOnchanged({required String value}) =
      _HasilKajiOnchanged;

  const factory AsesmenIgdEvent.getInformasiDanKeluhan(
      {required String noreg}) = _GetInformasiDanKeluhan;

  const factory AsesmenIgdEvent.saveInformasiDanKeluhan({
    required AsesmenKeluhanIgdModel asemenKeluhanIgdModel,
    required String noreg,
    // PENAMBHAN USER ID
    required String person,
    required String deviceID,
    required String pelayanan,
  }) = _SaveInformasiDanKeluhan;

  // ========================================= END ASESMEN INFORMASI DAN KELUHAN PADA ASESMEN IGD

  // PEMERIKSAAN FISIK
  const factory AsesmenIgdEvent.selectedKepalaOnchanged(
      {required String value}) = _SelectedKepalaOnchanged;
  const factory AsesmenIgdEvent.kepalaDetailOnchanged({required String value}) =
      _KepalaDetailOnchanged;
  const factory AsesmenIgdEvent.lainLainOnchanged({required String value}) =
      _LainLainOnchanged;

  const factory AsesmenIgdEvent.selectedLeherOnchanged(
      {required String value}) = _SelectedLeherOnchanged;
  const factory AsesmenIgdEvent.leherDetailOnchanged({required String value}) =
      _LeherDetailOnchanged;

  const factory AsesmenIgdEvent.selectedDadaOnchanged({required String value}) =
      _SelectedDadaOnchanged;
  const factory AsesmenIgdEvent.dadaDetailOnchanged({required String value}) =
      _DadaDetailOnchanged;

  const factory AsesmenIgdEvent.selectedAbdomenOnchanged(
      {required String value}) = _SelectedAbdomenOnchanged;
  const factory AsesmenIgdEvent.abdomenDetailOnchanged(
      {required String value}) = _AbdomenDetailOnchanged;

  const factory AsesmenIgdEvent.selectedPunggungOnchanged(
      {required String value}) = _SelectedPunggungOnchanged;
  const factory AsesmenIgdEvent.punggunDetailSelected({required String value}) =
      _PunggunDetailSelected;

  const factory AsesmenIgdEvent.selectedGenetaliaOnchanged(
      {required String value}) = _SelectedGenetaliaOnchanged;

  const factory AsesmenIgdEvent.genetaliaDetailOnchanged(
      {required String value}) = _GenetaliaDetailOnchanged;

  const factory AsesmenIgdEvent.selectedEkstremitasOnchanged(
      {required String value}) = _SelectedEkstremitasOnchanged;
  const factory AsesmenIgdEvent.ekstreimtasDetailOnchanged(
      {required String value}) = _EkstreimtasDetailOnchanged;

  // ==== ANAMNESA
  const factory AsesmenIgdEvent.keluhanUtamaOnchanged({required String value}) =
      _KeluhanUtamaOnchanged;
  const factory AsesmenIgdEvent.telaahOnchanged({required String value}) =
      _TelaahOnchanged;
  const factory AsesmenIgdEvent.riwayatPenyakitDahuluOnchanged(
      {required String value}) = _RiwayatPenyakitDahuluOnchanged;
  const factory AsesmenIgdEvent.riwayatPenyakitDalamKeluargaOnchanged(
      {required String value}) = _RiwayatPenyakitDalamKeluargaOnchanged;
  const factory AsesmenIgdEvent.kesadaranOnchanged({required String value}) =
      _KesadaranOnchanged;
  const factory AsesmenIgdEvent.jenisPelayananOnchanged(
      {required String value}) = _JenisPelayananOnchanged;

  // ==== RENCANA TINDAK LANJUT
  const factory AsesmenIgdEvent.saveRencanaTindakLanjut({
    required String noreg,
    required String anjuran,
    required String alasanOpname,
    required String konsulKe,
    required String alasanKonsul,
    required String prognosis,
    // PENAMBHAN USER ID
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveRencanaTindakLanjut;

  const factory AsesmenIgdEvent.getRencanaTindakLanjut(
      {required String noreg}) = _GetRencanaTindakLanjut;

  // ================ FISIOTERAPI
  const factory AsesmenIgdEvent.getFisioTerapi() = _GetFisioTerapi;
  const factory AsesmenIgdEvent.getTaripFisioTerapi(
      {required String kodeBagian,
      required String debitur,
      required String kode}) = _GetTaripFisioTerapi;
  const factory AsesmenIgdEvent.addFisioterapiSelection(
      {required String value}) = _AddFisioterapiSelection;
  const factory AsesmenIgdEvent.clearFisioTerapi() = _ClearFisioTerapi;
  const factory AsesmenIgdEvent.deleteItemFisioterapi({required String value}) =
      _DeleteItemFisioterapi;
  const factory AsesmenIgdEvent.deleteItemSelectionFisioterapi(
      {required String value}) = _DeleteItemSelectionFisioterapi;
  const factory AsesmenIgdEvent.saveFisioterapi(
      {required InputPenunjangModel inputPenunjang}) = _SaveFisioterapi;

  // ========================== RADIOLOGI
  const factory AsesmenIgdEvent.getDetailTaripRadiologi(
      {required String kodeBagian,
      required String debitur,
      required String kode}) = _GetDetailTaripRadiologi;
  const factory AsesmenIgdEvent.getRadiologi() = _GetRadiologi;
  const factory AsesmenIgdEvent.addRadiologiSelection(
      {required String grupName}) = _AddRadiologiSelection;
  const factory AsesmenIgdEvent.clearRadiologi() = _ClearRadiologi;
  const factory AsesmenIgdEvent.deleteRadiologiSelection(
      {required String grupName}) = _DeleteRadiologiSelection;
  const factory AsesmenIgdEvent.saveRadiologi(
          {required InputPenunjangModel pemeriksaanPenunjangModel}) =
      _SaveRadiologi;

  // ============================= GIZi
  const factory AsesmenIgdEvent.getGizi() = _GetGizi;
  const factory AsesmenIgdEvent.getTaripGizi(
      {required String kodeBagian,
      required String debitur,
      required String kode}) = _GetTaripGizi;
  const factory AsesmenIgdEvent.deleteItemGizi({required String value}) =
      _DeleteItemGizi;
  const factory AsesmenIgdEvent.deleteItemSelectionGizi(
      {required String value}) = _DeleteItemSelectionGizi;
  const factory AsesmenIgdEvent.saveGizi(
      {required InputPenunjangModel inputPenunjangModel}) = _SaveGizi;

  // ============================ PEMERIKSAAN LABOR
  const factory AsesmenIgdEvent.inputDetailPemeriksaanLabor(
      {required InputDetailPemeriksaanLaborModel
          inputDetailPemeriksaanLaborModel}) = _InputDetailPemeriksaanLabor;
  const factory AsesmenIgdEvent.addLaborSelection({required String grupName}) =
      _AddLaborSelection;
  const factory AsesmenIgdEvent.addGiziSelection({required String value}) =
      _AddGiziSelection;
  const factory AsesmenIgdEvent.deleteGiziSelection({required String value}) =
      _DeleteGiziSelection;
  const factory AsesmenIgdEvent.clearGizi() = _ClearGizi;
  const factory AsesmenIgdEvent.savePemeriksaanPenunjan(
          {required InputPemeriksaanPenunjangModel inputPemeriksaanPenunjang}) =
      _SavePemeriksaanPenunjan;

  // ============================= LABOR
  const factory AsesmenIgdEvent.deleteLaborSelection(
      {required String grupName}) = _DeleteLaborSelection;
  const factory AsesmenIgdEvent.deleteItemRadiologi({required String value}) =
      _DeleteItemRadiologi;
  const factory AsesmenIgdEvent.deleteFisioTerapiItem({required String value}) =
      _DeleteFisioTerapiItem;
  const factory AsesmenIgdEvent.saveLabor(
          {required InputPemeriksaanPenunjangModel inputPemeriksaanPenunjang}) =
      _SaveLabor;

  // ============================== RENCANA TINDAK LANJUT
  const factory AsesmenIgdEvent.alasanObnameOnchanged({required String value}) =
      _AlasanObnameOnchanged;
  const factory AsesmenIgdEvent.prognosisOnchanged({required String value}) =
      _PrognosisOnchanged;
  const factory AsesmenIgdEvent.alasanKonsulKeOnchanged(
      {required String value}) = _AlasanKonsulKeOnchanged;
  const factory AsesmenIgdEvent.asuhanTerapiOnchanged({required String value}) =
      _AsuhanTerapiOnchanged;

  // ========================  PEMERIKSAAN
  const factory AsesmenIgdEvent.deleteItemPemeriksaan(
      {required String grupName}) = _DeleteItemPemeriksaan;
  const factory AsesmenIgdEvent.clearPemeriksaan() = _ClearPemeriksaan;
  const factory AsesmenIgdEvent.getKProcedure() = _GetKProcedure;
  const factory AsesmenIgdEvent.getDetailPemeriksaanLabor(
      {required String nameGrup}) = _GetDetailPemeriksaanLabor;
  const factory AsesmenIgdEvent.selectedDokter({required String dokter}) =
      _SelectedDokter;
  const factory AsesmenIgdEvent.resetImage() = _ResetImage;
  const factory AsesmenIgdEvent.getDokterSpesialis() = _GetDokterSpesialis;

  // =========================== LOKALIS
  const factory AsesmenIgdEvent.loadingSaveLokalis() = _LoadingSaveLokalis;
  const factory AsesmenIgdEvent.stopLoading() = _StopLoading;

  const factory AsesmenIgdEvent.saveStatusLokalis({
    required String noReg,
    required String imageUrl,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveStatusLokalis;

  const factory AsesmenIgdEvent.getStatusLokalis({required String noReg}) =
      _GetStatusLokalis;

  const factory AsesmenIgdEvent.getPemeriksaanFisik({required String noReg}) =
      _GetPemeriksaanFisik;

  const factory AsesmenIgdEvent.savePemeriksaanFisik({
    required PemeriksaanFisikModel pemeriksaanFisikModel,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SavePemeriksaanFisik;

  const factory AsesmenIgdEvent.getAnamnesaIGD({required String noReg}) =
      _GetAnamnesaIGD;
  const factory AsesmenIgdEvent.saveAnamnesaIGD({
    required AnamnesaIgdModel anamnesaIGD,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveAnamnesaIGD;
}
