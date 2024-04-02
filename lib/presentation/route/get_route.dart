import 'package:get/get.dart';
import 'package:hms_app/presentation/pages/asesmen/asesmen_pasien_page_widget.dart';
import 'package:hms_app/presentation/pages/home/home_page.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/keluaran_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/masalah_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/penmedik_fisioterapi_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/penmedik_gizi_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/penmedik_lab_widget.dart';
import 'package:hms_app/presentation/pages/igd/widget/penmedik_radiologi_widget.dart';
import 'package:hms_app/presentation/pages/pasien/detail_pasien_page.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_pasien_page.dart';
import 'package:hms_app/presentation/pages/widget/dpjp_page.dart';
import 'package:hms_app/presentation/screens/create_new_user_screen_v2.dart';
import 'package:hms_app/presentation/screens/create_user_screen.dart';
import 'package:hms_app/presentation/screens/disconect_screen.dart';
import 'package:hms_app/presentation/screens/login_screen.dart';
import 'package:hms_app/presentation/screens/onboarding_screen.dart';
import 'package:hms_app/presentation/screens/splash_screen.dart';
import 'package:hms_app/presentation/screens/validate_user_screen.dart';

class GetRoutes {
  // NAME OF ROUTE
  static const String root = '/';
  static const String login = '/login';
  static const String onBoardingPage = '/onboarding_page';
  static const String updateNowPage = '/update_now_page';
  static const String timeOutPage = '/time_out_page';
  static const String homePage = '/home_page';
  static const String splashPage = '/splash_page';
  static const String riwayatPasienPage = '/riwayat_pasien_page';
  static const String detailPasienPage = '/detail_pasien_page';
  static const String createUserPage = '/create_user_page';
  static const String disconectScreen = '/disconect_screen';
  static const String validationUserPage = '/validation_user_screen';
  static const String dpjpPage = '/dpjpPage';
  static const String penmedLabPage = '/penmedLabPage';
  static const String penmedRadiologiPage = '/penmedRadiologiPage';
  static const String penmedFisioterapiPage = '/penmedFisioterapiPage';
  static const String penmedGiziPage = '/penmedGiziPage';
  static const String masalahKeperawatanPage = '/masalahKeperawatanPage';
  static const String intervensiKeperawatanPage = '/intervensiKeperawatanPage';
  static const String createNewUserV2Page = '/createNewUserV2Page';
  static const String cariSDKI = '/sdki/';
  static const String asesmenPasienPage = '/asesmen_pasien_page';

  // LIST GET PAGES
  static final getPages = [
    // ===============================
    GetPage(
        transition: Transition.downToUp,
        name: createNewUserV2Page,
        page: () => const CreateNewUserV2()),

    GetPage(
        transition: Transition.downToUp,
        name: asesmenPasienPage,
        page: () => const AsesmenPasienPageWidget()),

    // ====
    GetPage(
        transition: Transition.leftToRight,
        name: dpjpPage,
        page: () => const DpjpWidgetPage()),
    // ====

    GetPage(
        transition: Transition.downToUp,
        name: intervensiKeperawatanPage,
        page: () => const IntervensiKeperawatanPage()),

    // ====
    GetPage(
        transition: Transition.downToUp,
        name: masalahKeperawatanPage,
        page: () => const MasalahKeperawatanWidget()),

    // ====
    GetPage(
        transition: Transition.downToUp,
        name: penmedGiziPage,
        page: () => const PenmedikGiziWidget()),
    GetPage(
        transition: Transition.downToUp,
        name: penmedRadiologiPage,
        page: () => const PemedikRadiologiWidget()),
    GetPage(
        transition: Transition.downToUp,
        name: penmedFisioterapiPage,
        page: () => const PenmedikFisioTerapiWidget()),
    // ==========
    GetPage(
        transition: Transition.downToUp,
        name: penmedLabPage,
        page: () => const PenmedikLaborWidget()),

    GetPage(name: root, page: () => const SplashScreenPage()),
    GetPage(name: root, page: () => const SplashScreenPage()),
    GetPage(name: splashPage, page: () => const SplashScreenPage()),
    GetPage(name: onBoardingPage, page: () => const OnboardingPage()),
    GetPage(
        name: disconectScreen,
        transition: Transition.downToUp,
        page: () => const DisconetScreen()),

    GetPage(
        name: homePage,
        transition: Transition.leftToRightWithFade,
        page: () => const HomePage()),

    GetPage(
        name: riwayatPasienPage,
        transition: Transition.downToUp,
        page: () => const RiwayatPasienPage()),

    GetPage(
        name: detailPasienPage,
        transition: Transition.rightToLeft,
        page: () => const DetailPasienPage()),

    // ==== USER : CREATE USER PAGE
    GetPage(
        name: createUserPage,
        transition: Transition.downToUp,
        page: () => const CreateUserPage()),

    // ==== USER : VALIDATION USER SCREEN
    GetPage(
        name: validationUserPage,
        transition: Transition.downToUp,
        page: () => const ValidateUserPage()),

    // ==== USER : Login User
    GetPage(
        name: login,
        transition: Transition.downToUp,
        page: () => const LoginPage()),
  ];
}
