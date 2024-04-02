import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/hasil_asuhan_keperawatan_model.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_pasien_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_penunjang_model.dart';
import 'package:hms_app/domain/models/response/input_penunjang_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/asesmen_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/repository/pengkajian_response_persistem_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/resiko_jatuh_kebidanan_response_model.dart';
import 'package:hms_app/presentation/pages/igd/repository/igd_triase_igd_dokter_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/ktaripobat_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository_dokter_methodist.dart';
import 'package:hms_app/presentation/pages/igd/repository/tanda_vital_igd_dokter_repository.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:hms_app/presentation/perina/repository/ddown_score_perina_response_model.dart';
import 'package:hms_app/presentation/perina/repository/dvital_sign_perina_respone_model.dart';
import 'package:hms_app/presentation/perina/repository/pemeriksaan_fisik_perina_reponse_model.dart';
import 'package:hms_app/presentation/perina/repository/tindak_lajut_perin_dokter_response_model.dart';

import '../../../presentation/perina/repository/apgar_score_response_model.dart';

abstract class DTO {
  // ANAMNESA
  static Future<Map<String, dynamic>> saveAnamnesa({
    required String noReg,
    required String keluhUtama,
    required String jenisPelayanan,
    required String rwtSekarang,
    required String rwtDulu,
    required String rwtObat,
    required String rwtPenyKeluarga,
    required String rwtPenyAlergi,
    required String rwtPenyAlergiDetail,
    required String khusPemGigi1,
    required String khusPemGigi2,
    required String khusPemGigi3,
    required String khusPemGigi4,
    required String khusPemGigi5,
    required String khusPemGigi5Detail,
  }) async {
    return {
      "noReg": noReg,
      "keluhUtama": keluhUtama,
      "jenisPelayanan": jenisPelayanan,
      "rwtSekarang": rwtSekarang,
      "rwtDulu": rwtDulu,
      "rwtObat": rwtObat,
      "rwtPenyKeluarga": rwtPenyKeluarga,
      "rwtPenyAlergi": rwtPenyAlergi,
      "rwtPenyAlergiDetail": rwtPenyAlergiDetail,
      "khusPemGigi1": khusPemGigi1,
      "khusPemGigi2": khusPemGigi2,
      "khusPemGigi3": khusPemGigi3,
      "khusPemGigi4": khusPemGigi4,
      "khusPemGigi5": khusPemGigi5,
      "khusPemGigi5Detail": khusPemGigi5Detail
    };
  }

  static Future<Map<String, dynamic>> saveAssesJalanDokter({
    required String nama,
    required String norm,
    required String keterangan,
    required String picturePath,
  }) async {
    return {
      'nama': nama,
      'norm': norm,
      'keterangan': keterangan,
      'imageUrl': await MultipartFile.fromFile(
        picturePath,
      )
    };
  }

  static Map<String, dynamic> onGetPemeriksaanFisikPerina({
    required String noReg,
    required String person,
  }) {
    return {"noreg": noReg, "person": person};
  }

  static Map<String, dynamic> onSaveApgarScore({
    required String noReg,
    required ApgarScoreModel score,
  }) {
    return {
      "no_reg": noReg,
      "waktu": score.waktu,
      "jantung": score.jantung,
      "nafas": score.nafas,
      "otot": score.otot,
      "refleksi": score.refleksi,
      "warna_kulit": score.warnaKulit,
      "total": score.total
    };
  }

  static Map<String, dynamic> onSaveKeperawatanBayi({
    required String devicesID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String noRM,
    required RiwayatKehamilanPerinaModel kehamilanPerinal,
  }) {
    return {
      "device_id": devicesID,
      "pelayanan": pelayanan,
      "person": person,
      "noreg": noReg,
      "no_rm": noRM,
      "tahu_kelahiran": kehamilanPerinal.tahubPersalinan,
      "jenis_kelamin": kehamilanPerinal.jk,
      "tempat_persalinan": kehamilanPerinal.tempatPersalinan,
      "berat_badan": kehamilanPerinal.bb,
      "keadaan": kehamilanPerinal.keadaanSekarang,
      "komplikasi_kehamilan": kehamilanPerinal.komplikasiHamil,
      "komplikasi_persalinan": kehamilanPerinal.komplikasiPersalinan,
      "jenis_persalinan": kehamilanPerinal.jenisPersalinan,
    };
  }

  static Map<String, dynamic> onSaveAsesmenBayi({
    required String devicesID,
    required String person,
    required String noReg,
    required String noRM,
    required String dpjp,
    required String pelayanan,
    required AsesmenBayiModel asesmen,
  }) {
    return {
      "device_id": devicesID,
      "pelayanan": pelayanan,
      "person": person,
      "no_reg": noReg,
      "dpjp": dpjp,
      "no_rm": noRM,
      "aseskep_bayi_prenatal_persalinan": asesmen.prenatalPersalinan,
      "pekerjaan_ibu": asesmen.pekerjaanIbu,
      "dokter_obgyn": asesmen.dokterObgyn,
      "dokter_anak": asesmen.dokterAnak,
      "nama_ayah": asesmen.namaAyah,
      "pekerjaan_ayah": asesmen.pekerjaanAyah,
      "pendarahan_prenatal": asesmen.pendarahanPrenatal,
      "prenatal_obat_obatan": asesmen.obatObatanYangdikomsumsi,
      "perkawinan_ayah": asesmen.perkawinanAyah,
      "riwayat_penyakit_ayah": asesmen.riwayatPenyakitAyah,
      "usia_kehamilan": asesmen.usiaKehamilan,
      "nama_ibu": asesmen.namaIbu,
      "jumlah_hari": asesmen.prenatalJumlahHari,
      "perkawinan_ibu": asesmen.perkawinanIbu,
      "penyakit_ibu": asesmen.penyakitIbu,
      "nama_pjawab": asesmen.namaPjawab,
      "usia_pjawab": asesmen.usiaPjawab,
      "pekerjaan_pjawab": asesmen.pekerjaanPjawab,
      "usia_persalinan": asesmen.usiaPersalinan,
      "tgl_lahir": asesmen.rwtTglLahir,
      "menangis": asesmen.menangis,
      "jenis_kelamin": asesmen.jenisKelamin,
      "keterangan": asesmen.keterangan,
      "prenatal_usia_kehamilan": asesmen.prenatalUsiaKehamilan,
      "prenatal_jam": asesmen.prenatalJam,
      "prenatal_komplikasi": asesmen.prenatalKomplikasi,
      "prenatal_his": asesmen.prenatalHis,
      "prenatal_ttp": asesmen.prenatalTtp,
      "prenatal_ketuban": asesmen.natalKetuban,
      "prenatal_persalinan": asesmen.prenatalPersalinan,
      "rwt_usia_persalinan": asesmen.usiaPersalinan,
      "rwt_lahir_dengan": asesmen.rwtLahirDengan,
      "rwt_jenis_kelamin": asesmen.jenisKelamin,
      "rwt_kelahiran_bayi": asesmen.rwtKelahiranBayi,
      "rwt_menangis": asesmen.menangis,
      "rwt_keterangan": asesmen.keterangan,
      "prenatal_usia_persalinan": asesmen.prenatalUsiaPersalinan,
      "natal_persalinan": asesmen.natalPersalinan,
      "natal_kpd": asesmen.natalKpd,
      "natal_keadaan": asesmen.natalKeadaan,
      "natal_tindakan_diberikan": asesmen.natalTindakanDiberikan,
      "natal_post": asesmen.natalPost,
      "natal_prestasi": asesmen.natalPrestasi,
      "natal_ditolong_oleh": asesmen.natalDitolongOleh,
      "natal_ketuban": asesmen.natalKetuban,
      "natal_letak": asesmen.natalLetak,
      "natal_lahir_umur": asesmen.natalLahirUmur,
      "natal_komplikasi": asesmen.natalKomplikasi,
      "natal_volume": asesmen.natalVolume,
      "prenatal_kebiasaan_ibu": asesmen.prenatalKebiasaanIbu,
      "prenatal_jumlah_hari": asesmen.prenatalJumlahHari,
    };
  }

  static Future<FormData> saveImageLokalis({
    required String noReg,
    required String picturePath,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) async {
    return FormData.fromMap({
      'noReg': noReg,
      'imageUrl': await MultipartFile.fromFile(
        picturePath,
      ),
      "person": person,
      "user_id": userID,
      "device_id": deviceID,
      "pelayanan": pelayanan
    });
  }

  static Future<FormData> saveIdentitasBayi({
    required String noReg,
    required String picturePath1,
    required String picturePath2,
    required String person,
    required String deviceID,
    required String pelayanan,
    required String kategori,
    required String dpjp,
    required String pemberiGelang,
    required String namaPenentuJK,
    required String namaWali,
    required String jamKelahiranBayi,
  }) async {
    return FormData.fromMap({
      'noReg': noReg,
      'ttd1': await MultipartFile.fromFile(
        picturePath1,
      ),
      'ttd2': await MultipartFile.fromFile(
        picturePath2,
      ),
      "person": person,
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "kategori": kategori,
      "dpjp": dpjp,
      "pemberi-gelang": pemberiGelang,
      "nama-penentu-jk": namaPenentuJK,
      "nama-wali": namaWali,
      "jam-kelahiran": jamKelahiranBayi,
    });
  }

  static Future<FormData> uploadIdentitasBayi({
    required String noReg,
    required String imageURL,
    required String kategori,
    required String dpjp,
  }) async {
    return FormData.fromMap({
      'noReg': noReg,
      'imageUrl': await MultipartFile.fromFile(imageURL),
      "kategori": kategori,
      "dpjp": dpjp
    });
  }

  static Future<Map<String, dynamic>> saveOdontogramImages({
    required String noReg,
    required String kdBagian,
    required String picturePath,
  }) async {
    return {
      'noReg': noReg,
      'kdBagian': kdBagian,
      'imageUrl': await MultipartFile.fromFile(
        picturePath,
      )
    };
  }

  static Future<Map<String, dynamic>> saveLokalis({
    required String noReg,
    required String picturePath,
  }) async {
    return {
      'noReg': noReg,
      'imageUrl': await MultipartFile.fromFile(
        picturePath,
      )
    };
  }

  static Map<String, String> saveAsesRawatJalanPerawat({
    required String kdBagian,
    required String noReg,
    required String kelUtama,
    required String riwayatPenyakit,
    required String riwayatPenyakitDetail,
    required String riwayatSaatDirumah,
    required String riwayatObat,
    required String riwayatObatDetail,
    required String tekananDarah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String beratBadan,
    required String tinggiBadan,
    required String skriningNyeri,
    required String psikologis,
    required String psikologisDetail,
    required String fungsional,
    required String fungsionalDetail,
    required String aseskepHasilKajiRj,
    required String aseskepHasilKajiRjTindakan,
    required String aseskepNyeri,
    required String aseskepHasilKajiRjDetail,
    required String aseskepPulang1,
    required String aseskepPulang1Detail,
    required String aseskepPulang2,
    required String aseskepPulang2Detail,
    required String aseskepPulang3,
    required String aseskepPulang3Detail,
    required String aseskepRj1,
    required String aseskepRj2,
    required String perencanaanPemulangan,
    required String masalahKeperawatan,
    required String rencanaKeperawatan,
  }) {
    return {
      "kdBagian": kdBagian,
      "noReg": noReg,
      "kelUtama": kelUtama,
      "riwayatPenyakit": riwayatPenyakit,
      "riwayatPenyakitDetail": riwayatPenyakitDetail,
      "riwayatSaatDirumah": riwayatSaatDirumah,
      "riwayatObat": riwayatObat,
      "riwayatObatDetail": riwayatObatDetail,
      "tekananDarah": tekananDarah,
      "nadi": nadi,
      "suhu": suhu,
      "pernapasan": pernapasan,
      "beratBadan": beratBadan,
      "tinggiBadan": tinggiBadan,
      "skriningNyeri": skriningNyeri,
      "psikologis": psikologis,
      "psikologisDetail": psikologisDetail,
      "fungsional": fungsional,
      "fungsionalDetail": fungsionalDetail,
      "aseskepRj1": aseskepRj1,
      "aseskepRj2": aseskepRj2,
      "aseskepHasilKajiRj": aseskepHasilKajiRj,
      "aseskepHslKajiRjTind": aseskepHasilKajiRjTindakan,
      "aseskepNyeri": aseskepNyeri,
      "aseskepHasilKajiRjDetail": aseskepHasilKajiRjDetail,
      "aseskepPulang1": aseskepPulang1,
      "aseskepPulang1Detail": aseskepPulang1Detail,
      "aseskepPulang2": aseskepPulang2,
      "aseskepPulang2Detail": aseskepPulang2Detail,
      "aseskepPulang3": aseskepPulang3,
      "aseskepPulang3Detail": aseskepPulang3Detail,
      "perencanaanPemulangan": perencanaanPemulangan,
      "masalahKeperawatan": masalahKeperawatan,
      "rencanaKeperawatan": rencanaKeperawatan
    };
  }

  static Map<String, String> skrining({
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
  }) {
    return {
      "Content-Type": "application/json",
      "kdBagian": kdBagian,
      "noReg": noReg,
      "k1": k1,
      "k2": k2,
      "k3": k3,
      "k4": k4,
      "k5": k5,
      "k6": k6,
      "KF1": kF1,
      "KF2": kF2,
      "KF3": kF3,
      "KF4": kF4,
      "B1": b1,
      "B2": b2,
      "RJ": rJ,
      "IV1": iV1,
      "IV2": iV2,
      "IV3": iV3,
      "IV4": iV4,
    };
  }

  static Map<String, String> sendOTP(
      {required String nik,
      required String idKaryawan,
      required String email}) {
    return {
      "Content-Type": "application/json",
      "nik": nik,
      "idKaryawan": idKaryawan,
      "email": email
    };
  }

  static Map<String, String> getSkrining({
    required String noReg,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
    };
  }

  static Map<String, String> onDeleteRiwayatKehamilanLalu({
    required String nomor,
    required String noReg,
    required String noRM,
  }) {
    return {
      "Content-Type": "application/json",
      "kd_riwayat": nomor,
      "no_reg": noReg,
      "no_rm": noRM
    };
  }

  static Map<String, dynamic> getDiagnosa({
    required String code,
    int? page,
    int? limit,
  }) {
    return {
      'page': page ?? 1,
      'limit': limit ?? 10,
      'code': code,
    };
  }

  static Map<String, String> noReg({
    required String noReg,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
    };
  }

  static Map<String, String> getIdentitasBayi({
    required String noReg,
    required String noRM,
  }) {
    return {"Content-Type": "application/json", "no_reg": noReg, "no_rm": noRM};
  }

  static Map<String, String> cariIntervensi({
    required String slki,
  }) {
    return {
      "Content-Type": "application/json",
      "slki": slki,
    };
  }

  static Map<String, String> cariSIKI({
    required String siki,
  }) {
    return {
      "Content-Type": "application/json",
      "siki": siki,
    };
  }

  static Map<String, String> saveInformasiMedis(
      {required String noReg,
      required String kdBagian,
      required String masalahMedis,
      required String terapi,
      required String pemeriksaanFisik,
      required String anjuran}) {
    return {
      "no_reg": noReg,
      "kd_bagian": kdBagian,
      "masalah_medis": masalahMedis,
      "terapi": terapi,
      "pemeriksaan_fisik": pemeriksaanFisik,
      "anjuran": anjuran
    };
  }

  static Map<String, String> getInformasiMedis({
    required String noReg,
    required String kdBagian,
  }) {
    return {"no_reg": noReg, "kd_bagian": kdBagian};
  }

  static Map<String, String> getNoreg({
    required String noReg,
  }) {
    return {"no_reg": noReg};
  }

  static Map<String, String> onValidasiAnalisaData({
    required String noReg,
    required String tanggal,
    required String jam,
    required String kodeAnalisa,
  }) {
    return {
      "no_reg": noReg,
      "tanggal": tanggal,
      "jam": jam,
      "kode_analisa": kodeAnalisa
    };
  }

  static Map<String, String> getVitalSignBidan({
    required String noReg,
    required String person,
  }) {
    return {"no_reg": noReg, "person": person};
  }

  static Map<String, String> onGetAsesmenKebidananEvent({
    required String noReg,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
    };
  }

  static Map<String, String> onDeleteAnalisaData({
    required String kodeAnalisa,
  }) {
    return {
      "kode_analisa": kodeAnalisa,
    };
  }

  static Map<String, dynamic> onSaveAnalisaData(
      {required String noReg,
      required String data,
      required List<DiagnosaKeperawatanModel> diagnosaKeperawatanModel}) {
    List<Map<String, dynamic>> list =
        diagnosaKeperawatanModel.map((model) => model.toJson()).toList();

    return {"no_reg": noReg, "data": data, "diagnosa": list};
  }

  static Map<String, String> onSaveAsesmenKebidananEvent({
    required String noReg,
    required String person,
    required String dpjp,
    required String pelayanan,
    required String deviceID,
    required AsesmenKebidananModel asesmenKebidanan,
  }) {
    return {
      "pelayanan": pelayanan,
      "dpjp": dpjp,
      "no_reg": noReg,
      "person": person,
      "device_id": deviceID,
      "gravida": asesmenKebidanan.gravida,
      "abortus": asesmenKebidanan.abortus,
      "para": asesmenKebidanan.para,
      "haid": asesmenKebidanan.haid,
      "haid_terakhir": asesmenKebidanan.haidTerakhir,
      "usia_kehamilan": asesmenKebidanan.usiaKehamilan,
      "partus_hpl": asesmenKebidanan.partusHpl,
      "leopold1": asesmenKebidanan.leopold1,
      "leopold2": asesmenKebidanan.leopold2,
      "leopold3": asesmenKebidanan.leopold3,
      "leopold4": asesmenKebidanan.leopold4,
      "hodge": asesmenKebidanan.hodge,
      "inspeksi": asesmenKebidanan.inspeksi,
      "inspekulo_v": asesmenKebidanan.inspekuloV,
      "inspekulo_p": asesmenKebidanan.inspekuloP,
      "pemeriksaan_dalam": asesmenKebidanan.pemeriksaanDalam,
      "hamil_muda": asesmenKebidanan.hamilMuda,
      "hamil_tua": asesmenKebidanan.hamilTua,
      "tbj": asesmenKebidanan.tbj,
      "tfu": asesmenKebidanan.tfu,
      "palpasi": asesmenKebidanan.palpasi,
      "nyeri_tekan": asesmenKebidanan.nyeriTekan
    };
  }

  static Map<String, String> getAsesmenKebidanan({
    required String noReg,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
    };
  }

  static Map<String, String> onGetPengkajianPersistem({
    required String noReg,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
    };
  }

  static Map<String, String> gerPemeriksaanFisik({
    required String noReg,
    required String person,
  }) {
    return {"no_reg": noReg, "person": person};
  }

  static Map<String, String> noRiwayat({
    required String noRiwayat,
    required String noReg,
  }) {
    return {"kd_riwayat": noRiwayat, "no_reg": noReg};
  }

  static Map<String, dynamic> deleteRiwayatKehamilan({
    required int iD,
    required String noReg,
  }) {
    return {"id": iD, "no_reg": noReg};
  }

  static Map<String, dynamic> onDeleteDiagnosaKebidanan({
    required int noDiagnosa,
  }) {
    return {"no_diagnosa": noDiagnosa};
  }

  static Map<String, dynamic> getReportTriase({
    required String noReg,
  }) {
    return {
      "no_reg": noReg,
    };
  }

  static Map<String, dynamic> report({
    required String noReg,
  }) {
    return {
      "no_reg": noReg,
    };
  }

  static Map<String, String> getNoRM({
    required String noRM,
  }) {
    return {"no_rm": noRM};
  }

  static Map<String, dynamic> onDeleteCPPTPasien({
    required String noRM,
    required int no,
  }) {
    return {
      "no_rm": noRM,
      "no": no,
    };
  }

  static Map<String, dynamic> onUpdateCPPTPasien({
    required int idCPPT,
    required String bagian,
    required String subjektif,
    required String objektif,
    required String asesmen,
    required String plan,
    required String ppa,
    required String instruksiPPA,
  }) {
    return {
      "id_cppt": idCPPT,
      "bagian": bagian,
      "subjektif": subjektif,
      "objektif": objektif,
      "asesmen": asesmen,
      "plan": plan,
      "ppa": ppa,
      "instruksi_ppa": instruksiPPA,
    };
  }

  static Map<String, dynamic> onSavePengkajianNutrisi({
    required String noReg,
    required String deviceID,
    required String n1,
    required String n2,
    required int nilai,
  }) {
    return {
      "noreg": noReg,
      "device_id": deviceID,
      "n1": n1,
      "n2": n2,
      "nilai": nilai
    };
  }

  static Map<String, dynamic> onSavePemeriksaanFisikKebidanan({
    required String deviceID,
    required String person,
    required String pelayanan,
    required String noReg,
    required String kepala,
    required String mata,
    required String telinga,
    required String mulut,
    required String gigi,
    required String hidung,
    required String tenggorokan,
    required String payudara,
    required String leherDanBahu,
    required String mucosaMulut,
    required String abdomen,
    required String nutrisiDanHidrasi,
  }) {
    return {
      "device_id": deviceID,
      "person": person,
      "pelayanan": pelayanan,
      "noreg": noReg,
      "kepala": kepala,
      "mata": mata,
      "telinga": telinga,
      "mulut": mulut,
      "gigi": gigi,
      "hidung": hidung,
      "tenggorokan": tenggorokan,
      "payudara": payudara,
      "leher_dan_bahu": leherDanBahu,
      "mucosa_mulut": mucosaMulut,
      "abdomen": abdomen,
      "nutrisi_dan_hidrasi": nutrisiDanHidrasi
    };
  }

  static Map<String, dynamic> onInsertRiwayatPengobatan({
    required String noReg,
    required String deviceID,
    required String userID,
    required String namaObat,
    required String dosis,
    required String caraPemberian,
    required String frekuensi,
    required String waktuPemberian,
  }) {
    return {
      "device_id": deviceID,
      "user_id": userID,
      "no_reg": noReg,
      "nama_obat": namaObat,
      "dosis": dosis,
      "cara_pemberian": caraPemberian,
      "frekuensi": frekuensi,
      "waktu_pemberian": waktuPemberian
    };
  }

  static Map<String, dynamic> onSaveAsesmenAwalKebidanan({
    required String noReg,
    required String deviceID,
    required String keluhanUtama,
    required String penyakitSekarang,
    required String keluhanMenyertai,
    required String riwayatMenstruasi,
    required String siklusHaid,
    required String riwayataPernikahan,
    required String riwayatDahulu,
    required String person,
    required String pelayanan,
  }) {
    return {
      "no_reg": noReg,
      "device_id": deviceID,
      "keluhan_utama": keluhanUtama,
      "penyakit_sekarang": penyakitSekarang,
      "keluhan_menyertai": keluhanMenyertai,
      "riwayat_menstruasi": riwayatMenstruasi,
      "siklus_haid": siklusHaid,
      "riwayat_pernikahan": riwayataPernikahan,
      "penyakit_dahulu": riwayatDahulu,
      "person": person,
      "pelayanan": pelayanan
    };
  }

  static Map<String, dynamic> onSavePengkajianPersistemKebidanan({
    required String noReg,
    required String deviceID,
    required String pelayanan,
    required String person,
    required PengkajianPersistemKebidananResponse pengkajianKebidanan,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
      "pelayanan": pelayanan,
      "divice_id": deviceID,
      "eliminasi_bak": pengkajianKebidanan.eliminasiBak,
      "eliminasi_bab": pengkajianKebidanan.eliminasiBab,
      "istirahat": pengkajianKebidanan.istirahat,
      "aktivitas": pengkajianKebidanan.aktivitas,
      "mandi": pengkajianKebidanan.mandi,
      "berpakaian": pengkajianKebidanan.berpakaian,
      "makan": pengkajianKebidanan.makan,
      "eliminasi": pengkajianKebidanan.eliminasi,
      "mobilisasi": pengkajianKebidanan.mobilisasi,
      "kardiovaskuler": pengkajianKebidanan.kardiovaskuler,
      "respiratori": pengkajianKebidanan.respiratori,
      "secebral": pengkajianKebidanan.secebral,
      "perfusi_perifer": pengkajianKebidanan.perfusiPerifer,
      "pencernaan": pengkajianKebidanan.pencernaan,
      "integumen": pengkajianKebidanan.integumen,
      "kenyamanan": pengkajianKebidanan.kenyamanan,
      "proteksi": pengkajianKebidanan.proteksi,
      "paps_smer": pengkajianKebidanan.papsSmer,
      "hamil": pengkajianKebidanan.hamil,
      "pendarahan": pengkajianKebidanan.pendarahan,
      "hambatan_bahasa": pengkajianKebidanan.hambatanBahasa,
      "cara_belajar": pengkajianKebidanan.caraBelajar,
      "bahasa_sehari": pengkajianKebidanan.bahasaSehari,
      "spikologis": pengkajianKebidanan.spikologis,
      "hambatan_sosial": pengkajianKebidanan.hambatanSosial,
      "hambatan_ekonomi": pengkajianKebidanan.hambatanEkonomi,
      "spiritual": pengkajianKebidanan.spiritual,
      "response_emosi": pengkajianKebidanan.responseEmosi,
      "nilai_kepercayaan": pengkajianKebidanan.nilaiKepercayaan,
      "presepsi_sakit": pengkajianKebidanan.presepsiSakit,
      "khusus_kepercayaan": pengkajianKebidanan.khususKepercayaan,
      "thermoregulasi": pengkajianKebidanan.thermoregulasi,
    };
  }

  static Map<String, dynamic> onSaveDiagnosaKebidanan({
    required String noReg,
    required String deviceID,
    required String userID,
    required Iterable<DiagnosaKebidananModel> diagnosa,
  }) {
    List<Map<String, dynamic>> list =
        diagnosa.map((model) => model.toJson()).toList();
    return {
      "device_id": deviceID,
      "user_id": userID,
      "no_reg": noReg,
      "diagnosa": list,
    };
  }

  static Map<String, dynamic> onSaveTandaVitalKebidanan({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String tekananDarah,
    required String nadi,
    required String pernapasan,
    required String suhu,
    required String tinggiBadan,
    required String beratBadan,
    required String gcsE,
    required String gcsV,
    required String gcsM,
    required String ddj,
    required String tfu,
  }) {
    return {
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "person": person,
      "no_reg": noReg,
      "tekanan_darah": tekananDarah,
      "nadi": nadi,
      "pernapasan": pernapasan,
      "suhu": suhu,
      "ddj": ddj,
      "tinggi_badan": tinggiBadan,
      "berat_badan": beratBadan,
      "gcs_e": gcsE,
      "gcs_v": gcsV,
      "gcs_m": gcsM,
      "tfu": tfu,
    };
  }

  static Map<String, dynamic> onSaveRiwayatKehamilanBidan({
    required String deviceID,
    required String tahun,
    required String tempat,
    required String noReg,
    required String umur,
    required String jenisPersalinan,
    required String penolong,
    required String penyulit,
    required String nifas,
    required String jenisKelamin,
    required String beratBadan,
    required String keadaanSekarang,
  }) {
    return {
      "device_id": deviceID,
      "tahun": tahun,
      "tempat": tempat,
      "no_reg": noReg,
      "umur": umur,
      "jenis_persalinan": jenisPersalinan,
      "penolong": penolong,
      "penyulit": penyulit,
      "nifas": nifas,
      "j_kelamin": jenisKelamin,
      "berat_badan": beratBadan,
      "keadaan_sekarang": keadaanSekarang,
    };
  }

  static Map<String, dynamic> onSaveDataEWS({
    required String kesadaran,
    required String noreg,
    required int td,
    required int nadi,
    required int pernapasan,
    required String reaksiOtot,
    required int suhu,
    required int spo2,
    required int crt,
    required int skalaNyeri,
  }) {
    return {
      "noreg": noreg,
      "kesadaran": kesadaran,
      "td": td,
      "pernapasan": pernapasan,
      "reaksi_otot": reaksiOtot,
      "suhu": suhu,
      "spo2": spo2,
      "crt": crt,
      "nadi": nadi,
      "skala_nyeri": skalaNyeri,
    };
  }

  static Map<String, dynamic> onDelete({
    required int iD,
  }) {
    return {
      "id": iD,
    };
  }

  static Map<String, dynamic> onSaveResikoJatuhKebidanan({
    required String noReg,
    required String inserPC,
    required String pelayanan,
    required ResikoJatuhKebidananModel resikoJatuh,
  }) {
    return {
      "noreg": noReg,
      "insert_pc": inserPC,
      "pelayanan": pelayanan,
      "kategori": "Bidan",
      "r_jatuh": resikoJatuh.rJatuh,
      "diagnosis": resikoJatuh.diagnosis,
      "terpasang_infuse": resikoJatuh.terpasangInfuse,
      "alat_bantu1": resikoJatuh.alatBantu1,
      "alat_bantu2": resikoJatuh.alatBantu2,
      "alat_bantu3": resikoJatuh.alatBantu3,
      "total": resikoJatuh.total
    };
  }

  static Map<String, dynamic> onSavePengkajianFungsional({
    required String deviceID,
    required String noReg,
    required String f1,
    required String f2,
    required String f3,
    required String f4,
    required String f5,
    required String f6,
    required String f7,
    required String f8,
    required String f9,
    required String f10,
    required int nilai,
  }) {
    return {
      "device_id": deviceID,
      "noreg": noReg,
      "f1": f1,
      "f2": f2,
      "f3": f3,
      "f4": f4,
      "f5": f5,
      "f6": f6,
      "f7": f7,
      "f8": f8,
      "f9": f9,
      "f10": f10,
      "nilai": nilai,
    };
  }

  static Map<String, dynamic> onSaveRiwayatKehamilan({
    required String deviceID,
    required String tahun,
    required String tempat,
    required String noReg,
    required String umur,
    required String jenisPersalinan,
    required String penolong,
    required String penyulit,
    required String nifas,
    required String jenisKelamin,
    required String beratBadan,
    required String keadaanSekarang,
  }) {
    return {
      "device_id": deviceID,
      "tahun": tahun,
      "tempat": tempat,
      "no_reg": noReg,
      "umur": umur,
      "jenis_persalinan": jenisPersalinan,
      "penolong": penolong,
      "penyulit": penyulit,
      "nifas": nifas,
      "j_kelamin": jenisKelamin,
      "berat_badan": beratBadan,
      "keadaan_sekarang": keadaanSekarang,
    };
  }

  static Map<String, String> onGetAsuhanKeperawatan({
    required String noReg,
    required String status,
  }) {
    return {
      "no_reg": noReg,
      "status": status,
    };
  }

  static Map<String, String> onDeleteAsuhanKeperawatan({
    required String noDaskep,
  }) {
    return {
      "no_daskep": noDaskep,
    };
  }

  static Map<String, dynamic> onClonseSILKI({
    required String noDaskep,
    required String noReg,
  }) {
    return {
      "no_reg": noReg,
      "no_daskep": noDaskep,
    };
  }

  static Map<String, dynamic> onGetRiwayatAlergi({
    required String noRM,
    required String noReg,
  }) {
    return {
      "no_rm": noRM,
      "no_reg": noReg,
    };
  }

  static Map<String, dynamic> getReport({
    required String noRM,
    required String noReg,
  }) {
    return {
      "no_rm": noRM,
      "no_reg": noReg,
    };
  }

  static Map<String, dynamic> saveAllDaskep({
    required String noReg,
    required HasilAsuhanKeperawatanModel hasilAsuhan,
  }) {
    return {
      "no_reg": noReg,
      "tanggal": hasilAsuhan.tanggal,
      "hasil": hasilAsuhan.hasil,
      "kode_diagnosa": hasilAsuhan.kodeDiagnosa,
      "no_daskep": hasilAsuhan.noDaskep,
      "diagnosa": hasilAsuhan.diagnosa.toJson(),
      "deskripsi_slki":
          List<dynamic>.from(hasilAsuhan.deskripsiSlki.map((x) => x.toJson())),
      "deskripsi_siki":
          List<dynamic>.from(hasilAsuhan.deskripsiSiki.map((x) => x.toJson())),
    };
  }

  static Map<String, dynamic> getReportCPTTPasien({
    required String noRM,
  }) {
    return {
      "no_rm": noRM,
    };
  }

  static Map<String, dynamic> getReportPengkajianRawatInap({
    required String noRM,
    required String noReg,
    required String tanggal,
  }) {
    return {"no_rm": noRM, "no_reg": noReg, "tanggal": tanggal};
  }

  static Map<String, dynamic> onDeleteAlergi(
      {required int no,
      required String noRm,
      required String kelompok,
      insertDttm}) {
    return {
      "nomor": no,
      "no_rm": noRm,
      "kelompok": kelompok,
      "insert_dttm": insertDttm
    };
  }

  static Map<String, dynamic> onSavePenyakitKeluarga({
    required String noRM,
    required String alergi,
    required String namaUser,
  }) {
    return {"no_rm": noRM, "alergi": alergi, "nama_user": namaUser};
  }

  static Map<String, dynamic> onGetPenyakitKeluarga({
    required String noRM,
    required String noReg,
  }) {
    return {"no_rm": noRM, "no_reg": noReg};
  }

  static Map<String, dynamic> onSaveDataAlergi({
    required String noRM,
    required String kelompok,
    required String alergi,
    required String namaUser,
  }) {
    return {
      "no_rm": noRM,
      "kelompok": kelompok,
      "alergi": alergi,
      "nama_user": namaUser
    };
  }

  static Map<String, dynamic> onGetRiwayatAlergiKeluarga({
    required String noRM,
    required String kelompok,
    required String alergi,
    required String namaUser,
  }) {
    return {
      "no_rm": noRM,
      "kelompok": kelompok,
      "alergi": alergi,
      "nama_user": namaUser
    };
  }

  static Map<String, dynamic> onSaveDaskepSLKI({
    required String noDaskep,
    required String kodeSLKI,
    required int idKriteria,
    required int hasil,
  }) {
    return {
      "no_daskep": noDaskep,
      "kode_slki": kodeSLKI,
      "id_kriteria": idKriteria,
      "hasil": hasil,
    };
  }

  static Map<String, String> getResikoJatuh({
    required String kategori,
    required String jenis,
  }) {
    return {"kategori_umur": kategori, "jenis": jenis};
  }

  static Map<String, String> getNameGrup({
    required String nameGrup,
  }) {
    return {"name_grup": nameGrup};
  }

  static Map<String, String> getData({
    required String noReg,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
    };
  }

  static Map<String, String> ringkasanMasukDanKeluar({
    required String noReg,
    required String noRM,
  }) {
    return {"Content-Type": "application/json", "no_reg": noReg, "no_rm": noRM};
  }
  // required List<ResikoJatuhPasienModel> resikoJatuh,

  static Map<String, dynamic> saveIntervensiResikoJatuh(
      {required List<ResikoJatuhPasienModel> newResikoJatuh,
      required String shift,
      required String noreg,
      required String person,
      required String kategori,
      required String deviceID,
      required String pelayanan}) {
    List<Map<String, dynamic>> list =
        newResikoJatuh.map((model) => model.toJson()).toList();

    return {
      "Content-Type": "application/json",
      "intervensi": list,
      "shift": shift,
      "noreg": noreg,
      "person": person,
      "kategori": kategori,
      "device_id": deviceID,
      "pelayanan": pelayanan
    };
  }

  static Map<String, dynamic> saveResikoJatuhPasien(
      {required List<ResikoJatuhPasienModel> newResikoJatuh,
      required String noreg,
      required String person,
      required String kategori,
      required String deviceID,
      required int skor,
      required String jenis,
      required String pelayanan}) {
    List<Map<String, dynamic>> list =
        newResikoJatuh.map((model) => model.toJson()).toList();

    return {
      "Content-Type": "application/json",
      "intervensi": list,
      "noreg": noreg,
      "person": person,
      "kategori": kategori,
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "skor": skor,
      "jenis": jenis,
    };
  }

  static Map<String, dynamic> saveAsesmentKeperawatanBidan(
      {required AsesmenKeperawatanBidanModel asesmenKeperawatanBidanModel,
      required List<IntervensiModel> intervesiModel,
      required String sdki,
      required String siki}) {
    List<Map<String, dynamic>> list =
        intervesiModel.map((model) => model.toMap()).toList();

    log(" DATA KEPERAWATAN : $list");

    return {
      "Content-Type": "application/json",
      "asesmen": asesmenKeperawatanBidanModel.toJson(),
      "intervensi": list,
      "sdki": sdki,
      "siki": siki
    };
  }

  // SAVE ASESEMEN KEPERAWTAN
  static Map<String, dynamic> saveAsesmenKeperawatanBidan(
      {required String noReg,
      required List<IntervensiModel> intervesiModel,
      required String sdki,
      required String siki}) {
    List<Map<String, dynamic>> list =
        intervesiModel.map((model) => model.toMap()).toList();

    return {
      "Content-Type": "application/json",
      "noreg": noReg,
      "intervensi": list,
      "sdki": sdki,
      "siki": siki
    };
  }

  // SAVE ASUHAN KEPERAWATAN
  static Map<String, dynamic> saveAsuhanKeperawatan(
      {required String noReg,
      required List<IntervensiModel> intervesiModel,
      required String sdki,
      required String siki}) {
    List<Map<String, dynamic>> list =
        intervesiModel.map((model) => model.toMap()).toList();

    log(" DATA KEPERAWATAN : $list");

    return {
      "Content-Type": "application/json",
      "noreg": noReg,
      "intervensi": list,
      "sdki": sdki,
      "siki": siki
    };
  }

  static Map<String, dynamic> inputPemeriksaanLaborDetail({
    required InputDetailPemeriksaanLaborModel inputDetailPemeriksaanLaborModel,
  }) {
    return inputDetailPemeriksaanLaborModel.toMap();
  }

  static Map<String, dynamic> inputPemeriksaanPenunjangMedik({
    required InputPemeriksaanPenunjangModel inputPemeriksaanPenunjangModel,
  }) {
    return inputPemeriksaanPenunjangModel.toMap();
  }

  static Map<String, dynamic> inputPenunjangModel({
    required InputPenunjangModel inputPenunjangModel,
  }) {
    return inputPenunjangModel.toMap();
  }

  static Map<String, String> saveDataMedik({
    required String noReg,
    required String golDarah,
    required String tekananDarah,
    required String tekananDarahDetail,
    required String penyJantung,
    required String penyJantungDetail,
    required String diabet,
    required String diabetDetail,
    required String haemop,
    required String haemopDetail,
    required String hepat,
    required String hepatDetail,
    required String penyLain,
    required String penyLainDetail,
    required String alergiObat,
    required String alergiObatDetail,
    required String alergiMakanan,
    required String alergiMakananDetail,
    required String kebiasaanBuruk,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
      "golDarah": golDarah,
      "tekananDarah": tekananDarah,
      "tekananDarahDetail": tekananDarahDetail,
      "penyJantung": penyJantung,
      "penyJantungDetail": penyJantungDetail,
      "diabet": diabet,
      "diabetDetail": diabetDetail,
      "haemop": haemop,
      "haemopDetail": haemopDetail,
      "hepat": hepat,
      "hepatDetail": hepatDetail,
      "penyLain": penyLain,
      "penyLainDetail": penyLainDetail,
      "alergiObat": alergiObat,
      "alergiObatDetail": alergiObatDetail,
      "alergiMakanan": alergiMakanan,
      "alergiMakananDetail": alergiMakananDetail,
      "kebiasaanBuruk": kebiasaanBuruk
    };
  }

  static Map<String, String> saveAsesmentAnamnesa({
    required String noReg,
    required String kelUtama,
    required String penyakitKeluarga,
    required String riwayatAlergi,
    required String riwayatSekarang,
    required String riwayatAlergiDetail,
    required String jenisPelayanan,
    required String gigi1,
    required String gigi2,
    required String gigi3,
    required String gigi4,
    required String gigi5,
    required String gigi5Detail,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
      "kelUtama": kelUtama,
      "riwayatSekarang": riwayatSekarang,
      "penyakitKeluarga": penyakitKeluarga,
      "riwayatAlergi": riwayatAlergi,
      "riwayatAlergiDetail": riwayatAlergiDetail,
      "jenisPelayanan": jenisPelayanan,
      "gigi1": gigi1,
      "gigi2": gigi2,
      "gigi3": gigi3,
      "gigi4": gigi4,
      "gigi5": gigi5,
      "gigi5Detail": gigi5Detail
    };
  }

  static Map<String, String> deleteDiagnosa({
    required String noReg,
    required String table,
  }) {
    return {
      "Content-Type": "application/json",
      "no_reg": noReg,
      "table": table
    };
  }

  static Map<String, String> saveDiagnosa({
    required String noReg,
    required String code,
    required String type,
    required String table,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
      "code": code,
      "type": type,
      "table": table,
      "person": person,
      "user_id": userID,
      "device_id": deviceID,
      "pelayanan": pelayanan
    };
  }

  static Map<String, String> saveRiwayatAlergi({
    required String noReg,
    required String keluhanUtama,
    required String statusAlergi,
    required String statusAlergiDetail,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) {
    return {
      "Content-Type": "application/json",
      "no_reg": noReg,
      "keluhan_utama": keluhanUtama,
      "status_alergi": statusAlergi,
      "status_alergi_detail": statusAlergiDetail,
      "person": person,
      "user_id": userID,
      "device_id": deviceID,
      "pelayanan": pelayanan
    };
  }

  static Map<String, String> download(
      {required String noReg,
      required String nama,
      required String tgLahir,
      required String norm,
      required String jenisKelamin}) {
    return {
      "noreg": noReg,
      "nama": nama,
      "tglLahir": tgLahir,
      "norm": norm,
      "jenisKelamin": jenisKelamin
    };
  }

  static Map<String, String> saveOdontogram({
    required String noReg,
    required String noGigi,
    required String keterangan,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
      "noGigi": noGigi,
      "keterangan": keterangan
    };
  }

  static Map<String, String> deleteOdontogram({
    required String noReg,
    required String noGigi,
  }) {
    return {
      "Content-Type": "application/json",
      "noReg": noReg,
      "noGigi": noGigi
    };
  }

  static Map<String, String> createAccount({
    required String nik,
    required String email,
    required String kodeModul,
    required String password,
    required String repeatPassword,
  }) {
    return {
      "kodeModul": kodeModul,
      "email": email,
      "nik": nik,
      "password": password,
      "repeatPassword": repeatPassword,
    };
  }

  static Map<String, String> onSaveTindakLajutPerinaDokter({
    required String noReg,
    required String pelayanan,
    required String deviceID,
    required String person,
    required TindakLajutModel tindakLanjut,
  }) {
    return {
      "noreg": noReg,
      "pelayanan": pelayanan,
      "device_id": deviceID,
      "tindakan_operasi": tindakLanjut.tindakanOperas,
      "tindak_lanjut": tindakLanjut.tindakLajut,
      "kontrol_ulang": tindakLanjut.kontrolUlang,
      "person": person,
    };
  }

  static Map<String, String> saveRencanaTindakLanjut({
    required String noreg,
    required String anjuran,
    required String alasanOpname,
    required String konsulKe,
    required String prognosis,
    // PENAMBAHAN USER ID
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String alasanKonsul,
  }) {
    return {
      "noreg": noreg,
      "anjuran": anjuran,
      "alasan_opname": alasanOpname,
      "konsul_ke": konsulKe,
      "prognosis": prognosis,
      "person": person,
      "user_id": userID,
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "alasan_konsul": alasanKonsul
    };
  }

  static Map<String, String> registerUser({
    required String nik,
    required String kodeModul,
    required String password,
  }) {
    return {"nik": nik, "kodeModul": kodeModul, "password": password};
  }

  static Map<String, String> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String kodeModul}) {
    return {
      "kodeModul": kodeModul,
      "email": email,
      "password": password,
    };
  }

  static Map<String, String> signInWithUserIDAndPassword(
      {required String userID,
      required String password,
      required String kodeModul}) {
    return {
      "kodeModul": kodeModul,
      "user_id": userID,
      "password": password,
    };
  }

  static Map<String, String> getDeskriptionSIKI({required String siki}) {
    return {"siki": siki};
  }

  static Map<String, String> getDeskripsiDiagnosa(
      {required String kodeDiagnosa}) {
    return {"kode_diagnosa": kodeDiagnosa};
  }

  static Map<String, String> verifikasiUser({
    required String verifikasiUser,
  }) {
    return {
      "activated_code": verifikasiUser,
    };
  }

  static Map<String, String> verifyOTP(
      {required String email, required String kodeOTP}) {
    return {
      "email": email,
      "kodeOtp": kodeOTP,
    };
  }

  static Map<String, String> cariKaryawan({required String params}) {
    return {"params": params};
  }

  static Map<String, String> cariDokter({required String params}) {
    return {"id_dokter": params};
  }

  static Map<String, String> getCPPTPasien({required String noRm}) {
    return {"no_rm": noRm};
  }

  static Map<String, String> saveCPPTPasien({
    required String deviceID,
    required String kelompok,
    required String kdbagian,
    required String pelayanan,
    required String noReg,
    required String dpjp,
    required String subjetif,
    required String objektif,
    required String asesmen,
    required String plan,
    required String ppa,
    required String waktu,
  }) {
    return {
      "ppa": ppa,
      "waktu": waktu,
      "device_id": deviceID,
      "kelompok": kelompok,
      "pelayanan": pelayanan,
      "kd_bagian": kdbagian,
      "noreg": noReg,
      "dpjp": dpjp,
      "subjektif": subjetif,
      "objektif": objektif,
      "asesmen": asesmen,
      "plan": plan
    };
  }

  static Map<String, dynamic> onDeleteRiwayatPenyakitKeluarga({
    required int nomor,
    required String noRM,
    required String kelompok,
  }) {
    return {"nomor": nomor, "no_rm": noRM, "kelompok": kelompok};
  }

  static Map<String, String> detailRadiologi(
      {required String kdBagian,
      required String debitur,
      required String kode}) {
    return {"kode_bagian": kdBagian, "debitur": debitur, "kode": kode};
  }

  static Map<String, String> checkToken({required String token}) {
    return {"Content-Type": "application/json", "x-token": token};
  }

  static Map<String, String> checkBearerToken({required String token}) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Map<String, String> noRM({required String noRM}) {
    return {"no_rm": noRM};
  }

  // SIMPAN DATA KELUHAN UTMA IGD
  static Map<String, dynamic> keluhanUtamaIGD({
    required String noRM,
    required String deviceID,
    required String noReg,
    required String tanggal,
    required String person,
    required String keluhanUtama,
    required String riwayatSekarang,
    required String pelayanan,
  }) {
    return {
      "device_id": deviceID,
      "no_rm": noRM,
      "no_reg": noReg,
      "tanggal": tanggal,
      "person": person,
      "keluhan_utama": keluhanUtama,
      "riwayat_sekarang": riwayatSekarang,
      "pelayanan": pelayanan
    };
  }

  // SIMPAN DATA KELUHAN UTMA IGD
  static Map<String, dynamic> onSaveDiagnosaBanding({
    required String noReg,
    required String person,
    required String diagnosaBanding,
    required String devicesID,
    required String pelayanan,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
      "diagnosa_banding": diagnosaBanding,
      "device_id": devicesID,
      "pelayanan": pelayanan,
    };
  }

  static Map<String, dynamic> onSaveResepObat({
    required String noReg,
    required String noRM,
    required String catatan,
    required String keterangan,
    required String deviceID,
    required String namaUser,
    required String namaPasien,
    required List<KTaripObatModel> selectionResep,
  }) {
    List<Map<String, dynamic>> list =
        selectionResep.map((model) => model.toJson()).toList();

    return {
      "noreg": noReg,
      "no_rm": noRM,
      "catatan": catatan,
      "keterangan": keterangan,
      "device_id": deviceID,
      "nama_user": namaUser,
      "nama_pasien": namaPasien,
      "resep": list,
    };
  }

  static Map<String, dynamic> pemeriksaanFisikIGDDokter({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noReg,
    required PemeriksaanFisikIgdDokter pemeriksaanFisik,
  }) {
    return {
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "person": person,
      "noreg": noReg,
      "kepala": pemeriksaanFisik.kepala,
      "mata": pemeriksaanFisik.mata,
      "tht": pemeriksaanFisik.tht,
      "mulut": pemeriksaanFisik.mulut,
      "leher": pemeriksaanFisik.leher,
      "dada": pemeriksaanFisik.dada,
      "jantung": pemeriksaanFisik.jantung,
      "paru": pemeriksaanFisik.paru,
      "perut": pemeriksaanFisik.perut,
      "hati": pemeriksaanFisik.hati,
      "limpa": pemeriksaanFisik.limpa,
      "ginjal": pemeriksaanFisik.ginjal,
      "alat_kelamin": pemeriksaanFisik.alatKelamin,
      "anggota_gerak": pemeriksaanFisik.anggotaGerak,
      "refleks": pemeriksaanFisik.refleks,
      "kekuatan_otot": pemeriksaanFisik.kekuatanOtot,
      "kulit": pemeriksaanFisik.kulit,
      "getah_bening": pemeriksaanFisik.getahBening,
      "rtvt": pemeriksaanFisik.rtvt,
      "jalan_nafas": pemeriksaanFisik.jalanNafas,
      "sirkulasi": pemeriksaanFisik.sirkulasi,
      "gigi": pemeriksaanFisik.gigi,
      "abdomen": pemeriksaanFisik.abdomen,
      "hidung": pemeriksaanFisik.hidung,
      "telinga": pemeriksaanFisik.telinga,
    };
  }

  static Map<String, dynamic> pemeriksaanFisikIGDDokterMethodist({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noReg,
    required PemeriksaanFisikMethodistDokter pemeriksaanFisik,
  }) {
    return {
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "person": person,
      "noreg": noReg,
      "kepala": pemeriksaanFisik.kepala,
      "mata": pemeriksaanFisik.mata,
      "tht": pemeriksaanFisik.tht,
      "mulut": pemeriksaanFisik.mulut,
      "getah_bening": pemeriksaanFisik.getahBening,
      "dada": pemeriksaanFisik.dada,
      "jantung": pemeriksaanFisik.jantung,
      "paru": pemeriksaanFisik.paru,
      "perut": pemeriksaanFisik.perut,
      "hati": pemeriksaanFisik.hati,
      "leher": pemeriksaanFisik.leher,
      "limpa": pemeriksaanFisik.limpa,
      "abdomen_lainnya": pemeriksaanFisik.abdomenLainnya,
      "ginjal": pemeriksaanFisik.ginjal,
      "alat_kelamin": pemeriksaanFisik.alatKelamin,
      "gigi": pemeriksaanFisik.gigi,
      "superior": pemeriksaanFisik.superior,
      "inferior": pemeriksaanFisik.inferior,
      "anus": pemeriksaanFisik.anus,
    };
  }

  // SIMPAN DATA KELUHAN UTMA IGD
  static Map<String, dynamic> onGetKeluhanUtamaIGD({
    required String noRM,
    required String noReg,
    required String tanggal,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "no_rm": noRM,
      "tanggal": tanggal,
      "person": person
    };
  }

  static Map<String, dynamic> onGetTriaseIGDReportDokter({
    required String noReg,
    required String tanggal,
    required String noRM,
  }) {
    return {"no_reg": noReg, "tanggal": tanggal, "no_rm": noRM};
  }

  static Map<String, dynamic> onSaveRiwayatPenyakitKeluarga({
    required String noRM,
    required String noReg,
    required String tanggal,
    required String person,
    required String namaKeluarga,
  }) {
    return {
      "no_reg": noReg,
      "no_rm": noRM,
      "tanggal": tanggal,
      "person": person,
      "riwayat": namaKeluarga
    };
  }

  static Map<String, dynamic> onGetTriaseIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return {"no_reg": noReg, "person": person, "pelayanan": pelayanan};
  }

  static Map<String, dynamic> onSaveTriaseIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
    required String kategori,
    required TriaseIgdDokterModel triase,
  }) {
    return {
      "gangguan_perilaku": triase.gangguanPerilaku,
      "noreg": noReg,
      "person": person,
      "pelayanan": pelayanan,
      "devices_id": person,
      "kategori": kategori,
      "ddj": triase.ddj,
      "alasan_masuk": triase.alasanMasuk,
      "cara_masuk": triase.caraMasuk,
      "penyebab_cedera": triase.penyebabCedera,
      "kehamilan": triase.kehamilan,
      "gravida": triase.gravida,
      "para": triase.para,
      "abortus": triase.abortus,
      "hpht": triase.hpht,
      "ttp": triase.ttp,
      "skala_nyeri": triase.skalaNyeri,
      "nyeri_p": triase.nyeriP,
      "nyeri_q": triase.nyeriQ,
      "nyeri_r": triase.nyeriR,
      "nyeri_s": triase.nyeriS,
      "nyeri_t": triase.nyeriT,
      "skala_triase": triase.skalaTriase,
      "flag_wajah": triase.flagWajah,
      "flag_kaki": triase.flagKaki,
      "flag_aktifitas": triase.flagAktifitas,
      "flag_menangis": triase.flagMenangis,
      "flag_bersuara": triase.flagBersuara,
      "flag_total": triase.flagTotal
    };
  }

  static Map<String, dynamic> onGetTandaVitalIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return {"noreg": noReg, "person": person, "pelayanan": pelayanan};
  }

  static Map<String, dynamic> onSaveTandaVitalIGDDokter({
    required String noReg,
    required String person,
    required String devicesID,
    required String pelayanan,
    required TandaVitalIgdDokter tandaVitalIgdDokter,
  }) {
    return {
      "akral": tandaVitalIgdDokter.akral,
      "pupil": tandaVitalIgdDokter.pupil,
      "device_id": devicesID,
      "noreg": noReg,
      "pelayanan": pelayanan,
      "person": person,
      "gcs_e": tandaVitalIgdDokter.gcsE,
      "gcs_v": tandaVitalIgdDokter.gcsV,
      "gcs_m": tandaVitalIgdDokter.gcsM,
      "td": tandaVitalIgdDokter.td,
      "nadi": tandaVitalIgdDokter.nadi,
      "suhu": tandaVitalIgdDokter.suhu,
      "kesadaran": tandaVitalIgdDokter.kesadaran,
      "pernafasan": tandaVitalIgdDokter.pernafasan,
      "spo2": tandaVitalIgdDokter.spo2,
      "tinggi_badan": tandaVitalIgdDokter.tinggiBadan,
      "berat_badan": tandaVitalIgdDokter.beratBadan,
    };
  }

  static Map<String, dynamic> onGetPemeriksaanFisikIGDDokter({
    required String noReg,
    required String person,
  }) {
    return {
      "noreg": noReg,
      "person": person,
    };
  }

  static Map<String, dynamic> onGetPemeriksaanFisikBangsal({
    required String noReg,
    required String person,
  }) {
    return {
      "noreg": noReg,
      "person": person,
    };
  }

  static Map<String, dynamic> onGetAsesmenPerina({
    required String noReg,
    required String noRM,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "no_rm": noRM,
      "person": person,
    };
  }

  static Map<String, dynamic> onGetTindakLanjutDokter({
    required String noReg,
    required String noRM,
  }) {
    return {
      "no_reg": noReg,
      "no_rm": noRM,
    };
  }

  static Map<String, dynamic> onGetReportAsesmenPerina({
    required String noReg,
    required String noRM,
  }) {
    return {
      "no_reg": noReg,
      "no_rm": noRM,
    };
  }

  static Map<String, dynamic> onSaveScoreNeoNatus({
    required String noReg,
    required String person,
    required DDownScorePerinaModel score,
  }) {
    return {
      "noreg": noReg,
      "nifas": score.nifas,
      "person": person,
      "sianosis": score.sianosis,
      "retraksi": score.retraksi,
      "air_entry": score.airEntry,
      "merintih": score.merintih,
      "total": score.total,
    };
  }

  static Map<String, dynamic> onSavePemeriksaanFisikPerina({
    required FisikPerinaModel fisik,
    required String devicesID,
    required String pelayanan,
    required String person,
    required String noReg,
  }) {
    return {
      "device_id": devicesID,
      "pelayanan": pelayanan,
      "tonick_neck": fisik.tonickNeck,
      "kelainan": fisik.kelainan,
      "person": person,
      "gcs_e": fisik.gcsE,
      "gcs_m": fisik.gcsM,
      "gcs_v": fisik.gcsV,
      "noreg": noReg,
      "kesadaran": fisik.kesadaran,
      "kepala": fisik.kepala,
      "wajah": fisik.wajah,
      "telinga": fisik.telinga,
      "hidung": fisik.hidung,
      "mulut": fisik.mulut,
      "refleks": fisik.refleks,
      "leher_dah_bahu": fisik.leherDahBahu,
      "dada": fisik.dada,
      "abdomen": fisik.abdomen,
      "punggung": fisik.punggung,
      "integumen": fisik.integumen,
      "ekstremitas": fisik.ekstremitas,
      "genetalia": fisik.genetalia,
      "anus": fisik.anus
    };
  }

  static Map<String, dynamic> onSaveDVitalSignPerina({
    required VItalSignPerina vitalSign,
    required String devicesID,
    required String kategori,
    required String pelayanan,
    required String person,
    required String noReg,
  }) {
    return {
      "device_id": devicesID,
      "kategori": kategori,
      "pelayanan": pelayanan,
      "person": person,
      "noreg": noReg,
      "bb": vitalSign.bb,
      "tb": vitalSign.tb,
      "hr": vitalSign.hr,
      "rr": vitalSign.rr,
      "td": vitalSign.td,
      "spo2": vitalSign.spo2,
      "warna_kulit": vitalSign.warnaKulit,
      "lingkar_kepala": vitalSign.lingkarKepala,
      "lingkar_lengan": vitalSign.lingkarLengan,
      "lingkar_dada": vitalSign.lingkarDada,
      "lingkar_perut": vitalSign.lingkarPerut
    };
  }

  static Map<String, dynamic> onGetScoreNeoNatus({
    required String noReg,
  }) {
    return {
      "noreg": noReg,
    };
  }

  static Map<String, dynamic> noRegV2({
    required String noReg,
  }) {
    return {
      "no_reg": noReg,
    };
  }

  static Map<String, dynamic> getResumeMedis({
    required String noReg,
    required String noRM,
  }) {
    return {"no_reg": noReg, "no_rm": noRM};
  }

  static Map<String, dynamic> onGetDVitalSingPerina({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return {"no_reg": noReg, "person": person, "pelayanan": pelayanan};
  }
}
