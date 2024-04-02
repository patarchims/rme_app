class AnalisaDataModel {
  int id;
  String insertDttm;
  String kodeAnalisa;
  String kdBagian;
  String userId;
  String noreg;
  String data;
  String tgl;
  String jam;
  List<AnalisaDatum> analisaData;

  AnalisaDataModel({
    required this.id,
    required this.tgl,
    required this.jam,
    required this.insertDttm,
    required this.kodeAnalisa,
    required this.kdBagian,
    required this.userId,
    required this.noreg,
    required this.data,
    required this.analisaData,
  });

  factory AnalisaDataModel.fromJson(Map<String, dynamic> json) =>
      AnalisaDataModel(
        jam: json["jam"].toString(),
        tgl: json["tgl"].toString(),
        id: json["id"] as int,
        insertDttm: json["insert_dttm"].toString(),
        kodeAnalisa: json["kode_analisa"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        userId: json["user_id"].toString(),
        noreg: json["noreg"].toString(),
        data: json["data"].toString(),
        analisaData: List<AnalisaDatum>.from(
            json["analisa_data"].map((x) => AnalisaDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "insert_dttm": insertDttm,
        "kode_analisa": kodeAnalisa,
        "kd_bagian": kdBagian,
        "user_id": userId,
        "noreg": noreg,
        "data": data,
        "analisa_data": List<dynamic>.from(analisaData.map((x) => x.toJson())),
      };
}

class AnalisaDatum {
  String noreg;
  String kode;
  String idDiagnosa;
  String namaDiagnosa;

  AnalisaDatum({
    required this.noreg,
    required this.kode,
    required this.idDiagnosa,
    required this.namaDiagnosa,
  });

  factory AnalisaDatum.fromJson(Map<String, dynamic> json) => AnalisaDatum(
        noreg: json["noreg"].toString(),
        kode: json["kode"].toString(),
        idDiagnosa: json["id_diagnosa"].toString(),
        namaDiagnosa: json["nama_diagnosa"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "kode": kode,
        "id_diagnosa": idDiagnosa,
        "nama_diagnosa": namaDiagnosa,
      };
}

class Pegawai {
  String nama;
  String jenisKelamin;
  String tglLahir;

  Pegawai({
    required this.nama,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        nama: json["nama"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}
