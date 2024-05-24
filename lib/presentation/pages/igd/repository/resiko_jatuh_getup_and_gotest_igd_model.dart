class ResikoJatuhGetUpAndGoTestRepository {
  final String resikoJatuh1;
  final String resikoJatuh2;
  final String tindakan;
  ResikoJatuhGetUpAndGoTestRepository({
    required this.resikoJatuh1,
    required this.resikoJatuh2,
    required this.tindakan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resikoJatuh1': resikoJatuh1,
      'resikoJatuh2': resikoJatuh2,
      'tindakan': tindakan,
    };
  }

  factory ResikoJatuhGetUpAndGoTestRepository.fromMap(
      Map<String, dynamic> map) {
    return ResikoJatuhGetUpAndGoTestRepository(
      resikoJatuh1: map['resiko_jatuh1'].toString(),
      resikoJatuh2: map['resiko_jatuh2'].toString(),
      tindakan: map['tindakan'].toString(),
    );
  }

  ResikoJatuhGetUpAndGoTestRepository copyWith({
    String? resikoJatuh1,
    String? resikoJatuh2,
    String? tindakan,
  }) {
    return ResikoJatuhGetUpAndGoTestRepository(
      resikoJatuh1: resikoJatuh1 ?? this.resikoJatuh1,
      resikoJatuh2: resikoJatuh2 ?? this.resikoJatuh2,
      tindakan: tindakan ?? this.tindakan,
    );
  }
}
