// import 'dart:convert';

// class DetailProfilPasienModel {
//   final String noPenmed;
//   final String kdDokter;
//   final String ketPelayanan;
//   final String bagian;
//   final String namaDokter;
//   final List<DetailPenmed> detailPenmed;

//   DetailProfilPasienModel({
//     required this.noPenmed,
//     required this.kdDokter,
//     required this.ketPelayanan,
//     required this.bagian,
//     required this.namaDokter,
//     required this.detailPenmed,
//   });

//   DetailProfilPasienModel copyWith({
//     String? noPenmed,
//     String? kdDokter,
//     String? ketPelayanan,
//     String? bagian,
//     String? namaDokter,
//     List<DetailPenmed>? detailPenmed,
//   }) =>
//       DetailProfilPasienModel(
//         noPenmed: noPenmed ?? this.noPenmed,
//         kdDokter: kdDokter ?? this.kdDokter,
//         ketPelayanan: ketPelayanan ?? this.ketPelayanan,
//         bagian: bagian ?? this.bagian,
//         namaDokter: namaDokter ?? this.namaDokter,
//         detailPenmed: detailPenmed ?? this.detailPenmed,
//       );


//   factory DetailProfilPasienModel.fromMap(Map<String, dynamic> map) {
//     return DetailProfilPasienModel(
//       noPenmed: map['noPenmed'] as String,
//       kdDokter: map['kdDokter'] as String,
//       ketPelayanan: map['ketPelayanan'] as String,
//       bagian: map['bagian'] as String,
//       namaDokter: map['namaDokter'] as String,
//       detailPenmed: List<DetailPenmed>.from((map['detailPenmed'] as List<int>).map<DetailPenmed>((x) => DetailPenmed.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

// }

// class DetailPenmed {
//   final String deskripsi;
//   final String uraian;
//   final String hasil;
//   final String catatan;

//   DetailPenmed({
//     required this.deskripsi,
//     required this.uraian,
//     required this.hasil,
//     required this.catatan,
//   });

//   DetailPenmed copyWith({
//     String? deskripsi,
//     String? uraian,
//     String? hasil,
//     String? catatan,
//   }) =>
//       DetailPenmed(
//         deskripsi: deskripsi ?? this.deskripsi,
//         uraian: uraian ?? this.uraian,
//         hasil: hasil ?? this.hasil,
//         catatan: catatan ?? this.catatan,
//       );
// }
