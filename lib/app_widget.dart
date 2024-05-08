import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/anamnesa/anamnesa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/deskripsi_luaran_slki/deskripsi_luaran_slki_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/selection_siki/selection_siki_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/informasi_medis/informasi_medis_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/asesment_anamnesa/asesment_anamnesa_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/data_medik/data_medik_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/intra_oral/intra_oral_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/odontogram/odontogram_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/penunjang_medik/penunjang_medik_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/deteksi_resiko_jatuh/deteksi_resiko_jatuh_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/reassesmen_resiko_jatuh/reassesmen_resiko_jatuh_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_anak/resiko_jatuh_anak_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_dewasa/resiko_jatuh_dewasa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_intervensi/resiko_jatuh_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/presentation/component/theme/themes.dart';
import 'package:hms_app/presentation/hemodialisis/bloc/bhp/bhp_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_intensive/asesmen_intensive_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_nyeri/asesmen_nyeri_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/nyeri_anak/asesmen_nyeri_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_anak/pengkajian_awal_anak_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_nutrisi_anak/pengkajian_nutrisi_anak_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/vital_sign_bloc_anak/vital_sign_anak_bloc_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/asesmen_nyeri_icu/asesmen_nyeri_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/report_icu/report_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/riwayat_keperawaan/riwayat_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/icu/bloc/vital_sign_icu/vital_sign_icu_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/diagnosa_kebidanan/diagnosa_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/keluhan_utama_kebidanan/keluhan_utama_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_kebidanan/pengkajian_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_nutrisi/pengkajian_nutrisi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_persistem/pengkajian_persistem_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/resiko_jatuh_kebidanan/resiko_jatuh_kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_persistem_keperawatan/pengkajian_persistem_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/tanda_vital_keperawatan/tanda_vital_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/diagnosa_banding/diagnosa_banding_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/keluhan_utama/keluhan_utama_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/resep/resep_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/tanda_vital_igd_dokter/tanda_vital_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/apgar_score/apgar_score_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/down_socre_nonatus/down_score_neonatus_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/pemeriksaan_fisik_perina/pemeriksaan_fisik_perina_bloc.dart';
import 'package:hms_app/presentation/perina/bloc/report_asesmen_bayi/report_asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/report/bloc/asesmen_medis_igd_dokter/asesmen_medis_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/bloc/pengkajian_awal_kebidanan_report/pengkajian_kebidanan_awal_kebidanan_bloc.dart';
import 'package:hms_app/presentation/report/bloc/report_igd/report_igd_bloc.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';
import 'domain/bloc/dashboard/rawat_jalan/rawat_jalan_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ResepBloc()..add(OnGetResepObatEvent())),
        BlocProvider(
            create: (_) => ReportPengkajianKebidananAwalKebidananBloc()),
        BlocProvider(create: (_) => AsesmenNyeriIcuBloc()),
        BlocProvider(create: (_) => AsesmenIntensiveBloc()),
        BlocProvider(create: (_) => AsesmenNyeriAnakBloc()),
        BlocProvider(create: (_) => PengkajianAwalAnakKeperawatanBloc()),
        BlocProvider(create: (_) => VitalSignIcuBloc()),
        BlocProvider(create: (_) => PengkajianNutrisiAnakBloc()),
        BlocProvider(create: (_) => VitalSignAnakBlocBloc()),
        BlocProvider(create: (_) => PemeriksaanFisikIcuBloc()),
        BlocProvider(create: (_) => RiwayatKeperawatanBloc()),
        BlocProvider(create: (_) => ReportIcuBloc()),
        BlocProvider(create: (_) => EarlyWarningSystemBloc()),
        BlocProvider(create: (_) => ReportIgdBloc()),
        BlocProvider(create: (_) => IndentiasBayiBloc()),
        BlocProvider(create: (_) => AsesmenNyeriBloc()),
        BlocProvider(create: (_) => ReportAsesmenBayiBloc()),
        BlocProvider(create: (_) => AnalisaBloc()),
        BlocProvider(create: (_) => ApgarScoreBloc()),
        BlocProvider(create: (_) => DownScoreNeonatusBloc()),
        BlocProvider(create: (_) => PemeriksaanFisikPerinaBloc()),
        BlocProvider(create: (_) => AsesmenBayiBloc()),
        BlocProvider(create: (_) => TriaseIgdDokterBloc()),
        BlocProvider(create: (_) => PengkajianKebidananBloc()),
        BlocProvider(create: (_) => PengkajianPersistemKeperawatanBloc()),
        BlocProvider(create: (_) => CpptSbarBangsalBloc()),
        BlocProvider(create: (_) => DiagnosaBandingBloc()),
        BlocProvider(create: (_) => PengkajianPersistemBloc()),
        BlocProvider(create: (_) => ReportAsesmenMedisIgdDokterBloc()),
        BlocProvider(create: (_) => KeluhanUtamaKebidananBloc()),
        BlocProvider(create: (_) => PengkajianAwalKeperawatanBloc()),
        BlocProvider(create: (_) => TandaVitalKeperawatanBloc()),
        BlocProvider(create: (_) => PemeriksaanFisikIgdBloc()),
        BlocProvider(create: (_) => TandaVitalIgdDokterBloc()),
        BlocProvider(create: (_) => KeluhanUtamaBloc()),
        BlocProvider(create: (_) => PengkajianNutrisiBloc()),
        BlocProvider(create: (_) => DiagnosaKebidananBloc()),
        BlocProvider(create: (_) => ResikoJatuhKebidananBloc()),
        BlocProvider(create: (_) => ResikoJatuhReportBloc()),
        BlocProvider(create: (_) => KebidananBloc()),
        BlocProvider(create: (_) => BhpBloc()),
        BlocProvider(create: (_) => getIt<ThemeBloc>()),
        BlocProvider(create: (_) => DeskripsiLuaranSlkiBloc()),
        BlocProvider(create: (_) => ReportBloc()),
        BlocProvider(
            create: (_) => getIt<AsesmenKeperawatanBidanBloc>()
              ..add(const AsesmenKeperawatanBidanEvent.started())),
        BlocProvider(create: (_) => getIt<SignInFormBloc>()),
        BlocProvider(
            create: (_) => getIt<ReassesmenResikoJatuhBloc>()
              ..add(OnGetReAsesmenResikoJatuh())),
        BlocProvider(
            create: (_) =>
                getIt<ResikoJatuhBloc>()..add(OnGetIntervensiResiko())),
        BlocProvider(create: (_) => DeteksiResikoJatuhBloc()),
        BlocProvider(create: (_) => InputDiagnosaBloc()),
        BlocProvider(create: (_) => AlergiBloc()),
        BlocProvider(
            create: (_) => getIt<ResikoJatuhDewasaBloc>()
              ..add(OnGetIntervensiResikoDewasa())),
        BlocProvider(
            create: (_) =>
                getIt<ResikoJatuhAnakBloc>()..add(OnGetResikoJatuhAnak())),
        BlocProvider(create: (_) => getIt<TriaseBloc>()),
        BlocProvider(create: (_) => AnamnesaBloc()),
        BlocProvider(create: (_) => HasilAsuhanKeperawatanBloc()),
        BlocProvider(create: (_) => getIt<RawatJalanBloc>()),
        BlocProvider(create: (_) => getIt<InformasiMedisBloc>()),
        BlocProvider(create: (_) => AsesmentAnamnesaBloc()),
        BlocProvider(create: (_) => getIt<OdontogramBloc>()),
        BlocProvider(create: (_) => getIt<IntraOralBloc>()),
        BlocProvider(create: (_) => getIt<RincianInformasiBloc>()),
        BlocProvider(
            create: (_) =>
                getIt<AsesmenIgdBloc>()..add(const AsesmenIgdEvent.started())),
        BlocProvider(create: (_) => PenunjangMedikBloc()),
        BlocProvider(create: (_) => getIt<AsesmenDokterBloc>()),
        BlocProvider(create: (_) => DataMedikBloc()),
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<CpptBloc>()),
        BlocProvider(create: (_) => getIt<HasilPenunjangBloc>()),
        BlocProvider(create: (_) => getIt<PemeriksaanFisikBloc>()),
        BlocProvider(create: (_) => SelectionSikiBloc()),
        BlocProvider(
            create: (_) =>
                getIt<PasienBloc>()..add(const PasienEvent.getKVitalSign())),
        BlocProvider(
            create: (_) => getIt<AppBloc>()..add(const AppEvent.started())),
        BlocProvider(create: (_) => getIt<ContentManagerBloc>()),
        BlocProvider(
            create: (_) => getIt<CreateUserBloc>()
              ..add(const CreateUserEvent.getKpelayanan())),
      ],

      child: Sizer(
        builder: (ctx, orientation, deviceType) {
          return GetMaterialApp(
            theme: BootstrapTheme.of(ctx).toTheme(
              theme: ThemeData(
                scaffoldBackgroundColor: BootstrapTheme.of(ctx).colors.white,
                appBarTheme: AppBarTheme(
                  backgroundColor: BootstrapTheme.of(ctx).colors.primary,
                  foregroundColor: BootstrapTheme.of(ctx).colors.white,
                  elevation: 0.0,
                ),
                scrollbarTheme: const ScrollbarThemeData(
                  radius: Radius.circular(4.0),
                  crossAxisMargin: 4.0,
                  mainAxisMargin: 4.0,
                  minThumbLength: 40.0,
                  interactive: true,
                ),
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'HOSPITAL MANAGEMENT SYSTEM',
            darkTheme: Themes.dark,
            initialRoute: GetRoutes.root,
            getPages: GetRoutes.getPages,
          );
        },
      ),
      // child: ThemeBuilder(
      //   builder: (themeMode) => Sizer(
      //     builder: (ctx, orientation, deviceType) {
      //       return GetMaterialApp(
      //         theme: BootstrapTheme.of(ctx).toTheme(
      //           theme: ThemeData(
      //             scaffoldBackgroundColor: BootstrapTheme.of(ctx).colors.white,
      //             appBarTheme: AppBarTheme(
      //               backgroundColor: BootstrapTheme.of(ctx).colors.primary,
      //               foregroundColor: BootstrapTheme.of(ctx).colors.white,
      //               elevation: 0.0,
      //             ),
      //             scrollbarTheme: const ScrollbarThemeData(
      //               radius: Radius.circular(4.0),
      //               crossAxisMargin: 4.0,
      //               mainAxisMargin: 4.0,
      //               minThumbLength: 40.0,
      //               interactive: true,
      //             ),
      //             fontFamily: GoogleFonts.roboto().fontFamily,
      //           ),
      //         ),
      //         builder: EasyLoading.init(),
      //         debugShowCheckedModeBanner: false,
      //         title: 'HOSPITAL MANAGEMENT SYSTEM',
      //         themeMode: themeMode,
      //         darkTheme: Themes.dark,
      //         initialRoute: GetRoutes.root,
      //         getPages: GetRoutes.getPages,
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
