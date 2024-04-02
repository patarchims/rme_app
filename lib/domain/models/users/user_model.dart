import 'package:equatable/equatable.dart';
import 'package:hms_app/presentation/pages/asesmen/menu_asesmen.dart';

enum Person { perawat, dokter, nonDokter }

class UserModel extends Equatable {
  final String nama;
  final Person person;
  final String email;
  final String nik;
  final String noHp;
  final Spesialisasi spesialisasi;
  final String bagian;
  final String pelayanan;
  final String userStatus;
  final String userId;
  final String token;
  final String refreshToken;
  final String alamat;
  final String photo;
  final String jenisKelamin;
  final String tglLahir;
  final String kota;
  final int usia;
  final String agama;
  final String tglMasuk;
  final String statusKawin;
  final String kodePoli;
  final Poliklinik poliklinik;

  const UserModel({
    required this.kodePoli,
    required this.person,
    required this.nama,
    required this.email,
    required this.spesialisasi,
    required this.nik,
    required this.noHp,
    required this.bagian,
    required this.pelayanan,
    required this.userStatus,
    required this.userId,
    required this.token,
    required this.refreshToken,
    required this.alamat,
    required this.photo,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.kota,
    required this.usia,
    required this.agama,
    required this.tglMasuk,
    required this.statusKawin,
    required this.poliklinik,
  });

  @override
  List<Object> get props {
    return [
      nama,
      email,
      nik,
      noHp,
      bagian,
      spesialisasi,
      pelayanan,
      userStatus,
      userId,
      token,
      refreshToken,
      alamat,
      photo,
      jenisKelamin,
      tglLahir,
      kota,
      usia,
      agama,
      tglMasuk,
      statusKawin,
      kodePoli,
    ];
  }

  UserModel copyWith(
      {String? nama,
      Person? person,
      String? email,
      String? nik,
      String? noHp,
      String? bagian,
      String? pelayanan,
      String? userStatus,
      String? userId,
      String? token,
      String? refreshToken,
      String? alamat,
      String? photo,
      String? jenisKelamin,
      String? tglLahir,
      String? kota,
      int? usia,
      String? agama,
      String? tglMasuk,
      String? statusKawin,
      String? kodePoli,
      Poliklinik? poliklinik,
      Spesialisasi? spesialisasi}) {
    return UserModel(
      spesialisasi: spesialisasi ?? this.spesialisasi,
      poliklinik: poliklinik ?? this.poliklinik,
      person: person ?? this.person,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      nik: nik ?? this.nik,
      noHp: noHp ?? this.noHp,
      bagian: bagian ?? this.bagian,
      pelayanan: pelayanan ?? this.pelayanan,
      userStatus: userStatus ?? this.userStatus,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      alamat: alamat ?? this.alamat,
      photo: photo ?? this.photo,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      tglLahir: tglLahir ?? this.tglLahir,
      kota: kota ?? this.kota,
      usia: usia ?? this.usia,
      agama: agama ?? this.agama,
      tglMasuk: tglMasuk ?? this.tglMasuk,
      statusKawin: statusKawin ?? this.statusKawin,
      kodePoli: kodePoli ?? this.kodePoli,
    );
  }

  Map<String, dynamic> toMap() => {
        "kodePoli": kodePoli,
        "nama": nama,
        "email": email,
        "nik": nik,
        "no_hp": noHp,
        "bagian": bagian,
        "pelayanan": pelayanan,
        "user_status": userStatus,
        "user_id": userId,
        "token": token,
        "refresh_token": refreshToken,
        "alamat": alamat,
        "photo": photo,
        "jenisKelamin": jenisKelamin,
        "tglLahir": tglLahir,
        "kota": kota,
        "usia": usia,
        "agama": agama,
        "tglMasuk": tglMasuk,
        "statusKawin": statusKawin,
      };

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      // Todo : Daftarkan Poli Disini
      spesialisasi:
          toSpesialisasiObject(value: json["spesialisasi"].toString()),
      poliklinik: toPoliklinik(value: json["kodePoli"].toString()),
      person: (json["person"] == "dokter")
          ? Person.dokter
          : (json["person"] == "perawat")
              ? Person.perawat
              : Person.nonDokter,
      kodePoli: json["kodePoli"].toString(),
      nama: json["nama"].toString(),
      email: json["email"].toString(),
      nik: json["nik"].toString(),
      noHp: json["no_hp"].toString(),
      bagian: json["bagian"].toString(),
      pelayanan: json["pelayanan"].toString(),
      userStatus: json["user_status"].toString(),
      userId: json["user_id"].toString(),
      token: json["token"].toString(),
      refreshToken: json["refresh_token"].toString(),
      alamat: json["alamat"].toString(),
      photo: json["photo"].toString(),
      jenisKelamin: json["jenisKelamin"].toString(),
      tglLahir: json["tglLahir"].toString(),
      kota: json["kota"].toString(),
      usia: json["usia"] as int,
      agama: json["agama"].toString(),
      tglMasuk: json["tglMasuk"].toString(),
      statusKawin: json["statusKawin"].toString(),
    );
  }
}

String toPelayanan({required Poliklinik poliklinik}) {
  switch (poliklinik) {
    case Poliklinik.bangsal:
      return "ranap";
    case Poliklinik.bidan:
      return "ranap";
    case Poliklinik.perina:
      return "ranap";
    case Poliklinik.ponek:
      return "ranap";
    default:
      return "rajal";
  }
}

String toPerson({required Person person}) {
  switch (person) {
    case Person.dokter:
      return "Dokter";
    default:
      return "Perawat";
  }
}

// POLIKLINIK ATAU PELAYANAN
Poliklinik toPoliklinik({required String value}) {
  switch (value) {
    case "POL013":
      return Poliklinik.bedahPlastik;
    case "PONEK":
      return Poliklinik.ponek;
    case "ICU":
      return Poliklinik.icu;
    case "ANGG":
      return Poliklinik.bangsal;
    case "MAHO":
      return Poliklinik.bangsal;
    case "MAWA":
      return Poliklinik.bangsal;
    case "MELA":
      return Poliklinik.bangsal;
    case "NEON":
      return Poliklinik.bangsal;
    case "NAOM":
      return Poliklinik.bangsal;
    case "LIDY":
      return Poliklinik.bangsal;
    case "ESTE":
      return Poliklinik.bangsal;
    case "PERI":
      return Poliklinik.perina;
    case "MARI":
      return Poliklinik.bidan;
    case "SARA":
      return Poliklinik.bidan;
    case "RUBY":
      return Poliklinik.bidan;
    case "ICU":
      return Poliklinik.bangsal;
    case "CEDR":
      return Poliklinik.bangsal;
    case "EMER":
      return Poliklinik.bangsal;
    case "CEND":
      return Poliklinik.bangsal;
    case "SAFI":
      return Poliklinik.bangsal;
    case "POL020":
      return Poliklinik.dalam;
    case "RECO":
      return Poliklinik.bangsal;
    case "POL037":
      return Poliklinik.gigi;
    case "POL024":
      return Poliklinik.mata;
    case "IGD001":
      return Poliklinik.igd;
    case "HAED":
      return Poliklinik.penMedik;
    default:
      return Poliklinik.bangsal;
  }
}

Spesialisasi toSpesialisasiObject({required String value}) {
  switch (value) {
    case "Dokter Gigi":
      return Spesialisasi.gigi;
    case "Spesialis Anak":
      return Spesialisasi.anak;
    case "Spesialis Anesthesi":
      return Spesialisasi.anesthesi;
    case "Spesialis Bedah Digestif":
      return Spesialisasi.degestif;
    case "Spesialis Bedah Ortophedi":
      return Spesialisasi.bedahOrtophedi;
    case "Spesialis Bedah Plastik":
      return Spesialisasi.bedahPlastik;
    case "Spesialis Bedah Saraf":
      return Spesialisasi.bedahSaraf;
    case "Spesialis Jantung":
      return Spesialisasi.jantung;
    case "Spesialis Kandungan ( Obgyn )":
      return Spesialisasi.obgyn;
    case "Spesialis Kesehatan Jiwa":
      return Spesialisasi.kesehatanJiwa;
    case "Spesialis Paru":
      return Spesialisasi.paru;
    case "Spesialis Patologi Klinik":
      return Spesialisasi.patologiKlinik;
    case "Spesialis Bedah Umum":
      return Spesialisasi.bedahUmum;
    case "Spesialis Penyakit Dalam":
      return Spesialisasi.penyakitDalam;
    case "Spesialis Penyakit Kulit & Kelamin":
      return Spesialisasi.penyakitKulitDanKelamin;
    case "Spesialis Radiologi":
      return Spesialisasi.radiologi;
    case "Spesialis Rehabilitasi Medik":
      return Spesialisasi.rehabilitasiMedik;
    case "Spesialis Saraf":
      return Spesialisasi.saraf;
    case "Spesialis THT":
      return Spesialisasi.tht;
    case "Spesialis Urologi":
      return Spesialisasi.urologi;
    case "Dokter Umum":
      return Spesialisasi.umum;
    default:
      return Spesialisasi.umum;
  }
}

String toKategoriString({required Spesialisasi spesiliasasi}) {
  switch (spesiliasasi) {
    case Spesialisasi.gigi:
      return "Gigi";
    case Spesialisasi.anak:
      return "Anak";
    case Spesialisasi.anesthesi:
      return "Anesthesi";
    case Spesialisasi.degestif:
      return "Bedah Digestif";
    case Spesialisasi.bedahOrtophedi:
      return "Bedah Ortophedi";
    case Spesialisasi.bedahPlastik:
      return "Bedah Plastik";
    case Spesialisasi.bedahSaraf:
      return "Bedah Saraf";
    case Spesialisasi.jantung:
      return "Jantung";
    case Spesialisasi.obgyn:
      return "Kandungan ( Obgyn )";
    case Spesialisasi.kesehatanJiwa:
      return "Kesehatan Jiwa";
    case Spesialisasi.paru:
      return "Paru";
    case Spesialisasi.patologiKlinik:
      return "Patologi Klinik";
    case Spesialisasi.umum:
      return "Dokter Umum";
    case Spesialisasi.penyakitDalam:
      return "Penyakit Dalam";
    case Spesialisasi.radiologi:
      return "Radiologi";
    case Spesialisasi.rehabilitasiMedik:
      return "Rehabilitasi Medik";
    case Spesialisasi.saraf:
      return "Saraf";
    case Spesialisasi.tht:
      return "THT";
    case Spesialisasi.urologi:
      return "Urologi";
    default:
      return "Umum";
  }
}

String toSpesialisasiString({required Spesialisasi spesiliasasi}) {
  switch (spesiliasasi) {
    case Spesialisasi.gigi:
      return "Dokter Gigi";
    case Spesialisasi.anak:
      return "Spesialis Anak";
    case Spesialisasi.anesthesi:
      return "Spesialis Anesthesi";
    case Spesialisasi.degestif:
      return "Spesialis Bedah Digestif";
    case Spesialisasi.bedahOrtophedi:
      return "Spesialis Bedah Ortophedi";
    case Spesialisasi.bedahPlastik:
      return "Spesialis Bedah Plastik";
    case Spesialisasi.bedahSaraf:
      return "Spesialis Bedah Saraf";
    case Spesialisasi.jantung:
      return "Spesialis Jantung";
    case Spesialisasi.obgyn:
      return "Spesialis Kandungan ( Obgyn )";
    case Spesialisasi.kesehatanJiwa:
      return "Spesialis Kesehatan Jiwa";
    case Spesialisasi.paru:
      return "Spesialis Paru";
    case Spesialisasi.patologiKlinik:
      return "Spesialis Patologi Klinik";
    case Spesialisasi.umum:
      return "Dokter Umum";
    case Spesialisasi.penyakitDalam:
      return "Spesialis Penyakit Dalam";
    case Spesialisasi.radiologi:
      return "Spesialis Radiologi";
    case Spesialisasi.rehabilitasiMedik:
      return "Spesialis Rehabilitasi Medik";
    case Spesialisasi.saraf:
      return "Spesialis Saraf";
    case Spesialisasi.tht:
      return "Spesialis THT";
    case Spesialisasi.urologi:
      return "Spesialis Urologi";
    default:
      return "Dokter Umum";
  }
}

// DATA SPESIALISAI
enum Spesialisasi {
  paru,
  patologiKlinik,
  rehabilitasiMedik,
  penyakitDalam,
  penyakitKulitDanKelamin,
  urologi,
  tht,
  saraf,
  bedahSaraf,
  radiologi,
  umum,
  gigi,
  anak,
  anesthesi,
  degestif,
  bedahOrtophedi,
  bedahPlastik,
  bedahUmum,
  jantung,
  obgyn,
  kesehatanJiwa,
}
