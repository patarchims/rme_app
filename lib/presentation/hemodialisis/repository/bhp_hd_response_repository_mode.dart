// ignore_for_file: public_member_api_docs, sort_constructors_first
class BhpHaemodalisaModel {
  final String insertDttm;
  final String insertPc;
  final String userId;
  final String ketPerson;
  final String kdBagian;
  final String dpjp;
  final String noreg;
  final bool item1A;
  final bool item1B;
  final bool item1C;
  final bool item2A;
  final bool item2B;
  final bool item3;
  final bool item4;
  final bool item5;
  final bool item6;

  BhpHaemodalisaModel({
    required this.insertDttm,
    required this.insertPc,
    required this.userId,
    required this.ketPerson,
    required this.kdBagian,
    required this.dpjp,
    required this.noreg,
    required this.item1A,
    required this.item1B,
    required this.item1C,
    required this.item2A,
    required this.item2B,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.item6,
  });

  factory BhpHaemodalisaModel.fromJson(Map<String, dynamic> json) =>
      BhpHaemodalisaModel(
        insertDttm: json["insert_dttm"],
        insertPc: json["insert_pc"],
        userId: json["user_id"],
        ketPerson: json["ket_person"],
        kdBagian: json["kd_bagian"],
        dpjp: json["dpjp"],
        noreg: json["noreg"],
        item1A: json["item_1a"],
        item1B: json["item_1b"],
        item1C: json["item_1c"],
        item2A: json["item_2a"],
        item2B: json["item_2b"],
        item3: json["item_3"],
        item4: json["item_4"],
        item5: json["item_5"],
        item6: json["item_6"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "insert_pc": insertPc,
        "user_id": userId,
        "ket_person": ketPerson,
        "kd_bagian": kdBagian,
        "dpjp": dpjp,
        "noreg": noreg,
        "item_1a": item1A,
        "item_1b": item1B,
        "item_1c": item1C,
        "item_2a": item2A,
        "item_2b": item2B,
        "item_3": item3,
        "item_4": item4,
        "item_5": item5,
        "item_6": item6,
      };

  BhpHaemodalisaModel copyWith({
    String? insertDttm,
    String? insertPc,
    String? userId,
    String? ketPerson,
    String? kdBagian,
    String? dpjp,
    String? noreg,
    bool? item1A,
    bool? item1B,
    bool? item1C,
    bool? item2A,
    bool? item2B,
    bool? item3,
    bool? item4,
    bool? item5,
    bool? item6,
  }) {
    return BhpHaemodalisaModel(
      insertDttm: insertDttm ?? this.insertDttm,
      insertPc: insertPc ?? this.insertPc,
      userId: userId ?? this.userId,
      ketPerson: ketPerson ?? this.ketPerson,
      kdBagian: kdBagian ?? this.kdBagian,
      dpjp: dpjp ?? this.dpjp,
      noreg: noreg ?? this.noreg,
      item1A: item1A ?? this.item1A,
      item1B: item1B ?? this.item1B,
      item1C: item1C ?? this.item1C,
      item2A: item2A ?? this.item2A,
      item2B: item2B ?? this.item2B,
      item3: item3 ?? this.item3,
      item4: item4 ?? this.item4,
      item5: item5 ?? this.item5,
      item6: item6 ?? this.item6,
    );
  }
}
