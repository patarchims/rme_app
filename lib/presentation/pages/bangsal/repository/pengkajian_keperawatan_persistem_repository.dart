class PengkajianKeperawatanPesistemModel {
  final String eliminasiBak;
  final String eliminasiBab;
  final String istirahat;
  final String aktivitas;
  final String mandi;
  final String berpakaian;
  final String makan;
  final String eliminasi;
  final String mobilisasi;
  final String kardiovaskuler;
  final String respiratori;
  final String secebral;
  final String perfusiPerifer;
  final String pencernaan;
  final String integumen;
  final String kenyamanan;
  final String proteksi;
  final String papsSmer;
  final String hamil;
  final String pendarahan;
  final String hambatanBahasa;
  final String caraBelajar;
  final String bahasaSehari;
  final String spikologis;
  final String hambatanSosial;
  final String hambatanEkonomi;
  final String spiritual;
  final String responseEmosi;
  final String nilaiKepercayaan;
  final String presepsiSakit;
  final String khususKepercayaan;
  final String thermoregulasi;
  final String penerjemah;
  final String sistemusus;
  final String sakitKepala;
  final String perubahanStatusMental;
  final String anggotaGerak;
  final String bicara;
  final String riwayatHipertensi;
  final String kekuatanOtot;
  final String akral;
  final String batuk;
  final String suaraNapas;
  final String merokok;
  final String nutrisi;

  PengkajianKeperawatanPesistemModel({
    required this.eliminasiBak,
    required this.eliminasiBab,
    required this.istirahat,
    required this.aktivitas,
    required this.mandi,
    required this.berpakaian,
    required this.makan,
    required this.eliminasi,
    required this.mobilisasi,
    required this.kardiovaskuler,
    required this.respiratori,
    required this.secebral,
    required this.perfusiPerifer,
    required this.pencernaan,
    required this.integumen,
    required this.kenyamanan,
    required this.proteksi,
    required this.papsSmer,
    required this.hamil,
    required this.pendarahan,
    required this.hambatanBahasa,
    required this.caraBelajar,
    required this.bahasaSehari,
    required this.spikologis,
    required this.hambatanSosial,
    required this.hambatanEkonomi,
    required this.spiritual,
    required this.responseEmosi,
    required this.nilaiKepercayaan,
    required this.presepsiSakit,
    required this.khususKepercayaan,
    required this.thermoregulasi,
    required this.penerjemah,
    required this.sistemusus,
    required this.sakitKepala,
    required this.perubahanStatusMental,
    required this.anggotaGerak,
    required this.bicara,
    required this.riwayatHipertensi,
    required this.kekuatanOtot,
    required this.akral,
    required this.batuk,
    required this.suaraNapas,
    required this.merokok,
    required this.nutrisi,
  });

  factory PengkajianKeperawatanPesistemModel.fromJson(
          Map<String, dynamic> json) =>
      PengkajianKeperawatanPesistemModel(
          nutrisi: json["nutrisi"].toString(),
          akral: json["akral"].toString(),
          batuk: json["batuk"].toString(),
          merokok: json["merokok"].toString(),
          suaraNapas: json["suara_napas"].toString(),
          kekuatanOtot: json["kekuatan_otot"].toString(),
          anggotaGerak: json["anggota_gerak"].toString(),
          bicara: json["bicara"].toString(),
          perubahanStatusMental: json["perubahan_status_mental"],
          riwayatHipertensi: json["riwayat_hipertensi"].toString(),
          sakitKepala: json["sakit_kepala"].toString(),
          sistemusus: json["pencernaan_usus"],
          eliminasiBak: json["eliminasi_bak"].toString(),
          eliminasiBab: json["eliminasi_bab"].toString(),
          istirahat: json["istirahat"].toString(),
          aktivitas: json["aktivitas"].toString(),
          mandi: json["mandi"].toString(),
          berpakaian: json["berpakaian"].toString(),
          makan: json["makan"].toString(),
          eliminasi: json["eliminasi"].toString(),
          mobilisasi: json["mobilisasi"].toString(),
          kardiovaskuler: json["kardiovaskuler"].toString(),
          respiratori: json["respiratori"].toString(),
          secebral: json["secebral"].toString(),
          perfusiPerifer: json["perfusi_perifer"].toString(),
          pencernaan: json["pencernaan"].toString(),
          integumen: json["integumen"].toString(),
          kenyamanan: json["kenyamanan"].toString(),
          proteksi: json["proteksi"].toString(),
          papsSmer: json["paps_smer"].toString(),
          hamil: json["hamil"].toString(),
          pendarahan: json["pendarahan"].toString(),
          hambatanBahasa: json["hambatan_bahasa"].toString(),
          caraBelajar: json["cara_belajar"].toString(),
          bahasaSehari: json["bahasa_sehari"].toString(),
          spikologis: json["spikologis"].toString(),
          hambatanSosial: json["hambatan_sosial"].toString(),
          hambatanEkonomi: json["hambatan_ekonomi"].toString(),
          spiritual: json["spiritual"].toString(),
          responseEmosi: json["response_emosi"].toString(),
          nilaiKepercayaan: json["nilai_kepercayaan"].toString(),
          presepsiSakit: json["presepsi_sakit"].toString(),
          khususKepercayaan: json["khusus_kepercayaan"].toString(),
          thermoregulasi: json["thermoregulasi"].toString(),
          penerjemah: json["penerjemah"].toString());

  Map<String, dynamic> toJson() => {
        "eliminasi_bak": eliminasiBak,
        "eliminasi_bab": eliminasiBab,
        "istirahat": istirahat,
        "aktivitas": aktivitas,
        "mandi": mandi,
        "berpakaian": berpakaian,
        "makan": makan,
        "eliminasi": eliminasi,
        "mobilisasi": mobilisasi,
        "kardiovaskuler": kardiovaskuler,
        "respiratori": respiratori,
        "secebral": secebral,
        "perfusi_perifer": perfusiPerifer,
        "pencernaan": pencernaan,
        "integumen": integumen,
        "kenyamanan": kenyamanan,
        "proteksi": proteksi,
        "paps_smer": papsSmer,
        "hamil": hamil,
        "pendarahan": pendarahan,
        "hambatan_bahasa": hambatanBahasa,
        "cara_belajar": caraBelajar,
        "bahasa_sehari": bahasaSehari,
        "spikologis": spikologis,
        "hambatan_sosial": hambatanSosial,
        "hambatan_ekonomi": hambatanEkonomi,
        "spiritual": spiritual,
        "response_emosi": responseEmosi,
        "nilai_kepercayaan": nilaiKepercayaan,
        "presepsi_sakit": presepsiSakit,
        "khusus_kepercayaan": khususKepercayaan,
        "thermoregulasi": thermoregulasi,
      };
}
