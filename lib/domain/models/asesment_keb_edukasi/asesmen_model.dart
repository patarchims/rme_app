import 'package:equatable/equatable.dart';

class AsesmenModel extends Equatable {
  final String keluhUtama;
  final String jenisPelayanan;
  final String rwtSekarang;
  final String rwtDulu;
  final String rwtObat;
  final String rwtPenyKeluarga;
  final String rwtPenyAlergi;
  final String rwtPenyAlergiDetail;
  final String khusPemGigi1;
  final String khusPemGigi2;
  final String khusPemGigi3;
  final String khusPemGigi4;
  final String khusPemGigi5;
  final String khusPemGigi5Detail;

  const AsesmenModel({
    required this.keluhUtama,
    required this.jenisPelayanan,
    required this.rwtSekarang,
    required this.rwtDulu,
    required this.rwtObat,
    required this.rwtPenyKeluarga,
    required this.rwtPenyAlergi,
    required this.rwtPenyAlergiDetail,
    required this.khusPemGigi1,
    required this.khusPemGigi2,
    required this.khusPemGigi3,
    required this.khusPemGigi4,
    required this.khusPemGigi5,
    required this.khusPemGigi5Detail,
  });

  factory AsesmenModel.fromJson(Map<String, dynamic> json) => AsesmenModel(
        keluhUtama: json["keluhUtama"],
        jenisPelayanan: json["jenisPelayanan"],
        rwtSekarang: json["rwtSekarang"],
        rwtDulu: json["rwtDulu"],
        rwtObat: json["rwtObat"],
        rwtPenyKeluarga: json["rwtPenyKeluarga"],
        rwtPenyAlergi: json["rwtPenyAlergi"],
        rwtPenyAlergiDetail: json["rwtPenyAlergiDetail"],
        khusPemGigi1: json["khusPemGigi1"],
        khusPemGigi2: json["khusPemGigi2"],
        khusPemGigi3: json["khusPemGigi3"],
        khusPemGigi4: json["khusPemGigi4"],
        khusPemGigi5: json["khusPemGigi5"],
        khusPemGigi5Detail: json["khusPemGigi5Detail"],
      );

  Map<String, dynamic> toJson({String? noreg}) => {
        "noReg": noreg,
        "keluhUtama": keluhUtama,
        "jenisPelayanan": jenisPelayanan,
        "rwtSekarang": rwtSekarang,
        "rwtDulu": rwtDulu,
        "rwtObat": rwtObat,
        "rwtPenyKeluarga": rwtPenyKeluarga,
        "rwtPenyAlergi": rwtPenyAlergi,
        "rwtPenyAlergiDetail": rwtPenyAlergiDetail,
        "khusPemGigi1": khusPemGigi1,
        "khusPemGigi2": khusPemGigi2,
        "khusPemGigi3": khusPemGigi3,
        "khusPemGigi4": khusPemGigi4,
        "khusPemGigi5": khusPemGigi5,
        "khusPemGigi5Detail": khusPemGigi5Detail,
      };

  @override
  List<Object?> get props => [
        keluhUtama,
        jenisPelayanan,
        rwtSekarang,
        rwtDulu,
        rwtObat,
        rwtPenyKeluarga,
        rwtPenyAlergi,
        rwtPenyAlergiDetail,
        khusPemGigi1,
        khusPemGigi2,
        khusPemGigi3,
        khusPemGigi4,
        khusPemGigi5,
        khusPemGigi5Detail
      ];
}
