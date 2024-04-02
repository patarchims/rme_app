import 'package:equatable/equatable.dart';

class KVitalSignModel extends Equatable {
  final String kode;
  final String jenisGrup;
  final String deskripsi;

  const KVitalSignModel({
    required this.kode,
    required this.jenisGrup,
    required this.deskripsi,
  });

  factory KVitalSignModel.fromMap(Map<String, dynamic> json) => KVitalSignModel(
        kode: json["kode"],
        jenisGrup: json["jenisGrup"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toMap() => {
        "kode": kode,
        "jenisGrup": jenisGrup,
        "deskripsi": deskripsi,
      };

  @override
  List<Object?> get props => [kode, jenisGrup, deskripsi];
}
