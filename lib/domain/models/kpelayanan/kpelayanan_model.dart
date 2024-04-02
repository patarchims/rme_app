import 'package:equatable/equatable.dart';

class KPelayananModel extends Equatable {
  final String kdBagian;
  final String bagian;
  final String pelayanan;
  final String mapingBpjs;

  const KPelayananModel({
    required this.kdBagian,
    required this.bagian,
    required this.pelayanan,
    required this.mapingBpjs,
  });

  factory KPelayananModel.fromMap(Map<String, dynamic> json) => KPelayananModel(
        kdBagian: json["kd_bagian"],
        bagian: json["bagian"],
        pelayanan: json["pelayanan"],
        mapingBpjs: json["maping_bpjs"],
      );

  Map<String, dynamic> toMap() => {
        "kd_bagian": kdBagian,
        "bagian": bagian,
        "pelayanan": pelayanan,
        "maping_bpjs": mapingBpjs,
      };

  @override
  List<Object?> get props => [kdBagian, bagian, pelayanan, mapingBpjs];
}
