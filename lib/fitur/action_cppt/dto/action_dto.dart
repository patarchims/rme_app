abstract class ActionDTO {
  static Map<String, dynamic> onSaveActionCPPT({
    required String noAskep,
    required String deskripsi,
  }) {
    return {
      "no_askep": noAskep,
      "deskripsi": deskripsi,
    };
  }

  static Map<String, dynamic> onSaveActionKeperawatan({
    required String noAskep,
    required String deskripsi,
  }) {
    return {
      "no_daskep": noAskep,
      "deskripsi": deskripsi,
    };
  }

  static Map<String, dynamic> onGetTindakan({
    required String noAskep,
  }) {
    return {
      "no_askep": noAskep,
    };
  }
}
