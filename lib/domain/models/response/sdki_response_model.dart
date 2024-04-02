class SDKIModelResponse {
  final String kode;
  final String judul;
  final String defenisi;
  final String etiologi;

  SDKIModelResponse({
    required this.kode,
    required this.judul,
    required this.defenisi,
    required this.etiologi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'judul': judul,
      'defenisi': defenisi,
      'etiologi': etiologi,
    };
  }

  factory SDKIModelResponse.fromMap(Map<String, dynamic> map) {
    return SDKIModelResponse(
      kode: map['kode'] as String,
      judul: map['judul'] as String,
      defenisi: map['defenisi'] as String,
      etiologi: map['etiologi'] as String,
    );
  }
}
