import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:intl/intl.dart';

String iconAssets = "assets/icons/";
String imageAssets = "assets/images/";
String odonAssets = "assets/odon/";
String animateAssets = "assets/animation/";
String svgAssets = "assets/svg/";
String soundAssets = "assets/sound/";
DateTime now = DateTime.now();

class AppConstant {
  static const AppSetup appSetup = AppSetup.rsTiara;
  // static const AppSetup appSetup = AppSetup.methodist;
  // static const AppSetup appSetup = AppSetup.rsVitaInSani;
  // static const AppSetup appSetup = AppSetup.rsHarapan;
  // static const AppSetup appSetup = AppSetup.batuRaja;
  static const String nameAPP = "Mobile RS Fatima";
  static const String csFatima = "Customer Services \nRS Fatima Ketapang";

  // Key Setting
  static const String localeKey = 'localeKey';
  static const String themeModeKey = 'themeModeKey';
  static const String onBoardingKEY = 'ONBOARDINGKEY';
  static const String tokenString = 'TOKENKEY';
  static const String absenString = 'ABSENSIKEY';
  static const String layananNONBPJSString = 'LayananNonBPJS';
  static const String antreanBPJSPref = 'ANTREANBPJSSTATUS';
  static const String pesertaBPJS = 'PESERTABPJS';
  static const String rujukanBPJS = 'RUJUKANBPJS';
  static const String bioMetrik = 'BIOMETRIKSTATUS';
  static const String identitasBayiImage =
      "${ApiDb.baseUrl}images/identitas-bayi/";

  // SOUND ASSETS
  static String successSound = "success.mp3";

  // LOTTIE ASSETS
  static String obatAnimate = "${animateAssets}obat_animate.json";
  static String moreAnimate = "${animateAssets}more_animate.json";
  static String searchAnimate = "${animateAssets}searching.json";
  static String loginAnimate = "${animateAssets}login_animation.json";
  static String alertAnimate = "${animateAssets}alert.json";
  static String alergiAnimate = "${animateAssets}alergi.json";
  static String makananAnimate = "${animateAssets}food_animate.json";
  static String createPasswordAnimate = "${animateAssets}create_password.json";
  static String securityOTP = "${animateAssets}security_otp.json";
  static String passwordAnimation = "${animateAssets}password.json";
  static String findAnimation = "${animateAssets}find_animate.json";
  static String appDevAnimation = "${animateAssets}app_dev.json";
  static String disconectAnimation = "${animateAssets}disconnect.json";
  static String failedAnimation = "${animateAssets}failed.json";
  static String kidsAnimation = "${animateAssets}kids.json";
  static String doctorPrescription = "${animateAssets}doctor-prescription.json";
  static String internetConnectionAnimation =
      "${animateAssets}internet-connection.json";

  // BPJS DECRIPT
  static const String constID = "20264";
  static const String constSECRET = "9uK1F0EC23";
  static String timeSTAMP =
      ((now.millisecondsSinceEpoch / 1000).round()).toString();
  static String userKEY = "71f592bfcb2a033787e5cde4164e2f47";

  // NOTE : APP ID SEMENTARA
  static const String appID = "com.app.absensisiswa";
  static const String androidLink =
      'https://play.google.com/store/apps/details?id=$appID';

  // ASSETS ANTREAN
  static String poliIcons = "${imageAssets}poli_icon.png";
  static String tanggalICON = "${imageAssets}tanggal_icon.png";
  static String dokterIMG = "${imageAssets}dokter_img.png";

  // SVG ASSETS
  static String addressSVG = "${svgAssets}address.svg";
  static String createPassword = "${svgAssets}password.svg";
  static String fingerPrint = "${svgAssets}finger_print.svg";
  static String happySvg = "${svgAssets}happy-2.svg";
  static String notFoundSVG = "${svgAssets}not_found.svg";
  static String badRequestSVG = "${svgAssets}bad_request.svg";
  static String noConnectionSVG = "${svgAssets}no_connection.svg";
  static String failedSVG = "${svgAssets}failed.svg";
  static String timeOutSVG = "${svgAssets}time_out.svg";
  static String tulangSVG = "${svgAssets}tulang.svg";
  static String medicalRecordSVG = "${svgAssets}medical_record.svg";
  static String obatSVG = "${svgAssets}obat.svg";
  static String updateSVG = "${svgAssets}update.svg";

  // Assest Constant
  static String bannerLogin = "${imageAssets}banner_login.png";

  // Assest Constant
  static String clockIcon = "${imageAssets}clock.png";
  static String avatarImg = "${imageAssets}avatar.png";
  static String cardImg = "${imageAssets}kartu.png";
  static String dokterIcon = "${imageAssets}dokter_icon.png";
  static String buildingIcon = "${imageAssets}building_icon.png";
  static String customerIcon = "${imageAssets}customer-service.png";
  static String bangsalIcon = "${imageAssets}bangsal.png";
  static String karyawanIcon = "${imageAssets}karyawan.png";
  static String absensiIcon = "${imageAssets}absensi.png";
  static String riwayatIcon = "${imageAssets}riwayat.png";
  static String inforamsiSatu = "${imageAssets}informasi_satu.png";
  static String dokterImages = "${imageAssets}dokter1.png";
  static String headerImages = "${imageAssets}header-image.png";
  static String avatarbox = "${imageAssets}avatarbox.png";
  static String mapImage = "${imageAssets}maps.png";
  static String updateImage = "${imageAssets}update.png";
  static String totalKamar = "${imageAssets}total_kamar.png";
  static String tersedia = "${imageAssets}tersedia.png";
  static String lastUpdate = "${imageAssets}last_update.png";
  static String hubungiBg = "${imageAssets}hubungi_bg.png";
  static String emtyData = "${imageAssets}emty_data.png";
  static String lainnya = "${imageAssets}lainnya.png";
  static String infoLoginBG = "${imageAssets}info_login_bg.png";
  static String anamnesiaPNG = "${imageAssets}anamnesia.png";
  static String anatomiPNG = "${imageAssets}anatomi.png";
  static String skriningPNG = "${imageAssets}search.png";
  static String odontogramPNG = "${imageAssets}odontogram.png";
  static String rawatJalan = "${imageAssets}patient.png";
  static String antomiMan = "${imageAssets}body-man.jpg";
  static String fisikPNG = "${imageAssets}fisik.png";
  static String fitalSignPNG = "${imageAssets}vital-sign.png";
  static String antomiManLand = "${imageAssets}body-man-landscape.png";
  static String antomiWomanLand = "${imageAssets}body-woman_landscape.png";
  static String diaknosaKerjaPNG = "${imageAssets}kerja.png";
  static String diferensialPNG = "${imageAssets}diferesial.png";
  static String actionPNG = "${imageAssets}action.png";
  static String monitoringPNG = "${imageAssets}monitoring.png";
  static String educationPNG = "${imageAssets}education.png";
  static String skriningImages = "${imageAssets}skrining_images.png";
  static String qrCodeCenterImages = "${imageAssets}qrcode_center.png";
  static String nurseImages = "${imageAssets}nurse.png";
  static String perawatImages = "${imageAssets}perawat_images.png";
  static String dokterBgImages = "${imageAssets}dokter_images.png";
  static String educationImages = "${imageAssets}education-images.png";
  static String nonVitalImages = "${imageAssets}non-vital.png";
  static String anamnesaImages = "${imageAssets}anamnesia_bg.png";
  static String anatomiImages = "${imageAssets}anatomi_images.png";
  static String pemeriksaanFisikImages = "${imageAssets}pemeriksaan_fisik.png";
  static String vitalSignImages = "${imageAssets}vita_sign_images.png";
  static String diagnosisImages = "${imageAssets}diagnosis.png";
  static String planImages = "${imageAssets}planImages.png";

  // ODONTOGRAM
  static String odon1 = "${odonAssets}01.png";

  // Assest Constant
  static String iconAPp = "${iconAssets}logo.png";
  static String bgSplash = "${imageAssets}bg_splash.png";
  static String bgSplashScreen = "${imageAssets}splash_screen_bg.png";
  static String iconPptsb = "${imageAssets}icon_pptsb.png";

  static double appVersion = (Platform.isAndroid) ? 1.1 : 1.1;
  static String noConnectionImage = "${imageAssets}connection-pana.png";

  // Assets Images
  static String emtyImages = "${imageAssets}emty_images.png";
  static String logoAppSplash = "${imageAssets}logo_app_splash.png";
  static String logoApp = "${imageAssets}logo_apps.png";
  static String splashScreenImage = "${imageAssets}splash_screen.png";
  static String bgOnboading1 = "${imageAssets}01.png";
  static String bgOnboading2 = "${imageAssets}02.png";
  static String bgOnboading3 = "${imageAssets}03.png";
  static String imageDefault = "${imageAssets}image_default.png";

  // Date Constant
  static DateFormat dateFormat = DateFormat.yMd();
  static DateTime initialDate = DateTime(1997);
  static DateTime firstDate = DateTime(1900);
  static DateTime lastDate = DateTime(2022);

  // Icons
  static String iconsLogo = "${imageAssets}app_logo.png";
  static String erorrImage = "${imageAssets}404_images.png";

  static String generate({required String salt, required String keyValue}) {
    var bytes = utf8.encode(keyValue);
    String value = base64.encode(bytes);
    String base64Key = value;

    List<int> messageBytes = utf8.encode(salt);
    List<int> key = base64.decode(base64Key);
    Hmac hmac = Hmac(sha256, key);
    Digest digest = hmac.convert(messageBytes);

    String base64Mac = base64.encode(digest.bytes);
    log(base64Mac);
    return base64Mac;
  }
}
