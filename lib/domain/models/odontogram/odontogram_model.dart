import 'package:equatable/equatable.dart';

class OdontogramModel extends Equatable {
  final int number;
  final String imageUrl;
  final String keterangan;
  const OdontogramModel({
    required this.number,
    required this.imageUrl,
    required this.keterangan,
  });
  @override
  List<Object?> get props => [number, imageUrl, keterangan];
}
