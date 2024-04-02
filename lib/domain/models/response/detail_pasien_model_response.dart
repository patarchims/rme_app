import 'package:equatable/equatable.dart';

class DetailPasienModel extends Equatable {
  final String id;
  final String nik;
  final String nokapst;
  final String nama;
  final String tempatlahir;
  final String har;
  final String bul;
  final String tah;
  final String jeniskelamin;
  final String status;
  final String negara;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  final String kelurahan;
  final String rtrw;
  final String alamat;
  final String alamat2;
  final String cpn;
  final String agama;
  final String suku;
  final String pendidikan;
  final String pekerjaan;
  final String cpName;
  final String cpNumber;
  final String cpRelasi;
  final int tahun;
  final int bulan;
  final int hari;

  const DetailPasienModel({
    required this.id,
    required this.nik,
    required this.nokapst,
    required this.nama,
    required this.tempatlahir,
    required this.har,
    required this.bul,
    required this.tah,
    required this.jeniskelamin,
    required this.status,
    required this.negara,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.kelurahan,
    required this.rtrw,
    required this.alamat,
    required this.alamat2,
    required this.cpn,
    required this.agama,
    required this.suku,
    required this.pendidikan,
    required this.pekerjaan,
    required this.cpName,
    required this.cpNumber,
    required this.cpRelasi,
    required this.tahun,
    required this.bulan,
    required this.hari,
  });

  @override
  List<Object?> get props => [
        id,
        nik,
        nokapst,
        nama,
        tempatlahir,
        har,
        bul,
        tah,
        jeniskelamin,
        status,
        negara,
        provinsi,
        kabupaten,
        kecamatan,
        kelurahan,
        rtrw,
        alamat,
        alamat2,
        cpn,
        agama,
        suku,
        pendidikan,
        pekerjaan,
        cpName,
        cpNumber,
        cpRelasi,
        tahun,
        bulan,
        hari
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nik': nik,
      'nokapst': nokapst,
      'nama': nama,
      'tempatlahir': tempatlahir,
      'har': har,
      'bul': bul,
      'tah': tah,
      'jeniskelamin': jeniskelamin,
      'status': status,
      'negara': negara,
      'provinsi': provinsi,
      'kabupaten': kabupaten,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'rtrw': rtrw,
      'alamat': alamat,
      'alamat2': alamat2,
      'cpn': cpn,
      'agama': agama,
      'suku': suku,
      'pendidikan': pendidikan,
      'pekerjaan': pekerjaan,
      'cpName': cpName,
      'cpNumber': cpNumber,
      'cpRelasi': cpRelasi,
      'tahun': tahun,
      'bulan': bulan,
      'hari': hari,
    };
  }

  factory DetailPasienModel.fromMap(Map<String, dynamic> map) {
    return DetailPasienModel(
      id: map['id'].toString(),
      nik: map['nik'].toString(),
      nokapst: map['nokapst'].toString(),
      nama: map['nama'].toString(),
      tempatlahir: map['tempatlahir'].toString(),
      har: map['har'].toString(),
      bul: map['bul'].toString(),
      tah: map['tah'].toString(),
      jeniskelamin: map['jeniskelamin'].toString(),
      status: map['status'].toString(),
      negara: map['negara'].toString(),
      provinsi: map['provinsi'].toString(),
      kabupaten: map['kabupaten'].toString(),
      kecamatan: map['kecamatan'].toString(),
      kelurahan: map['kelurahan'].toString(),
      rtrw: map['rtrw'].toString(),
      alamat: map['alamat'].toString(),
      alamat2: map['alamat2'].toString(),
      cpn: map['cpn'].toString(),
      agama: map['agama'].toString(),
      suku: map['suku'].toString(),
      pendidikan: map['pendidikan'].toString(),
      pekerjaan: map['pekerjaan'].toString(),
      cpName: map['cpName'].toString(),
      cpNumber: map['cpNumber'].toString(),
      cpRelasi: map['cpRelasi'].toString(),
      tahun: map['tahun'] as int,
      bulan: map['bulan'] as int,
      hari: map['hari'] as int,
    );
  }
}

class RiwayatPasienModel extends Equatable {
  final String noreg;
  final String dokter;
  final String dttm;
  final String bagian;
  final String umur;
  final String debitur;
  final String noSep;

  const RiwayatPasienModel({
    required this.noreg,
    required this.dokter,
    required this.dttm,
    required this.bagian,
    required this.umur,
    required this.debitur,
    required this.noSep,
  });

  factory RiwayatPasienModel.fromMap(Map<String, dynamic> json) =>
      RiwayatPasienModel(
        dokter: json["dokter"].toString(),
        noreg: json["noreg"].toString(),
        dttm: json["dttm"].toString().substring(0, 10),
        bagian: json["bagian"].toString(),
        umur: json["umur"].toString(),
        debitur: json["debitur"].toString(),
        noSep: json["noSEP"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "dokter": dokter,
        "noreg": noreg,
        "dttm": dttm,
        "bagian": bagian,
        "umur": umur,
        "debitur": debitur,
        "noSEP": noSep,
      };

  @override
  List<Object?> get props =>
      [noreg, dttm, bagian, umur, debitur, noSep, dokter];
}
