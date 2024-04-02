// ignore_for_file: public_member_api_docs, sort_constructors_first
class TindakLajutModel {
  String tindakanOperas;
  String tindakLajut;
  String kontrolUlang;

  TindakLajutModel({
    required this.tindakanOperas,
    required this.tindakLajut,
    required this.kontrolUlang,
  });

  factory TindakLajutModel.fromJson(Map<String, dynamic> json) =>
      TindakLajutModel(
        tindakanOperas: json["tindakan_operasi"].toString(),
        tindakLajut: json["tindak_lanjut"].toString(),
        kontrolUlang: json["kontrol_ulang"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "tindakan_operas": tindakanOperas,
        "tindak_lajut": tindakLajut,
        "kontrol_ulang": kontrolUlang,
      };

  TindakLajutModel copyWith({
    String? tindakanOperas,
    String? tindakLajut,
    String? kontrolUlang,
  }) {
    return TindakLajutModel(
      tindakanOperas: tindakanOperas ?? this.tindakanOperas,
      tindakLajut: tindakLajut ?? this.tindakLajut,
      kontrolUlang: kontrolUlang ?? this.kontrolUlang,
    );
  }
}
