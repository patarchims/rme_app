import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? username;
  final String? ket;
  final String? nama;
  final String? statusKawin;
  final String? photo;
  final String? norm;
  final String? nik;
  final String? bpjs;
  final String? noka;
  final String? jk;
  final String? alamat;
  final String? tglLahir;
  final String? hp;
  final String? prov;
  final String? kota;
  final String? kel;
  final String? rtRw;
  final String? kec;
  final String? kodePoli;
  final String? bagian;
  final String? email;
  final String? shift;
  final String? agama;
  final String? kabupaten;
  final String? tempatLahir;

  const UserEntity(
      {this.kabupaten,
      this.kodePoli,
      this.kec,
      this.username,
      this.ket,
      this.nama,
      this.statusKawin,
      this.photo,
      this.norm,
      this.nik,
      this.bpjs,
      this.noka,
      this.jk,
      this.alamat,
      this.tglLahir,
      this.hp,
      this.prov,
      this.kota,
      this.kel,
      this.rtRw,
      this.bagian,
      this.shift,
      this.email,
      this.agama,
      this.tempatLahir});

  @override
  List<Object?> get props => [
        username,
        ket,
        nama,
        statusKawin,
        photo,
        nik,
        bpjs,
        noka,
        jk,
        alamat,
        tglLahir,
        hp,
        prov,
        kota,
        kel,
        rtRw,
        bagian,
        shift,
        email,
        agama,
        tempatLahir,
        kec,
        kabupaten,
        kodePoli
      ];

  UserEntity copyWith({
    String? username,
    String? ket,
    String? nama,
    String? statusKawin,
    String? photo,
    String? norm,
    String? nik,
    String? bpjs,
    String? noka,
    String? jk,
    String? alamat,
    String? tglLahir,
    String? hp,
    String? prov,
    String? kota,
    String? kel,
    String? rtRw,
    String? kec,
    String? bagian,
    String? email,
    String? shift,
    String? agama,
    String? kabupaten,
    String? tempatLahir,
    String? kodePoli,
  }) {
    return UserEntity(
      username: username ?? this.username,
      kodePoli: kodePoli ?? this.kodePoli,
      ket: ket ?? this.ket,
      nama: nama ?? this.nama,
      statusKawin: statusKawin ?? this.statusKawin,
      photo: photo ?? this.photo,
      norm: norm ?? this.norm,
      nik: nik ?? this.nik,
      bpjs: bpjs ?? this.bpjs,
      noka: noka ?? this.noka,
      jk: jk ?? this.jk,
      alamat: alamat ?? this.alamat,
      tglLahir: tglLahir ?? this.tglLahir,
      hp: hp ?? this.hp,
      prov: prov ?? this.prov,
      kota: kota ?? this.kota,
      kel: kel ?? this.kel,
      rtRw: rtRw ?? this.rtRw,
      kec: kec ?? this.kec,
      bagian: bagian ?? this.bagian,
      email: email ?? this.email,
      shift: shift ?? this.shift,
      agama: agama ?? this.agama,
      kabupaten: kabupaten ?? this.kabupaten,
      tempatLahir: tempatLahir ?? this.tempatLahir,
    );
  }
}

class InstansiEntity extends Equatable {
  final String? namaInstansi;
  final String? alamatInstansi;
  final String? telp;
  final double lat;
  final double long;
  final String pagi;
  final String sore;
  final String malam;
  final String kantor;
  final int toleransiJarak;
  final int biaya;

  const InstansiEntity({
    required this.namaInstansi,
    required this.alamatInstansi,
    required this.telp,
    required this.lat,
    required this.long,
    required this.pagi,
    required this.sore,
    required this.malam,
    required this.kantor,
    required this.toleransiJarak,
    required this.biaya,
  });

  @override
  List<Object?> get props => [
        namaInstansi,
        alamatInstansi,
        telp,
        lat,
        long,
        pagi,
        sore,
        malam,
        kantor,
        toleransiJarak,
        biaya
      ];
}
