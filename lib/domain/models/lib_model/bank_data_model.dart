import 'package:equatable/equatable.dart';

class BankDataModel extends Equatable {
  final String kdBagian;
  final String kategori;
  final String kdDeskripsi;
  final String deskripsi;
  const BankDataModel({
    required this.kdBagian,
    required this.kategori,
    required this.kdDeskripsi,
    required this.deskripsi,
  });

  @override
  List<Object?> get props => [kdBagian, kategori, kdDeskripsi, deskripsi];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kdBagian': kdBagian,
      'kategori': kategori,
      'kdDeskripsi': kdDeskripsi,
      'deskripsi': deskripsi,
    };
  }

  factory BankDataModel.fromMap(Map<String, dynamic> map) {
    return BankDataModel(
      kdBagian: map['kdBagian'] as String,
      kategori: map['kategori'] as String,
      kdDeskripsi: map['kdDeskripsi'] as String,
      deskripsi: map['deskripsi'] as String,
    );
  }
}
