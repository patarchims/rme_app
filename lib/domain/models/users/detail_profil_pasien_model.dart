import 'package:hms_app/presentation/component/extenstion/date_helper.dart';

class DetailProfilPasienModel {
  final String tanggal;
  final String diagnosa;
  final String keluhanUtama;
  final String riwayatSekarang;
  final String riwayatPenyakitKeluarga;
  final String riwayatAlergiDetail;
  final String terapi;
  final String noreg;
  final String noRm;
  final List<DetailProfilPasienModelDetailPenmed> detailPenmed;
  final List<DetailLabor> detailLabor;

  DetailProfilPasienModel({
    required this.tanggal,
    required this.diagnosa,
    required this.keluhanUtama,
    required this.riwayatSekarang,
    required this.riwayatPenyakitKeluarga,
    required this.riwayatAlergiDetail,
    required this.terapi,
    required this.noreg,
    required this.noRm,
    required this.detailPenmed,
    required this.detailLabor,
  });

  DetailProfilPasienModel copyWith({
    String? tanggal,
    String? diagnosa,
    String? keluhanUtama,
    String? riwayatSekarang,
    String? riwayatPenyakitKeluarga,
    String? riwayatAlergiDetail,
    String? terapi,
    String? noreg,
    String? noRm,
    List<DetailProfilPasienModelDetailPenmed>? detailPenmed,
    List<DetailLabor>? detailLabor,
  }) =>
      DetailProfilPasienModel(
        tanggal: tanggal ?? this.tanggal,
        diagnosa: diagnosa ?? this.diagnosa,
        keluhanUtama: keluhanUtama ?? this.keluhanUtama,
        riwayatSekarang: riwayatSekarang ?? this.riwayatSekarang,
        riwayatPenyakitKeluarga:
            riwayatPenyakitKeluarga ?? this.riwayatPenyakitKeluarga,
        riwayatAlergiDetail: riwayatAlergiDetail ?? this.riwayatAlergiDetail,
        terapi: terapi ?? this.terapi,
        noreg: noreg ?? this.noreg,
        noRm: noRm ?? this.noRm,
        detailPenmed: detailPenmed ?? this.detailPenmed,
        detailLabor: detailLabor ?? this.detailLabor,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tanggal': tanggal,
      'diagnosa': diagnosa,
      'keluhanUtama': keluhanUtama,
      'riwayatSekarang': riwayatSekarang,
      'riwayatPenyakitKeluarga': riwayatPenyakitKeluarga,
      'riwayatAlergiDetail': riwayatAlergiDetail,
      'terapi': terapi,
      'noreg': noreg,
      'noRm': noRm,
      'detailPenmed': detailPenmed.map((x) => x.toMap()).toList(),
      'detailLabor': detailLabor.map((x) => x.toMap()).toList(),
    };
  }

  factory DetailProfilPasienModel.fromMap(Map<String, dynamic> map) {
    return DetailProfilPasienModel(
        tanggal: tglIndo(map['tanggal'].toString()),
        diagnosa: map['diagnosa'].toString(),
        keluhanUtama: map['keluhan_utama'].toString(),
        riwayatSekarang: map['riwayat_sekarang'].toString(),
        riwayatPenyakitKeluarga: map['riwayat_penyakit_keluarga'].toString(),
        riwayatAlergiDetail: map['riwayat_alergi_detail'].toString(),
        terapi: map['terapi'].toString(),
        noreg: map['noreg'].toString(),
        noRm: map['no_rm'].toString(),
        detailPenmed: (map['detail_penmed'] as Iterable)
            .map((e) => DetailProfilPasienModelDetailPenmed.fromMap(e))
            .toList(),
        detailLabor: (map['detail_labor'] as Iterable)
            .map((e) => DetailLabor.fromMap(e))
            .toList());
  }
}

class DetailLabor {
  final String dpjp;
  final String asalPelayanan;
  final String nomorLab;
  final String kelompok;
  final List<Lab> lab;

  DetailLabor({
    required this.dpjp,
    required this.asalPelayanan,
    required this.nomorLab,
    required this.kelompok,
    required this.lab,
  });

  DetailLabor copyWith({
    String? dpjp,
    String? asalPelayanan,
    String? nomorLab,
    String? kelompok,
    List<Lab>? lab,
  }) =>
      DetailLabor(
        dpjp: dpjp ?? this.dpjp,
        asalPelayanan: asalPelayanan ?? this.asalPelayanan,
        nomorLab: nomorLab ?? this.nomorLab,
        kelompok: kelompok ?? this.kelompok,
        lab: lab ?? this.lab,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dpjp': dpjp,
      'asalPelayanan': asalPelayanan,
      'nomorLab': nomorLab,
      'kelompok': kelompok,
      'lab': lab.map((x) => x.toMap()).toList(),
    };
  }

  factory DetailLabor.fromMap(Map<String, dynamic> map) {
    return DetailLabor(
      dpjp: map['dpjp'] as String,
      asalPelayanan: map['asal_pelayanan'] as String,
      nomorLab: map['nomor_lab'] as String,
      kelompok: map['kelompok'] as String,
      lab: List<Lab>.from(
        (map['lab'] as Iterable).map<Lab>(
          (x) => Lab.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class Lab {
  final String kode;
  final String hasil;
  final String satuan;
  final String normal;
  final String deskripsi;

  Lab({
    required this.kode,
    required this.hasil,
    required this.satuan,
    required this.normal,
    required this.deskripsi,
  });

  Lab copyWith({
    String? kode,
    String? hasil,
    String? satuan,
    String? normal,
    String? deskripsi,
  }) =>
      Lab(
        kode: kode ?? this.kode,
        hasil: hasil ?? this.hasil,
        satuan: satuan ?? this.satuan,
        normal: normal ?? this.normal,
        deskripsi: deskripsi ?? this.deskripsi,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'hasil': hasil,
      'satuan': satuan,
      'normal': normal,
      'deskripsi': deskripsi,
    };
  }

  factory Lab.fromMap(Map<String, dynamic> map) {
    return Lab(
      kode: map['kode'] as String,
      hasil: map['hasil'] as String,
      satuan: map['satuan'] as String,
      normal: map['normal'] as String,
      deskripsi: map['deskripsi'] as String,
    );
  }
}

class DetailProfilPasienModelDetailPenmed {
  final String noPenmed;
  final String kdDokter;
  final String ketPelayanan;
  final String bagian;
  final String namaDokter;
  final List<DetailPenmedDetailPenmed> detailPenmed2;

  DetailProfilPasienModelDetailPenmed({
    required this.noPenmed,
    required this.kdDokter,
    required this.ketPelayanan,
    required this.bagian,
    required this.namaDokter,
    required this.detailPenmed2,
  });

  DetailProfilPasienModelDetailPenmed copyWith({
    String? noPenmed,
    String? kdDokter,
    String? ketPelayanan,
    String? bagian,
    String? namaDokter,
    List<DetailPenmedDetailPenmed>? detailPenmed2,
  }) =>
      DetailProfilPasienModelDetailPenmed(
        noPenmed: noPenmed ?? this.noPenmed,
        kdDokter: kdDokter ?? this.kdDokter,
        ketPelayanan: ketPelayanan ?? this.ketPelayanan,
        bagian: bagian ?? this.bagian,
        namaDokter: namaDokter ?? this.namaDokter,
        detailPenmed2: detailPenmed2 ?? this.detailPenmed2,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'no_penmed': noPenmed,
      'kd_dokter': kdDokter,
      'ket_pelayanan': ketPelayanan,
      'bagian': bagian,
      'nama_dokter': namaDokter,
      'detail_penmed': detailPenmed2.map((x) => x.toMap()).toList(),
    };
  }

  factory DetailProfilPasienModelDetailPenmed.fromMap(
      Map<String, dynamic> map) {
    return DetailProfilPasienModelDetailPenmed(
        noPenmed: map['no_penmed'].toString(),
        kdDokter: map['kd_dokter'].toString(),
        ketPelayanan: map['ket_pelayanan'].toString(),
        bagian: map['bagian'].toString(),
        namaDokter: map['nama_dokter'].toString(),
        detailPenmed2: (map['detail_penmed'] as Iterable)
            .map((e) => DetailPenmedDetailPenmed.fromMap(e))
            .toList());
  }
}

class DetailPenmedDetailPenmed {
  final String deskripsi;
  final String uraian;
  final String hasil;
  final String catatan;

  DetailPenmedDetailPenmed({
    required this.deskripsi,
    required this.uraian,
    required this.hasil,
    required this.catatan,
  });

  DetailPenmedDetailPenmed copyWith({
    String? deskripsi,
    String? uraian,
    String? hasil,
    String? catatan,
  }) =>
      DetailPenmedDetailPenmed(
        deskripsi: deskripsi ?? this.deskripsi,
        uraian: uraian ?? this.uraian,
        hasil: hasil ?? this.hasil,
        catatan: catatan ?? this.catatan,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deskripsi': deskripsi,
      'uraian': uraian,
      'hasil': hasil,
      'catatan': catatan,
    };
  }

  factory DetailPenmedDetailPenmed.fromMap(Map<String, dynamic> map) {
    return DetailPenmedDetailPenmed(
      deskripsi: map['deskripsi'].toString(),
      uraian: map['uraian'].toString(),
      hasil: map['hasil'].toString(),
      catatan: map['catatan'].toString(),
    );
  }
}
