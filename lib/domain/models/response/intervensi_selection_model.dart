import 'package:hms_app/domain/models/response/intervensi_model.dart';

class IntervensiSelectionModel {
  final String selectionNumber;
  final Slki slki;

  IntervensiSelectionModel({
    required this.selectionNumber,
    required this.slki,
  });

  IntervensiSelectionModel copyWith({
    String? selectionNumber,
    Slki? slki,
  }) {
    return IntervensiSelectionModel(
      selectionNumber: selectionNumber ?? this.selectionNumber,
      slki: slki ?? this.slki,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selection_number': selectionNumber,
      'slki': slki.toJson(),
    };
  }

  factory IntervensiSelectionModel.fromMap(Map<String, dynamic> map) {
    return IntervensiSelectionModel(
      selectionNumber: map['selection_number'] as String,
      slki: Slki.fromJson(map['slki'] as Map<String, dynamic>),
    );
  }
}
