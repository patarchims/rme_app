part of 'pasien_bloc.dart';

@freezed
class PasienEvent with _$PasienEvent {
  const factory PasienEvent.saveSkrining({
    required String kdBagian,
    required String noReg,
    required String k1,
    required String k2,
    required String k3,
    required String k4,
    required String k5,
    required String k6,
    required String kF1,
    required String kF2,
    required String kF3,
    required String kF4,
    required String b1,
    required String b2,
    required String rJ,
    required String iV1,
    required String iV2,
    required String iV3,
    required String iV4,
    required String tanggal,
    required String jam,
    required String user,
  }) = _SaveSkrining;

  const factory PasienEvent.riwayatPasien({required String noRM}) =
      RiwayatPasien;

  const factory PasienEvent.addRiwayatPasien(
          {required List<DetailProfilPasienModel> detailProfilePasien}) =
      addRiwayatPasien;

  const factory PasienEvent.selectedPasien(
      {required AntreanPasienModel pasien}) = SelectedPasien;

  const factory PasienEvent.saveStateSkrining(
      {required SkirningModel skrining}) = SaveStateSkrining;

  const factory PasienEvent.getOdontogram({required String noReg}) =
      GetOdontogram;

  const factory PasienEvent.saveRawatJalanDokter(
          {required AssementRawatJalanModel assementRawatJalanModel}) =
      SaveRawatJalanDokter;

  const factory PasienEvent.uploadOdontogram({required String noReg}) =
      UploadOdontogram;

  const factory PasienEvent.publishOdontogram(
      {required String noReg,
      required String picturePath,
      required String kdBagian}) = PublishOdontogram;

  const factory PasienEvent.getAssmentRawatjalanDokter(
      {required String noReg}) = GetAssmentRawatjalanDokter;

  const factory PasienEvent.saveAssesKebEdukasi(
          {required AssementKebEdukasiModel assementKebEdukasiModel}) =
      SaveAssesKebEdukasi;

  const factory PasienEvent.getKebEdukasi({required String noReg}) =
      GetKebEdukasi;

  const factory PasienEvent.getAssesRawatJalanPerawat({required String noReg}) =
      GetAssesRawatJalanPerawat;

  const factory PasienEvent.saveOdontogram(
      {required String noReg,
      required String noGigi,
      required String keterangan}) = _SaveOdontogram;

  const factory PasienEvent.saveAsesRawatJalanPerawat({
    required String kdBagian,
    required String noReg,
    required String kelUtama,
    required String riwayatPenyakit,
    required String riwayatObat,
    required String riwayatObatDetail,
    required String riwayatPenyakitDetail,
    required String riwayatSaatDirumah,
    required String tekananDarah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String beratBadan,
    required String tinggiBadan,
    required String skriningNyeri,
    required String psikologis,
    required String fungsional,
    required String perencanaanPemulangan,
    required String masalahKeperawatan,
    required String rencanaKeperawatan,
    required String aseskepHasilKajiRj,
    required String aseskepHasilKajiRjDetail,
    required String aseskepHasilKajiRjTindakan,
    required String aseskepNyeri,
    required String aseskepPulang1,
    required String aseskepPulang1Detail,
    required String aseskepPulang2,
    required String aseskepPulang2Detail,
    required String aseskepPulang3,
    required String aseskepPulang3Detail,
    required String aseskepRj1,
    required String aseskepRj2,
    required String fungsionalDetail,
    required String psikologisDetail,
  }) = _SaveAsesRawatJalanPerawat;

  const factory PasienEvent.deleteOdontogram(
      {required String noReg, required String noGigi}) = _DeleteOdontogram;

  const factory PasienEvent.getSkrining({required String noReg}) = _GetSkrining;
  const factory PasienEvent.started() = _Started;

  const factory PasienEvent.selectedNorm({required String norm}) =
      _SelectedNorm;

  const factory PasienEvent.addLoadingAnatomi({required bool enable}) =
      _AddLoadingAnatomi;

  const factory PasienEvent.addKeterangan({required String keterangan}) =
      _AddKeterangan;
  const factory PasienEvent.simpanAnatomi(
      {required String nama,
      required String norm,
      required String keterangan,
      required File picturePath}) = _SimpanAnatomi;
  const factory PasienEvent.saveAnatomi(
      {required String nama,
      required String norm,
      required String keterangan,
      required String picturePath}) = _SaveAnatomi;
  const factory PasienEvent.getAntreanPasien() = _GetAntreanPasien;
  const factory PasienEvent.getKVitalSign() = _GetKVitalSign;
  const factory PasienEvent.getDetailPasien({required String noRM}) =
      _GetDetailPasien;
  const factory PasienEvent.addPasien(
      {required List<AntreanPasienModel> antreanPasien}) = _AddPasien;
}
