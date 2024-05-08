class PengkajianPersistemIcuModel {
  final String airway;
  final String breathing;
  final String circulation;
  final String nutrisi;
  final String makan;
  final String padaBayi;
  final String minum;
  final String eliminasiBak;
  final String eliminasiBab;
  final String aktivitasIstirahat;
  final String aktivitas;
  final String berjalan;
  final String penggunaanAlatBantu;
  final String perfusiSerebral;
  final String pupil;
  final String refleksCahaya;
  final String perfusiRenal;
  final String pefusiGastroinestinal;
  final String abdomen;
  final String thermoregulasi;
  final String kenyamanan;
  final String kualitas;
  final String pola;
  final String nyeriMempengaruhi;
  final String statusMental;
  final String kejang;
  final String pasangPengamanTempatTidur;
  final String belMudaDijangkau;
  final String penglihatan;
  final String pendengaran;
  final String hamil;
  final String pemeriksaanCervixTerakhir;
  final String pemeriksaanPayudaraSendiri;
  final String mamografiTerakhirTanggal;
  final String penggunaanAlatKontrasepsi;
  final String bicara;
  final String bahasaSehariHari;
  final String perluPenerjemah;
  final String bahasaIsyarat;
  final String hambatanBelajar;
  final String caraBelajarDisukai;
  final String tingkatPendidikan;
  final String potensialKebutuhanPembelajaran;
  final String responseEmosi;
  final String sistemSosial;
  final String tingkatBersama;
  final String kondisiLingkunganDirumah;
  final String nilaiKepercayaan;
  final String menjalankanIbadah;
  final String presepsiTerhadapSakit;
  final String kunjunganPemimpin;
  final String nilaiAturanKhusus;
  final String sistemMakan;
  final String sistemEliminasi;
  final String sistemMobilisasi;
  final String sistemMasalahDenganNutrisi;
  final String mandi;
  final String berpakaian;

  PengkajianPersistemIcuModel({
    required this.airway,
    required this.breathing,
    required this.circulation,
    required this.nutrisi,
    required this.makan,
    required this.padaBayi,
    required this.minum,
    required this.eliminasiBak,
    required this.eliminasiBab,
    required this.aktivitasIstirahat,
    required this.aktivitas,
    required this.berjalan,
    required this.penggunaanAlatBantu,
    required this.perfusiSerebral,
    required this.pupil,
    required this.refleksCahaya,
    required this.perfusiRenal,
    required this.pefusiGastroinestinal,
    required this.abdomen,
    required this.thermoregulasi,
    required this.kenyamanan,
    required this.kualitas,
    required this.pola,
    required this.nyeriMempengaruhi,
    required this.statusMental,
    required this.kejang,
    required this.pasangPengamanTempatTidur,
    required this.belMudaDijangkau,
    required this.penglihatan,
    required this.pendengaran,
    required this.hamil,
    required this.pemeriksaanCervixTerakhir,
    required this.pemeriksaanPayudaraSendiri,
    required this.mamografiTerakhirTanggal,
    required this.penggunaanAlatKontrasepsi,
    required this.bicara,
    required this.bahasaSehariHari,
    required this.perluPenerjemah,
    required this.bahasaIsyarat,
    required this.hambatanBelajar,
    required this.caraBelajarDisukai,
    required this.tingkatPendidikan,
    required this.potensialKebutuhanPembelajaran,
    required this.responseEmosi,
    required this.sistemSosial,
    required this.tingkatBersama,
    required this.kondisiLingkunganDirumah,
    required this.nilaiKepercayaan,
    required this.menjalankanIbadah,
    required this.presepsiTerhadapSakit,
    required this.kunjunganPemimpin,
    required this.nilaiAturanKhusus,
    required this.sistemMakan,
    required this.sistemEliminasi,
    required this.sistemMobilisasi,
    required this.sistemMasalahDenganNutrisi,
    required this.mandi,
    required this.berpakaian,
  });

  factory PengkajianPersistemIcuModel.fromJson(Map<String, dynamic> json) =>
      PengkajianPersistemIcuModel(
        berpakaian: json["berpakaian"].toString(),
        mandi: json["mandi"].toString(),
        sistemEliminasi: json["sistem_eliminasi"].toString(),
        sistemMakan: json["sistem_makan"].toString(),
        sistemMasalahDenganNutrisi: json["masalah_dengan_nutrisi"].toString(),
        sistemMobilisasi: json["sistem_mobilisasi"].toString(),
        airway: json["airway"].toString(),
        breathing: json["breathing"].toString(),
        circulation: json["circulation"].toString(),
        nutrisi: json["nutrisi"].toString(),
        makan: json["makan"].toString(),
        padaBayi: json["pada_bayi"].toString(),
        minum: json["minum"].toString(),
        eliminasiBak: json["eliminasi_bak"].toString(),
        eliminasiBab: json["eliminasi_bab"].toString(),
        aktivitasIstirahat: json["aktivitas_istirahat"].toString(),
        aktivitas: json["aktivitas"].toString(),
        berjalan: json["berjalan"].toString(),
        penggunaanAlatBantu: json["penggunaan_alat_bantu"].toString(),
        perfusiSerebral: json["perfusi_serebral"].toString(),
        pupil: json["pupil"].toString(),
        refleksCahaya: json["refleks_cahaya"].toString(),
        perfusiRenal: json["perfusi_renal"].toString(),
        pefusiGastroinestinal: json["pefusi_gastroinestinal"].toString(),
        abdomen: json["abdomen"].toString(),
        thermoregulasi: json["thermoregulasi"].toString(),
        kenyamanan: json["kenyamanan"].toString(),
        kualitas: json["kualitas"].toString(),
        pola: json["pola"].toString(),
        nyeriMempengaruhi: json["nyeri_mempengaruhi"].toString(),
        statusMental: json["status_mental"].toString(),
        kejang: json["kejang"].toString(),
        pasangPengamanTempatTidur:
            json["pasang_pengaman_tempat_tidur"].toString(),
        belMudaDijangkau: json["bel_muda_dijangkau"].toString(),
        penglihatan: json["penglihatan"].toString(),
        pendengaran: json["pendengaran"].toString(),
        hamil: json["hamil"].toString(),
        pemeriksaanCervixTerakhir:
            json["pemeriksaan_cervix_terakhir"].toString(),
        pemeriksaanPayudaraSendiri:
            json["pemeriksaan_payudara_sendiri"].toString(),
        mamografiTerakhirTanggal: json["mamografi_terakhir_tanggal"].toString(),
        penggunaanAlatKontrasepsi:
            json["penggunaan_alat_kontrasepsi"].toString(),
        bicara: json["bicara"].toString(),
        bahasaSehariHari: json["bahasa_sehari_hari"].toString(),
        perluPenerjemah: json["perlu_penerjemah"].toString(),
        bahasaIsyarat: json["bahasa_isyarat"].toString(),
        hambatanBelajar: json["hambatan_belajar"].toString(),
        caraBelajarDisukai: json["cara_belajar_disukai"].toString(),
        tingkatPendidikan: json["tingkat_pendidikan"].toString(),
        potensialKebutuhanPembelajaran:
            json["potensial_kebutuhan_pembelajaran"].toString(),
        responseEmosi: json["response_emosi"].toString(),
        sistemSosial: json["sistem_sosial"].toString(),
        tingkatBersama: json["tingkat_bersama"].toString(),
        kondisiLingkunganDirumah: json["kondisi_lingkungan_dirumah"].toString(),
        nilaiKepercayaan: json["nilai_kepercayaan"].toString(),
        menjalankanIbadah: json["menjalankan_ibadah"].toString(),
        presepsiTerhadapSakit: json["presepsi_terhadap_sakit"].toString(),
        kunjunganPemimpin: json["kunjungan_pemimpin"].toString(),
        nilaiAturanKhusus: json["nilai_aturan_khusus"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "airway": airway,
        "breathing": breathing,
        "circulation": circulation,
        "nutrisi": nutrisi,
        "makan": makan,
        "pada_bayi": padaBayi,
        "minum": minum,
        "eliminasi_bak": eliminasiBak,
        "eliminasi_bab": eliminasiBab,
        "aktivitas_istirahat": aktivitasIstirahat,
        "aktivitas": aktivitas,
        "berjalan": berjalan,
        "penggunaan_alat_bantu": penggunaanAlatBantu,
        "perfusi_serebral": perfusiSerebral,
        "pupil": pupil,
        "refleks_cahaya": refleksCahaya,
        "perfusi_renal": perfusiRenal,
        "pefusi_gastroinestinal": pefusiGastroinestinal,
        "abdomen": abdomen,
        "thermoregulasi": thermoregulasi,
        "kenyamanan": kenyamanan,
        "kualitas": kualitas,
        "pola": pola,
      };
}
