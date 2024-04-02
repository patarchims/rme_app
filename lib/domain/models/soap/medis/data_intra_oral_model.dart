class DataIntraOralModel {
  String anterior;
  String posterior;
  String molar;
  String palatum;
  String torusP;
  String torusM;
  String torusMDetail;
  String superTeeth;
  String superTeethDetail;
  String diastema;
  String diastemaDetail;
  String gigiAnomali;
  String gigiAnomaliDetail;
  String khusOralLain;
  String noReg;

  DataIntraOralModel({
    required this.anterior,
    required this.posterior,
    required this.molar,
    required this.palatum,
    required this.torusP,
    required this.torusM,
    required this.torusMDetail,
    required this.superTeeth,
    required this.superTeethDetail,
    required this.diastema,
    required this.diastemaDetail,
    required this.gigiAnomali,
    required this.gigiAnomaliDetail,
    required this.khusOralLain,
    required this.noReg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'anterior': anterior,
      'posterior': posterior,
      'molar': molar,
      'palatum': palatum,
      'torusP': torusP,
      'torusM': torusM,
      'torusMDetail': torusMDetail,
      'superTeeth': superTeeth,
      'superTeethDetail': superTeethDetail,
      'diastema': diastema,
      'diastemaDetail': diastemaDetail,
      'gigiAnomali': gigiAnomali,
      'gigiAnomaliDetail': gigiAnomaliDetail,
      'khusOralLain': khusOralLain,
      'noReg': noReg,
    };
  }

  factory DataIntraOralModel.fromMap(Map<String, dynamic> map) {
    return DataIntraOralModel(
      anterior: map['anterior'] as String,
      posterior: map['posterior'] as String,
      molar: map['molar'] as String,
      palatum: map['palatum'] as String,
      torusP: map['torusP'] as String,
      torusM: map['torusM'] as String,
      torusMDetail: map['torusMDetail'] as String,
      superTeeth: map['superTeeth'] as String,
      superTeethDetail: map['superTeethDetail'] as String,
      diastema: map['diastema'] as String,
      diastemaDetail: map['diastemaDetail'] as String,
      gigiAnomali: map['gigiAnomali'] as String,
      gigiAnomaliDetail: map['gigiAnomaliDetail'] as String,
      khusOralLain: map['khusOralLain'] as String,
      noReg: map['noReg'] as String,
    );
  }
}
