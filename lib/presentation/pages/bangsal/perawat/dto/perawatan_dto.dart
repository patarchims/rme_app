import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_keperawatan_persistem_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/vital_sign_keperawatan_repository.dart';

abstract class DTOKeperawatan {
  static Map<String, dynamic> savePengkajianAwalKeperawatan({
    required String noreg,
    required String dpjp,
    required String noRM,
    required String person,
    required String pelayanan,
    required String deviceID,
    required String jenPel,
    required String detailJenPel,
    required String keluhanUtama,
    required String rwtPenyakit,
    required String reaksiAlergi,
    required String riwayatPenyakitDahulu,
  }) {
    return {
      'no_reg': noreg,
      'dpjp': dpjp,
      'no_rm': noRM,
      'person': person,
      'pelayanan': pelayanan,
      'device_id': deviceID,
      'jenpel': jenPel,
      'detail_jenpel': detailJenPel,
      'keluhan_utama': keluhanUtama,
      'rwyt_penyakit': rwtPenyakit,
      'reaksi_alergi': reaksiAlergi,
      'rwyt_penyakit_dahulu': riwayatPenyakitDahulu,
    };
  }

  static Map<String, dynamic> saveCPPTSBAR({
    required String noReg,
    required String deviceID,
    required String kelompok,
    required String situation,
    required String background,
    required String asesmen,
    required String recomendation,
    required String ppa,
    required String pelayanan,
    required String dpjp,
  }) {
    return {
      'device_id': deviceID,
      'no_reg': noReg,
      'kelompok': kelompok,
      'situation': situation,
      'asesmen': asesmen,
      'background': background,
      'recomendation': recomendation,
      'ppa': ppa,
      'pelayanan': pelayanan,
      'dpjp': dpjp,
    };
  }

  static Map<String, dynamic> onSaveAsesmenNyeriKeperawatan({
    required String noReg,
    required String deviceID,
    required String person,
    required String pelayanan,
    required int skalaNyeri,
  }) {
    return {
      'device_id': deviceID,
      'no_reg': noReg,
      'skala_nyeri': skalaNyeri,
      "pelayanan": pelayanan,
      'person': person,
    };
  }

  static Map<String, dynamic> onSaveCatatanKeperawatan({
    required String catatan,
    required String noReg,
  }) {
    return {
      'catatan': catatan,
      'no_reg': noReg,
    };
  }

  static Map<String, dynamic> onSavePengkajianPersistemKeperawatan({
    required PengkajianKeperawatanPesistemModel
        pengkajianKeperawatanPesistemModel,
    required String noReg,
    required String person,
    required String pelayanan,
    required String devicesID,
  }) {
    return {
      'no_reg': noReg,
      'person': person,
      'pelayanan': pelayanan,
      'divice_id': devicesID,
      'eliminasi_bak': pengkajianKeperawatanPesistemModel.eliminasiBak,
      'eliminasi_bab': pengkajianKeperawatanPesistemModel.eliminasiBab,
      'istirahat': pengkajianKeperawatanPesistemModel.istirahat,
      'aktivitas': pengkajianKeperawatanPesistemModel.aktivitas,
      'mandi': pengkajianKeperawatanPesistemModel.mandi,
      'berpakaian': pengkajianKeperawatanPesistemModel.berpakaian,
      'makan': pengkajianKeperawatanPesistemModel.makan,
      'eliminasi': pengkajianKeperawatanPesistemModel.eliminasi,
      'mobilisasi': pengkajianKeperawatanPesistemModel.mobilisasi,
      'kardiovaskuler': pengkajianKeperawatanPesistemModel.kardiovaskuler,
      'respiratori': pengkajianKeperawatanPesistemModel.respiratori,
      'secebral': pengkajianKeperawatanPesistemModel.secebral,
      'perfusi_perifer': pengkajianKeperawatanPesistemModel.perfusiPerifer,
      'pencernaan': pengkajianKeperawatanPesistemModel.pencernaan,
      'integumen': pengkajianKeperawatanPesistemModel.integumen,
      'kenyamanan': pengkajianKeperawatanPesistemModel.kenyamanan,
      'proteksi': pengkajianKeperawatanPesistemModel.proteksi,
      'paps_smer': pengkajianKeperawatanPesistemModel.papsSmer,
      'hamil': pengkajianKeperawatanPesistemModel.hamil,
      'pendarahan': pengkajianKeperawatanPesistemModel.pendarahan,
      'hambatan_bahasa': pengkajianKeperawatanPesistemModel.hambatanBahasa,
      'cara_belajar': pengkajianKeperawatanPesistemModel.caraBelajar,
      'bahasa_sehari': pengkajianKeperawatanPesistemModel.bahasaSehari,
      'spikologis': pengkajianKeperawatanPesistemModel.spikologis,
      'hambatan_sosial': pengkajianKeperawatanPesistemModel.hambatanSosial,
      'hambatan_ekonomi': pengkajianKeperawatanPesistemModel.hambatanEkonomi,
      'spiritual': pengkajianKeperawatanPesistemModel.spiritual,
      'response_emosi': pengkajianKeperawatanPesistemModel.responseEmosi,
      'nilai_kepercayaan': pengkajianKeperawatanPesistemModel.nilaiKepercayaan,
      'presepsi_sakit': pengkajianKeperawatanPesistemModel.presepsiSakit,
      'khusus_kepercayaan':
          pengkajianKeperawatanPesistemModel.khususKepercayaan,
      'thermoregulasi': pengkajianKeperawatanPesistemModel.thermoregulasi,
      'pencernaan_usus': pengkajianKeperawatanPesistemModel.sistemusus,
      "sakit_kepala": pengkajianKeperawatanPesistemModel.sakitKepala,
      "kekuatan_otot": pengkajianKeperawatanPesistemModel.kekuatanOtot,
      "anggota_gerak": pengkajianKeperawatanPesistemModel.anggotaGerak,
      "bicara": pengkajianKeperawatanPesistemModel.bicara,
      "perubahan_status_mental":
          pengkajianKeperawatanPesistemModel.perubahanStatusMental,
      "riwayat_hipertensi":
          pengkajianKeperawatanPesistemModel.riwayatHipertensi,
      "akral": pengkajianKeperawatanPesistemModel.akral,
      "batuk": pengkajianKeperawatanPesistemModel.batuk,
      "suara_napas": pengkajianKeperawatanPesistemModel.suaraNapas,
      "merokok": pengkajianKeperawatanPesistemModel.merokok,
      "penerjemah": pengkajianKeperawatanPesistemModel.penerjemah,
      "nutrisi": pengkajianKeperawatanPesistemModel.nutrisi
    };
  }

  static Map<String, dynamic> updateCPPTSBAR({
    required int idCPPT,
    required String situation,
    required String background,
    required String asesmen,
    required String recomendation,
  }) {
    return {
      'id_cppt': idCPPT,
      'situation': situation,
      'asesmen': asesmen,
      'background': background,
      'recomendation': recomendation,
    };
  }

  static Map<String, dynamic> onGetCatatanKeperawatan({
    required String noReg,
  }) {
    return {
      'no_reg': noReg,
    };
  }

  static Map<String, dynamic> pengkajianPersistemKeperawatan({
    required String noReg,
    required String noRm,
    required String person,
  }) {
    return {
      'no_reg': noReg,
      'no_rm': noRm,
      'person': person,
    };
  }

  static Map<String, dynamic> onGetSkalaNyeri({
    required String noReg,
  }) {
    return {
      'no_reg': noReg,
    };
  }

  static Map<String, dynamic> deleteCPPTSBAR({
    required int idCPPT,
  }) {
    return {
      'id_cppt': idCPPT,
    };
  }

  static Map<String, dynamic> onGetTandaVitalKeperawatanBangsal({
    required String noReg,
    required String person,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
    };
  }

  static Map<String, dynamic> onGETCPPTSBAR({
    required String noReg,
  }) {
    return {
      "no_reg": noReg,
    };
  }

  static Map<String, dynamic> onGetPengkajianAwalKeperawatanBangsal({
    required String noReg,
    required String person,
    required String noRM,
    required String tanggal,
  }) {
    return {
      "no_reg": noReg,
      "person": person,
      "no_rm": noRM,
      "tanggal": tanggal
    };
  }

  // ============== //
  static Map<String, dynamic> onSaveRiwayatPenyakitKelurga({
    required String noRm,
    required String penyakit,
  }) {
    return {
      "no_rm": noRm,
      "penyakit": penyakit,
    };
  }

  static Map<String, dynamic> onSaveTandaVitalKeperawatanBangsal({
    required String noReg,
    required String pelayanan,
    required String person,
    required String devicesID,
    required VitalSignKeperawatanModel tandaVitalIgdDokter,
  }) {
    return {
      "pelayanan": pelayanan,
      "device_id": devicesID,
      "noreg": noReg,
      "person": person,
      "gcs_e": tandaVitalIgdDokter.gcsE,
      "gcs_v": tandaVitalIgdDokter.gcsV,
      "gcs_m": tandaVitalIgdDokter.gcsM,
      "td": tandaVitalIgdDokter.td,
      "nadi": tandaVitalIgdDokter.nadi,
      "suhu": tandaVitalIgdDokter.suhu,
      "pernafasan": tandaVitalIgdDokter.pernafasan,
      "spo2": tandaVitalIgdDokter.spo2,
      "tinggi_badan": tandaVitalIgdDokter.tinggiBadan,
      "berat_badan": tandaVitalIgdDokter.beratBadan,
    };
  }
}
