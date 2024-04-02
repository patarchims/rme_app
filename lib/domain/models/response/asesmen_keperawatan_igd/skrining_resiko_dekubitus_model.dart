class SkriningResikoDekubitusModel {
  String dekubitus1;
  String dekubitus2;
  String dekubitus3;
  String dekubitus4;
  String dekubitusAnak;

  SkriningResikoDekubitusModel({
    required this.dekubitus1,
    required this.dekubitus2,
    required this.dekubitus3,
    required this.dekubitus4,
    required this.dekubitusAnak,
  });

  factory SkriningResikoDekubitusModel.fromJson(Map<String, dynamic> json) =>
      SkriningResikoDekubitusModel(
        dekubitus1: json["dekubitus1"],
        dekubitus2: json["dekubitus2"],
        dekubitus3: json["dekubitus3"],
        dekubitus4: json["dekubitus4"],
        dekubitusAnak: json["dekubitus_anak"],
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "dekubitus1": dekubitus1,
        "dekubitus2": dekubitus2,
        "dekubitus3": dekubitus3,
        "dekubitus4": dekubitus4,
        "dekubitus_anak": dekubitusAnak,
      };

  SkriningResikoDekubitusModel copyWith({
    String? dekubitus1,
    String? dekubitus2,
    String? dekubitus3,
    String? dekubitus4,
    String? dekubitusAnak,
  }) {
    return SkriningResikoDekubitusModel(
      dekubitus1: dekubitus1 ?? this.dekubitus1,
      dekubitus2: dekubitus2 ?? this.dekubitus2,
      dekubitus3: dekubitus3 ?? this.dekubitus3,
      dekubitus4: dekubitus4 ?? this.dekubitus4,
      dekubitusAnak: dekubitusAnak ?? this.dekubitusAnak,
    );
  }
}
