class AppConfigVitaInsani {
  static String appName = "Rumah Sakit Vita Insani";
  static String alamat =
      "Jl. Merdeka No. 329 Pematangsiantar\nTel.(0622)24521\nwww.vitainsani.com";
  static String logo = "assets/images/vita_logo.png";
  static String appLogo = "assets/images/app_logo.png";
  static String qrCode = "assets/images/qrcode_vita.png";
  static String apotik = "Farmasi RS Vita Insani";
}

class AppConfigMethodist {
  static String appName = "Rumah Sakit Methodist";
  static String alamat =
      "Jl. M.H Thamrin No.105, Medan\nTelp (061)-7369000\nEmail : rsmethodist@nusa.net.id\n     rsmethodistmedan@gmail.com";
  static String logo = "assets/images/methodis_logo_satu.png";
  static String appLogo = "assets/images/methodist_logo.png";
  static String qrCode = "assets/images/qrcode_methodist.png";
  static String apotik = "Farmasi RS Methodist";
}

class AppConfigBatuRaja {
  static String appName = "Rumah Sakit Santo Antonio";
  static String alamat =
      "Jln. Garuda No.3, Km.3, Ds. Tanjung Baru\nKec. Baturaja Timur 32113 – OKU \nSUMATERA SELATAN";
  static String logo = "assets/images/logo_baturaja.png";
  static String appLogo = "assets/images/baturaja_logo.png";
  static String qrCode = "assets/images/qrcode_baturaja.png";
  static String apotik = "Farmasi RS Batu Raja";
}

class AppConfigVincentCore {
  static String appName = "Vincentcore";
  static String alamat =
      "Jl. Farel Pasaribu Gg. Jambu Mente 32, \nPematangsiantar,Indonesia";
  static String logo = "assets/images/vincent_logo.png";
  static String appLogo = "assets/images/vincent_logo.png";
  static String qrCode = "assets/images/qrcode_center.png";
  static String apotik = "Farmasi RS Vincent Core";
}

class AppConfigHarapan {
  static String appName = "Rumah Sakit Harapan";
  static String alamat =
      "Jl. Farel Pasaribu No. 21 Pematang Siantar\nTelp.(0622) 21162/21612; Fax. (0622) 435301\nEmail:rsh@rsharapansiantar.com Website : www.rsharapan.com";
  static String logo = "assets/images/harapan_logo.png";
  static String appLogo = "assets/images/app_logo_dua.png";
  static String qrCode = "assets/images/qrcode_center.png";
  static String apotik = "Farmasi RS Harapan";
}

class AppConfigTiara {
  static String appName = "RS. TIARA KASIH SEJATI";
  static String alamat =
      "Jl. Menambin No. 4 Timbang Galung\nTelp. (0622) 27617 Fax (0622)432255\nPematangsiantar 21116";
  static String logo = "assets/images/logo_tiara.png";
  static String appLogo = "assets/images/app_logo_tiara.png";
  static String qrCode = "assets/images/qrcode_tiara.png";
  static String dotLogo = "assets/images/dot_logo.png";
  static String apotik = "Farmasi RS Tiara";
}

// ==== //
enum AppSetup {
  rsHarapan,
  rsVitaInSani,
  vincentCore,
  methodist,
  batuRaja,
  rsTiara
}

class SetApp {
  static String namaApotik({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.apotik;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.apotik;
      case AppSetup.methodist:
        return AppConfigMethodist.apotik;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.apotik;
      case AppSetup.rsTiara:
        return AppConfigTiara.apotik;
      default:
        return AppConfigVitaInsani.apotik;
    }
  }

  static String appLogo({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.appLogo;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.appLogo;
      case AppSetup.methodist:
        return AppConfigMethodist.appLogo;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.appLogo;
      case AppSetup.rsTiara:
        return AppConfigTiara.appLogo;
      default:
        return AppConfigVitaInsani.appLogo;
    }
  }

  static String qrCodw({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.qrCode;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.qrCode;
      case AppSetup.methodist:
        return AppConfigMethodist.qrCode;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.qrCode;
      case AppSetup.rsTiara:
        return AppConfigTiara.qrCode;
      default:
        return AppConfigVitaInsani.qrCode;
    }
  }

  static String nameApp({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.appName;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.appName;
      case AppSetup.methodist:
        return AppConfigMethodist.appName;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.appName;
      case AppSetup.rsTiara:
        return AppConfigTiara.appName;
      default:
        return AppConfigVitaInsani.appName;
    }
  }

  static String alamatApp({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.alamat;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.alamat;
      case AppSetup.methodist:
        return AppConfigMethodist.alamat;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.alamat;
      case AppSetup.rsTiara:
        return AppConfigTiara.alamat;
      default:
        return AppConfigVitaInsani.alamat;
    }
  }

  static String logoApp({required AppSetup appSetup}) {
    switch (appSetup) {
      case AppSetup.rsHarapan:
        return AppConfigHarapan.logo;
      case AppSetup.vincentCore:
        return AppConfigVincentCore.logo;
      case AppSetup.methodist:
        return AppConfigMethodist.logo;
      case AppSetup.batuRaja:
        return AppConfigBatuRaja.logo;
      case AppSetup.rsTiara:
        return AppConfigTiara.logo;
      default:
        return AppConfigVitaInsani.logo;
    }
  }
}
