class ReportIntervensiResikoModel {
  final List<ResikoJatuhReport> resikoJatuh;

  ReportIntervensiResikoModel({
    required this.resikoJatuh,
  });

  factory ReportIntervensiResikoModel.fromJson(Map<String, dynamic> json) =>
      ReportIntervensiResikoModel(
        resikoJatuh: List<ResikoJatuhReport>.from(
            json["resiko_jatuh"].map((x) => ResikoJatuhReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resiko_jatuh": List<dynamic>.from(resikoJatuh.map((x) => x.toJson())),
      };
}

class Pasien {
  final String nik;
  final String id;
  final String firstname;
  final String jenisKelamin;
  final String tglLahir;

  Pasien({
    required this.nik,
    required this.id,
    required this.firstname,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        nik: json["nik"],
        id: json["id"],
        firstname: json["firstname"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "id": id,
        "firstname": firstname,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}

class ResikoJatuhReport {
  final String insertDttm;
  final String updDttm;
  final String userId;
  final String insertPc;
  final String person;
  final String pelayanan;
  final String kdBagian;
  final String noreg;
  final String shift;
  final bool resiko1;
  final bool resiko2;
  final bool resiko3;
  final bool resiko4;
  final bool resiko5;
  final bool resiko6;
  final bool resiko7;
  final bool resiko8;
  final bool resiko9;
  final bool resiko10;
  final bool resiko11;
  final bool resiko12;
  final bool resiko13;
  final bool resiko14;
  final bool resiko15;
  final bool resiko16;
  final bool resiko17;
  final String namaPerawat;

  ResikoJatuhReport({
    required this.insertDttm,
    required this.updDttm,
    required this.userId,
    required this.insertPc,
    required this.person,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.shift,
    required this.resiko1,
    required this.resiko2,
    required this.resiko3,
    required this.resiko4,
    required this.resiko5,
    required this.resiko6,
    required this.resiko7,
    required this.resiko8,
    required this.resiko9,
    required this.resiko10,
    required this.resiko11,
    required this.resiko12,
    required this.resiko13,
    required this.resiko14,
    required this.resiko15,
    required this.resiko16,
    required this.resiko17,
    required this.namaPerawat,
  });

  factory ResikoJatuhReport.fromJson(Map<String, dynamic> json) =>
      ResikoJatuhReport(
          insertDttm: json["insert_dttm"],
          updDttm: json["UpdDttm"],
          userId: json["user_id"],
          insertPc: json["InsertPc"],
          person: json["person"],
          pelayanan: json["pelayanan"],
          kdBagian: json["kd_bagian"],
          noreg: json["noreg"],
          shift: json["shift"],
          resiko1: json["resiko1"],
          resiko2: json["resiko2"],
          resiko3: json["resiko3"],
          resiko4: json["resiko4"],
          resiko5: json["resiko5"],
          resiko6: json["resiko6"],
          resiko7: json["resiko7"],
          resiko8: json["resiko8"],
          resiko9: json["resiko9"],
          resiko10: json["resiko10"],
          resiko11: json["resiko11"],
          resiko12: json["resiko12"],
          resiko13: json["resiko13"],
          resiko14: json["resiko14"],
          resiko15: json["resiko15"],
          resiko16: json["resiko16"],
          resiko17: json["resiko17"],
          namaPerawat: json["nama_perawat"]);

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "UpdDttm": updDttm,
        "user_id": userId,
        "InsertPc": insertPc,
        "person": person,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "shift": shift,
        "resiko1": resiko1,
        "resiko2": resiko2,
        "resiko3": resiko3,
        "resiko4": resiko4,
        "resiko5": resiko5,
        "resiko6": resiko6,
        "resiko7": resiko7,
        "resiko8": resiko8,
        "resiko9": resiko9,
        "resiko10": resiko10,
        "resiko11": resiko11,
        "resiko12": resiko12,
        "resiko13": resiko13,
        "resiko14": resiko14,
        "resiko15": resiko15,
        "resiko16": resiko16,
        "resiko17": resiko17,
        "nama_perawat": namaPerawat
      };
}

class User {
  final String nama;
  final String reqStatus;
  final String notifStatus;
  final String delStatus;
  final String createPc;
  final String createUser;
  final String email;
  final String nik;
  final String noHp;
  final String kodeModul;
  final String userStatus;
  final String userId;
  final String password;
  final String activatedCode;
  final String person;
  final String kodeSpesialisasi;
  final String spesialisasi;
  final String photo;
  final String tglMasuk;
  final String jenisKelamin;
  final String tglLahir;
  final String tempatLahir;
  final String hp;
  final String statusKawin;
  final int usia;
  final String alamat;
  final String agama;
  final String kota;

  User({
    required this.nama,
    required this.reqStatus,
    required this.notifStatus,
    required this.delStatus,
    required this.createPc,
    required this.createUser,
    required this.email,
    required this.nik,
    required this.noHp,
    required this.kodeModul,
    required this.userStatus,
    required this.userId,
    required this.password,
    required this.activatedCode,
    required this.person,
    required this.kodeSpesialisasi,
    required this.spesialisasi,
    required this.photo,
    required this.tglMasuk,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.tempatLahir,
    required this.hp,
    required this.statusKawin,
    required this.usia,
    required this.alamat,
    required this.agama,
    required this.kota,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        nama: json["nama"],
        reqStatus: json["req_status"],
        notifStatus: json["notif_status"],
        delStatus: json["del_status"],
        createPc: json["create_pc"],
        createUser: json["create_user"],
        email: json["email"],
        nik: json["nik"],
        noHp: json["no_hp"],
        kodeModul: json["kode_modul"],
        userStatus: json["user_status"],
        userId: json["user_id"],
        password: json["password"],
        activatedCode: json["activated_code"],
        person: json["person"],
        kodeSpesialisasi: json["kode_spesialisasi"],
        spesialisasi: json["spesialisasi"],
        photo: json["photo"],
        tglMasuk: json["tglMasuk"],
        jenisKelamin: json["jenisKelamin"],
        tglLahir: json["tglLahir"],
        tempatLahir: json["tempatLahir"],
        hp: json["hp"],
        statusKawin: json["statusKawin"],
        usia: json["usia"],
        alamat: json["alamat"],
        agama: json["agama"],
        kota: json["kota"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "req_status": reqStatus,
        "notif_status": notifStatus,
        "del_status": delStatus,
        "create_pc": createPc,
        "create_user": createUser,
        "email": email,
        "nik": nik,
        "no_hp": noHp,
        "kode_modul": kodeModul,
        "user_status": userStatus,
        "user_id": userId,
        "password": password,
        "activated_code": activatedCode,
        "person": person,
        "kode_spesialisasi": kodeSpesialisasi,
        "spesialisasi": spesialisasi,
        "photo": photo,
        "tglMasuk": tglMasuk,
        "jenisKelamin": jenisKelamin,
        "tglLahir": tglLahir,
        "tempatLahir": tempatLahir,
        "hp": hp,
        "statusKawin": statusKawin,
        "usia": usia,
        "alamat": alamat,
        "agama": agama,
        "kota": kota,
      };
}
