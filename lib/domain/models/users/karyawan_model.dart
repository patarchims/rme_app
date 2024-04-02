import 'package:equatable/equatable.dart';

class KaryawanModel extends Equatable {
  final String nik;
  final String idKaryawan;
  final String hp;
  final String alamat;
  final String photo;
  final String bagian;
  final String nama;
  final String jenisKelamin;
  final String tglLahir;
  final String tempatLahir;
  final String kota;
  final String usia;
  final String agama;
  final String statusKawin;
  final String email;
  final String tglMasuk;

  const KaryawanModel({
    required this.nik,
    required this.idKaryawan,
    required this.hp,
    required this.alamat,
    required this.photo,
    required this.bagian,
    required this.nama,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.tempatLahir,
    required this.kota,
    required this.usia,
    required this.agama,
    required this.statusKawin,
    required this.email,
    required this.tglMasuk,
  });

  @override
  List<Object?> get props => [
        nik,
        idKaryawan,
        hp,
        alamat,
        photo,
        bagian,
        nama,
        jenisKelamin,
        tglLahir,
        tempatLahir,
        kota,
        usia,
        agama,
        statusKawin,
        email,
        tglMasuk
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nik': nik,
      'idKaryawan': idKaryawan,
      'hp': hp,
      'alamat': alamat,
      'photo': photo,
      'bagian': bagian,
      'nama': nama,
      'jenisKelamin': jenisKelamin,
      'tglLahir': tglLahir,
      'tempatLahir': tempatLahir,
      'kota': kota,
      'usia': usia,
      'agama': agama,
      'statusKawin': statusKawin,
      'email': email,
      'tgl_masuk': tglMasuk,
    };
  }

  factory KaryawanModel.fromMap(Map<String, dynamic> map) {
    return KaryawanModel(
      nik: map['nik'].toString(),
      idKaryawan: map['idKaryawan'].toString(),
      hp: map['hp'].toString(),
      alamat: map['alamat'].toString(),
      photo: map['photo'].toString(),
      bagian: map['bagian'].toString(),
      nama: map['nama'].toString(),
      jenisKelamin: map['jenisKelamin'].toString(),
      tglLahir: map['tglLahir'].toString(),
      tempatLahir: map['tempatLahir'].toString(),
      kota: map['kota'].toString(),
      usia: map['usia'].toString(),
      agama: map['agama'].toString(),
      statusKawin: map['statusKawin'].toString(),
      email: map['email'].toString(),
      tglMasuk: map['tgl_masuk'].toString(),
    );
  }
}
