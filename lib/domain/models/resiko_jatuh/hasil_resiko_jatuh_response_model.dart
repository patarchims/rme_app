class HasilResikoJatuhResponseModel {
  bool isShow;
  String hasil;
  String tindakan;

  HasilResikoJatuhResponseModel({
    required this.isShow,
    required this.hasil,
    required this.tindakan,
  });

  factory HasilResikoJatuhResponseModel.fromJson(Map<String, dynamic> json) =>
      HasilResikoJatuhResponseModel(
        isShow: json["is_show"],
        hasil: json["hasil"],
        tindakan: json["tindakan"],
      );

  Map<String, dynamic> toJson() => {
        "is_show": isShow,
        "hasil": hasil,
        "tindakan": tindakan,
      };
}
