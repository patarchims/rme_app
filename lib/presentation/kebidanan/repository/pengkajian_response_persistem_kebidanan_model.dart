// ignore_for_file: public_member_api_docs, sort_constructors_first
class PengkajianPersistemKebidananResponse {
  String eliminasiBak;
  String eliminasiBab;
  String istirahat;
  String aktivitas;
  String mandi;
  String berpakaian;
  String makan;
  String eliminasi;
  String mobilisasi;
  String kardiovaskuler;
  String respiratori;
  String secebral;
  String perfusiPerifer;
  String pencernaan;
  String integumen;
  String kenyamanan;
  String thermoregulasi;
  String proteksi;
  String papsSmer;
  String hamil;
  String pendarahan;
  String hambatanBahasa;
  String caraBelajar;
  String bahasaSehari;
  String spikologis;
  String hambatanSosial;
  String hambatanEkonomi;
  String spiritual;
  String responseEmosi;
  String nilaiKepercayaan;
  String presepsiSakit;
  String khususKepercayaan;

  PengkajianPersistemKebidananResponse({
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
    required this.thermoregulasi,
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
  });

  factory PengkajianPersistemKebidananResponse.fromJson(
          Map<String, dynamic> json) =>
      PengkajianPersistemKebidananResponse(
        eliminasiBak: json["eliminasi_bak"],
        thermoregulasi: json["thermoregulasi"],
        eliminasiBab: json["eliminasi_bab"],
        istirahat: json["istirahat"],
        aktivitas: json["aktivitas"],
        mandi: json["mandi"],
        berpakaian: json["berpakaian"],
        makan: json["makan"],
        eliminasi: json["eliminasi"],
        mobilisasi: json["mobilisasi"],
        kardiovaskuler: json["kardiovaskuler"],
        respiratori: json["respiratori"],
        secebral: json["secebral"],
        perfusiPerifer: json["perfusi_perifer"],
        pencernaan: json["pencernaan"],
        integumen: json["integumen"],
        kenyamanan: json["kenyamanan"],
        proteksi: json["proteksi"],
        papsSmer: json["paps_smer"],
        hamil: json["hamil"],
        pendarahan: json["pendarahan"],
        hambatanBahasa: json["hambatan_bahasa"],
        caraBelajar: json["cara_belajar"],
        bahasaSehari: json["bahasa_sehari"],
        spikologis: json["spikologis"],
        hambatanSosial: json["hambatan_sosial"],
        hambatanEkonomi: json["hambatan_ekonomi"],
        spiritual: json["spiritual"],
        responseEmosi: json["response_emosi"],
        nilaiKepercayaan: json["nilai_kepercayaan"],
        presepsiSakit: json["presepsi_sakit"],
        khususKepercayaan: json["khusus_kepercayaan"],
      );

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
      };

  PengkajianPersistemKebidananResponse copyWith({
    String? eliminasiBak,
    String? eliminasiBab,
    String? istirahat,
    String? aktivitas,
    String? mandi,
    String? berpakaian,
    String? makan,
    String? eliminasi,
    String? mobilisasi,
    String? kardiovaskuler,
    String? respiratori,
    String? secebral,
    String? perfusiPerifer,
    String? pencernaan,
    String? integumen,
    String? kenyamanan,
    String? proteksi,
    String? papsSmer,
    String? hamil,
    String? pendarahan,
    String? hambatanBahasa,
    String? caraBelajar,
    String? bahasaSehari,
    String? spikologis,
    String? hambatanSosial,
    String? hambatanEkonomi,
    String? spiritual,
    String? responseEmosi,
    String? nilaiKepercayaan,
    String? presepsiSakit,
    String? khususKepercayaan,
    String? thermoregulasi,
  }) {
    return PengkajianPersistemKebidananResponse(
      thermoregulasi: thermoregulasi ?? this.thermoregulasi,
      eliminasiBak: eliminasiBak ?? this.eliminasiBak,
      eliminasiBab: eliminasiBab ?? this.eliminasiBab,
      istirahat: istirahat ?? this.istirahat,
      aktivitas: aktivitas ?? this.aktivitas,
      mandi: mandi ?? this.mandi,
      berpakaian: berpakaian ?? this.berpakaian,
      makan: makan ?? this.makan,
      eliminasi: eliminasi ?? this.eliminasi,
      mobilisasi: mobilisasi ?? this.mobilisasi,
      kardiovaskuler: kardiovaskuler ?? this.kardiovaskuler,
      respiratori: respiratori ?? this.respiratori,
      secebral: secebral ?? this.secebral,
      perfusiPerifer: perfusiPerifer ?? this.perfusiPerifer,
      pencernaan: pencernaan ?? this.pencernaan,
      integumen: integumen ?? this.integumen,
      kenyamanan: kenyamanan ?? this.kenyamanan,
      proteksi: proteksi ?? this.proteksi,
      papsSmer: papsSmer ?? this.papsSmer,
      hamil: hamil ?? this.hamil,
      pendarahan: pendarahan ?? this.pendarahan,
      hambatanBahasa: hambatanBahasa ?? this.hambatanBahasa,
      caraBelajar: caraBelajar ?? this.caraBelajar,
      bahasaSehari: bahasaSehari ?? this.bahasaSehari,
      spikologis: spikologis ?? this.spikologis,
      hambatanSosial: hambatanSosial ?? this.hambatanSosial,
      hambatanEkonomi: hambatanEkonomi ?? this.hambatanEkonomi,
      spiritual: spiritual ?? this.spiritual,
      responseEmosi: responseEmosi ?? this.responseEmosi,
      nilaiKepercayaan: nilaiKepercayaan ?? this.nilaiKepercayaan,
      presepsiSakit: presepsiSakit ?? this.presepsiSakit,
      khususKepercayaan: khususKepercayaan ?? this.khususKepercayaan,
    );
  }
}
