import 'package:equatable/equatable.dart';

enum GigiKategori { seri, geraham }

class GigiModel extends Equatable {
  final String images;
  final int numberGigi;
  final GigiKategori kategori;
  const GigiModel({
    required this.images,
    required this.numberGigi,
    required this.kategori,
  });

  @override
  List<Object?> get props => [images, kategori];
}

List<GigiModel> listGigiModelUser = [
  const GigiModel(images: "01", numberGigi: 18, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 17, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 16, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 15, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 14, kategori: GigiKategori.geraham),
  const GigiModel(images: "21", numberGigi: 13, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 12, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 11, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 21, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 22, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 23, kategori: GigiKategori.seri),
  const GigiModel(images: "01", numberGigi: 24, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 25, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 26, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 27, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 28, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 55, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 54, kategori: GigiKategori.geraham),
  const GigiModel(images: "21", numberGigi: 53, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 52, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 51, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 61, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 62, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 63, kategori: GigiKategori.seri),
  const GigiModel(images: "01", numberGigi: 64, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 65, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 85, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 84, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 83, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 82, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 81, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 71, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 72, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 73, kategori: GigiKategori.seri),
  const GigiModel(images: "01", numberGigi: 74, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 75, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 48, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 47, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 46, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 45, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 44, kategori: GigiKategori.geraham),
  const GigiModel(images: "21", numberGigi: 43, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 42, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 41, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 31, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 32, kategori: GigiKategori.seri),
  const GigiModel(images: "21", numberGigi: 33, kategori: GigiKategori.seri),
  const GigiModel(images: "01", numberGigi: 34, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 35, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 36, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 37, kategori: GigiKategori.geraham),
  const GigiModel(images: "01", numberGigi: 38, kategori: GigiKategori.geraham),
];
