import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/penunjang_medik/penunjang_medik_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/hemodialisis/asesmen_keperawatan/asesmen_keperawatan_hemodilisa_content_widget.dart';
import 'package:hms_app/presentation/hemodialisis/bloc/bhp/bhp_bloc.dart';
import 'package:hms_app/presentation/hemodialisis/presentation/formulir_asuhan_keperawatan_hd_widget_page.dart';
import 'package:hms_app/presentation/hemodialisis/presentation/formulir_pencatatan_bhp_widget_page.dart';
import 'package:hms_app/presentation/hemodialisis/presentation/implementasi_keperawatan_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/ews_system/ews_system_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kontrol_pasien/kontrol_pasine_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/intervensi_risiko_jatuh_bidan_content_widget_page.dart';
import 'package:hms_app/presentation/pages/icu/page/asesmen/assesmen_intensive_view_page_widget.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:hms_app/presentation/kebidanan/bloc/keluhan_utama_kebidanan/keluhan_utama_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/analisa_data/analisa_data_kebidanan_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/assessmen_kebidanan_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/edukasi/edukasi_terintegrasi_pasien_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/medis/cppt_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asesmen_awal_keperawatan_bangsal_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/asuhan_keperawatan_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/resiko_jatuh/intervensi_risiko_jatuh_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_alergi/riwayat_alergi_widget_content.dart';
import 'package:hms_app/presentation/pages/bedah_plastik/cppt/cppt_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/keluhan_utama/keluhan_utama_bloc.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/asesmen/asesmen_awal_igd_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/asesmen/triase_igd_dokter_widget.dart';
import 'package:hms_app/presentation/pages/igd/perawat/asesmen_awal_perawat_igd.dart';
import 'package:hms_app/presentation/pages/modul/hasil_penunjang/hasil_penunjang_content_widget_old_db.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_dokter/asesmen_dokter_widget_content.dart';
import 'package:hms_app/presentation/pages/poli_dalam/asesmen_medis_keperawatan/asesmen_medis_keperawatan_widget_content.dart';
import 'package:hms_app/presentation/pages/poli_gigi/asesment_medis_gigi.dart';
import 'package:hms_app/presentation/pages/poli_gigi/hasil_penunjang_medik/hasil_penunjang_medik.dart';
import 'package:hms_app/presentation/pages/poli_gigi/observasi_antastesi_lokal/observasi_anastesi_lokal_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/perawat/assessment_kebutuhan_edukasi_gigi_page.dart';
import 'package:hms_app/presentation/pages/poli_gigi/perawat/assessment_rawat_jalan_perawat_page.dart';
import 'package:hms_app/presentation/pages/poli_gigi/perawat/skrining_pasien_page.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/pages/asesmen_bayi_perina_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen_medis_bayi_perina_page.dart';
import 'package:hms_app/presentation/perina/pages/report/view_report_icu_page.dart';
import 'package:hms_app/presentation/perina/pages/report/view_report_keperawatan_perina_page_widget.dart';
import 'package:hms_app/presentation/report/bloc/pengkajian_awal_kebidanan_report/pengkajian_kebidanan_awal_kebidanan_bloc.dart';
import 'package:hms_app/presentation/report/bloc/resiko_jatuh/resiko_jatuh_bloc.dart';
import 'package:hms_app/presentation/report/igd/formulir_igd_content_widget.dart';
import 'package:hms_app/presentation/report/view/bangsal/formulir_keperawatan_content_widget.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_hasil_resiko_jatuh_widget.dart';
import 'package:hms_app/presentation/report/view/bangsal/report_kebidanan_content_widget.dart';
import 'package:hms_app/presentation/report/igd/report_formulir_igd_content_widget.dart';
import 'package:hms_app/presentation/report/view/hemodialisis/report_formulir_asesmen_keperawatan_widget_page.dart';
import 'package:hms_app/presentation/report/view/hemodialisis/report_formulir_hemodialisis_widget_content.dart';
import 'package:hms_app/presentation/report/view/hemodialisis/report_formulir_pemberian_informasi_pasien_hemodialisis_content_widget.dart';
import 'package:hms_app/presentation/report/view/hemodialisis/report_formulir_pencatatan_bhp_page.dart';
import 'package:hms_app/presentation/widget/pengembangan_widget.dart';
import '../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';

enum Poliklinik {
  gigi,
  mata,
  jantung,
  igd,
  dalam,
  bedahPlastik,
  ponek,
  bangsal,
  bidan,
  penMedik,
  perina,
  icu,
}

class MenuAsesmen {
  // ======================= MENU LAPORAN ======================== //
  static List<String> laporan(
      {required Poliklinik poliklinik, required Person person}) {
    //==//
    if (poliklinik == Poliklinik.igd && person == Person.dokter) {
      return [
        "Hasil Penunjang Medik",
        "Formulir IGD",
      ];
    }

    if (poliklinik == Poliklinik.perina && person == Person.dokter) {
      return [
        "Hasil Penunjang Medik",
        "Formulir Bayi",
      ];
    }

    if (poliklinik == Poliklinik.perina && person == Person.perawat) {
      return [
        "Hasil Penunjang Medik",
        "Hasil Resiko Jatuh",
        "Formulir Bayi",
      ];
    }

    if (poliklinik == Poliklinik.igd && person == Person.perawat) {
      return ["Penunjang Medik", "Formulir IGD", "Formulir Keperawatan"];
    }

    if (poliklinik == Poliklinik.ponek && person == Person.perawat) {
      return ["Penunjang Medik", "Formulir IGD", "Formulir Keperawatan"];
    }

    if (poliklinik == Poliklinik.bangsal && person == Person.perawat) {
      return [
        "Penunjang Medik",
        "Formulir IGD",
        "Hasil Resiko Jatuh",
        "Formulir Keperawatan"
      ];
    }

    if (poliklinik == Poliklinik.icu && person == Person.perawat) {
      return [
        "Penunjang Medik",
        "Formulir IGD",
        "Hasil Resiko Jatuh",
        "Formulir Keperawatan",
        "Formulir Perawatan Intensive"
      ];
    }

    if (poliklinik == Poliklinik.bidan && person == Person.perawat) {
      return [
        "Penunjang Medik",
        "Hasil Resiko Jatuh",
        "Formulir Keperawatan",
        "Formulir Kebidanan",
      ];
    }

    if (poliklinik == Poliklinik.bangsal && person == Person.dokter) {
      return ["Penunjang Medik", "Formulir IGD", "Formulir Keperawatan"];
    }

    if (poliklinik == Poliklinik.penMedik && person == Person.perawat) {
      return [
        "Penunjang Medik",
        "Formulir Asesmen Keperawatan",
        "Pencatatan BHP (Re-Use) Dializer",
        "Pemberian Informasi",
        "Persetujuan Tindakan Kedokteran"
      ];
    }

    if (poliklinik == Poliklinik.bidan && person == Person.dokter) {
      return [
        "Hasil Penunjang Medik",
        "Formulir IGD",
      ];
    }

    return [];
  }

  static List<String> medis(
      {required Poliklinik poliklinik, required Person person}) {
    if (poliklinik == Poliklinik.dalam && person == Person.dokter) {
      return [
        "Asesmen Medis Keperawatan",
        "Asesmen Dokter",
      ];
    }

    if (poliklinik == Poliklinik.perina && person == Person.perawat) {
      return [
        "CPPT",
        "Asesmen Bayi",
        "Resiko Jatuh",
        "Riwayat Alergi",
        "Asuhan Keperawatan",
        "Edukasi Terintegrasi",
        "Analisa Data",
        "Kontrol Pasien"
      ];
    }

    if (poliklinik == Poliklinik.perina && person == Person.dokter) {
      return [
        "CPPT",
        "Asesmen Medis",
        "Riwayat Alergi",
      ];
    }

    //====================== PENMEDIK PERAWAT ============================//
    if (poliklinik == Poliklinik.penMedik && person == Person.perawat) {
      return [
        "Asesmen Keperawatan",
        "Asuhan Keperawatan",
        "Catatan Medik",
        "Implementasi Keperawatan",
        "Pencatatan BHP",
      ];
    }

    if (poliklinik == Poliklinik.bedahPlastik && person == Person.dokter) {
      return [
        "Formulir Rekam Medis",
        "CPPT",
        "Informed Consent",
        "Ringkasan Pulang",
      ];
    }

    //  ================================== POLI KLINIK GIGI
    if (poliklinik == Poliklinik.gigi && person == Person.dokter) {
      return ["Asesmen Medis", "Observasi Anastesi Lokal", "CPPT"];
    }

    if (poliklinik == Poliklinik.gigi ||
        poliklinik == Poliklinik.mata && (person == Person.perawat)) {
      return [
        "Skrining Pasien",
        "Asesmen Awal Keperawatan",
        "Asesmen Kebutuhan Edukasi",
        "CPPT",
      ];
    }

    // ================================== IGD FOR DOKTER
    if (poliklinik == Poliklinik.igd && person == Person.dokter) {
      return [
        "Assessment Awal\nMedis",
        "Triase",
        "Riwayat Alergi",
        "CPPT",
      ];
    }

    // ================================== IGD FOR PERAWAT ATAU NON DOKTER
    if (poliklinik == Poliklinik.igd && person == Person.perawat) {
      return [
        "Assessment Awal Keperawatan",
        "CPPT",
        "Riwayat Alergi",
        "Asuhan Keperawatan",
        "Analisa Data"
      ];
    }

    if (poliklinik == Poliklinik.ponek && person == Person.perawat) {
      return [
        "Triase",
        "Assessment Awal Kebidanan",
        "CPPT",
        "Riwayat Alergi",
        "Asuhan Keperawatan",
      ];
    }

    if (poliklinik == Poliklinik.bangsal && person == Person.dokter) {
      return [
        "CPPT",
        "Assessment Awal",
        "Resiko Jatuh",
        "Riwayat Alergi",
      ];
    }

    if (poliklinik == Poliklinik.bidan && person == Person.dokter) {
      return [
        "Assessment Awal\nMedis",
        "Riwayat Alergi",
        "CPPT",
      ];
    }

    if (poliklinik == Poliklinik.bangsal && person == Person.perawat) {
      return [
        "CPPT",
        "Asesmen Keperawatan",
        "Resiko Jatuh",
        "Asuhan Keperawatan",
        "Analisa Data",
        "Kontrol Pasien"
      ];
    }
    if (poliklinik == Poliklinik.icu && person == Person.perawat) {
      return [
        "CPPT",
        "Asesmen Intensive",
        "Resiko Jatuh",
        "Asuhan Keperawatan",
        "Analisa Data",
        "Kontrol Pasien",
      ];
    }

    if (poliklinik == Poliklinik.bidan && person == Person.perawat) {
      return [
        "CPPT",
        "Asesmen Kebidanan",
        "Resiko Jatuh",
        "Riwayat Alergi",
        "Asuhan Keperawatan",
        "Analisa Data",
        "Kontrol Pasien"
      ];
    }

    return [];
  }

// =================================================== TAMPILKAN MENU
  static Widget content(
      {required Poliklinik poliklinik,
      required Person person,
      required String menu,
      required BuildContext context}) {
    // ======
    PasienState pasienState = context.watch<PasienBloc>().state;
    AuthState authState = context.watch<AuthBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    if (authState is Authenticated) {
      if (poliklinik == Poliklinik.penMedik && person == Person.perawat) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // ==== //
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const Expanded(child: FormulirAsesmenKeperawatanWidgetPage());
        }
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // PENCATATAN BHP
          return const Expanded(
              child: ReportFormulirPencatatanBHPDializerPage());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const Expanded(
              child:
                  ReportFormulirPemberianInformasiHemodialisisContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const Expanded(
              child: ReportPersetujuanTindakanHemodiallisisContentWidget());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const Expanded(
              child: AsesmenKeperawatanHemodialisaContentWidget());
        }
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const FormulirAsuhanKeperawatanWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // ASESMEN KEPERAWTAN
          return const Expanded(child: ImplementasiKeperawatanPageWidget());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person).last ==
            menu) {
          // ASESMEN KEPERAWTAN
          context
              .read<BhpBloc>()
              .add(OnGetBHPHD(noReg: singlePasien.first.noreg));
          return const Expanded(child: PencatatanBHPReUseDializerWidgetPage());
        }
      }

      if (poliklinik == Poliklinik.igd && person == Person.perawat) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // ==== //
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const Expanded(child: ReportFormulirIGDContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const FormulirKeperawatanWidgetContent();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          return const AsesmenKeperawatanIGDContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN ASESMEN AWAL KEPERAWATAN IGD
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          return const AsuhanKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          context.read<AnalisaBloc>().add(OnGetDiagnosaKeperawatan());
          context
              .read<AnalisaBloc>()
              .add(OnGetAnalisaDataEvent(noReg: singlePasien.first.noreg));
          return const AnalisaDataPageWidget();
        }
      }

      if (poliklinik == Poliklinik.ponek && person == Person.perawat) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const Expanded(child: ReportFormulirIGDContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const FormulirKeperawatanWidgetContent();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<TriaseIgdDokterBloc>().add(OnGetTriaseIGDDokterEvent(
              noReg: singlePasien.first.noreg,
              person: toPerson(person: authState.user.person),
              pelayanan: toPelayanan(poliklinik: poliklinik)));
          return const Expanded(child: TriaseIGD());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<KeluhanUtamaKebidananBloc>().add(
              OnGetAsesmenKebidananEvent(
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person)));
          return const AssesmenKebidananContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          return const AsuhanKeperawatanContentWidget();
        }
      }

      if (poliklinik == Poliklinik.perina && person == Person.perawat) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // ==== //
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<ResikoJatuhReportBloc>().add(
              OnGetReportResikoJatuhMorseEvent(
                  noreg: singlePasien.first.noreg));

          return const ReportHasilResikoJatuhWidget();
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context.read<AsesmenBayiBloc>().add(
              OnGetReportAsesmenAwalKeperawatanBayi(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn));
          return const ReportViewKeperawatanPerinaPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<AsesmenBayiBloc>().add(OnGetAsesmenKeperawatanBayi(
              noRM: singlePasien.first.mrn,
              noReg: singlePasien.first.noreg,
              person: toPerson(person: authState.user.person)));
          return const AsesmenPerinaBayiPageWidget();
        }
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const IntervensiRisikoJatuhContentWidget();
        }
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          context.read<PengkajianAwalKeperawatanBloc>().add(
              OnGetPengkajianAwalKeperawatanEvent(
                  tanggal: DateTime.now().toString().substring(0, 10),
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));
          return const AsuhanKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[5] ==
            menu) {
          return const EdukasiTerintegrasiPageWidget();
        }

        // ANALISA DATA

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[6] ==
            menu) {
          context.read<AnalisaBloc>().add(OnGetDiagnosaKeperawatan());
          context
              .read<AnalisaBloc>()
              .add(OnGetAnalisaDataEvent(noReg: singlePasien.first.noreg));
          return const AnalisaDataPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[7] ==
            menu) {
          // GET EWS SYSTEM
          context.read<EarlyWarningSystemBloc>().add(
              OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          return const EwsSystemPageWidget();
        }
      }

      // =====================> POLI
      if (poliklinik == Poliklinik.bedahPlastik && person == Person.dokter) {
        // =================== //
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return Text(
            "Ringkasan Pulang",
            style: blackTextStyle,
          );
        }

        // ============ JIKA MEDIS
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return Container();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const CPPTWidgetContentBedah();
        }
      }

      if (poliklinik == Poliklinik.bangsal && person == Person.perawat) {
        // TAMPILKAN LAPORAN UNTUK PERAWAT
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // NOTE :
          return const FormulirKeperawatanWidgetContent();
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const Expanded(child: ReportFormulirIGDContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context.read<ResikoJatuhReportBloc>().add(
              OnGetReportResikoJatuhMorseEvent(
                  noreg: singlePasien.first.noreg));

          return const ReportHasilResikoJatuhWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        // =========================== PENGKAJIAN AWAL KEPERAWTAN PASIEN
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<AsesmenDokterBloc>().add(
              AsesmenDokterEvent.onGetAsesment(
                  value: singlePasien.first.noreg));

          context.read<PengkajianAwalKeperawatanBloc>().add(
              OnGetPengkajianAwalKeperawatanEvent(
                  tanggal: DateTime.now().toString().substring(0, 10),
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));

          return const AsesmenKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const IntervensiRisikoJatuhContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context.read<PengkajianAwalKeperawatanBloc>().add(
              OnGetPengkajianAwalKeperawatanEvent(
                  tanggal: DateTime.now().toString().substring(0, 10),
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));
          return const AsuhanKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          context.read<AnalisaBloc>().add(OnGetDiagnosaKeperawatan());
          context
              .read<AnalisaBloc>()
              .add(OnGetAnalisaDataEvent(noReg: singlePasien.first.noreg));
          return const AnalisaDataPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[5] ==
            menu) {
          // GET EWS SYSTEM
          context.read<EarlyWarningSystemBloc>().add(
              OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          return const KontrolPasienPageWidget();
        }
      }

      if (poliklinik == Poliklinik.icu && person == Person.perawat) {
        // TAMPILKAN LAPORAN UNTUK PERAWAT
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          return const FormulirKeperawatanWidgetContent();
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const Expanded(child: ReportFormulirIGDContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context.read<ResikoJatuhReportBloc>().add(
              OnGetReportResikoJatuhMorseEvent(
                  noreg: singlePasien.first.noreg));

          return const ReportHasilResikoJatuhWidget();
        }
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          return const ViewReportICUPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        // =========================== PENGKAJIAN AWAL KEPERAWTAN PASIEN
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<AsesmenDokterBloc>().add(
              AsesmenDokterEvent.onGetAsesment(
                  value: singlePasien.first.noreg));

          context.read<PengkajianAwalKeperawatanBloc>().add(
              OnGetPengkajianAwalKeperawatanEvent(
                  tanggal: DateTime.now().toString().substring(0, 10),
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));

          // return const AsesmenKeperawatanContentWidget();

          return const AsesmenIntensivePageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const IntervensiRisikoJatuhContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context.read<PengkajianAwalKeperawatanBloc>().add(
              OnGetPengkajianAwalKeperawatanEvent(
                  tanggal: DateTime.now().toString().substring(0, 10),
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  person: toPerson(person: authState.user.person)));
          return const AsuhanKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          context.read<AnalisaBloc>().add(OnGetDiagnosaKeperawatan());
          context
              .read<AnalisaBloc>()
              .add(OnGetAnalisaDataEvent(noReg: singlePasien.first.noreg));
          return const AnalisaDataPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[5] ==
            menu) {
          // GET EWS SYSTEM
          context.read<EarlyWarningSystemBloc>().add(
              OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          return const KontrolPasienPageWidget();
        }
      }

      // ================================
      if (poliklinik == Poliklinik.bangsal && person == Person.dokter) {
        // ==== //
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<TriaseIgdDokterBloc>().add(
              OnGetReportTriaseIGDDokterEvent(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  tanggal: DateTime.now().toString().substring(0, 10)));
          return const FormulirIGDContentWidget();
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context.read<ReportBloc>().add(
              OnGetReportPengkajianAwalRawatInapDokter(
                  noRM: singlePasien.first.mrn,
                  noReg: singlePasien.first.noreg,
                  tanggal: DateTime.now().toString().substring(0, 10)));
          return const Expanded(child: FormulirKeperawatanWidgetContent());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context
              .read<InputDiagnosaBloc>()
              .add(const InputDiagnosaEvent.onGetDiagnosa());

          context.read<KeluhanUtamaBloc>().add(OnGetKeluhanUtamaEvent(
              noRM: singlePasien.first.mrn,
              noReg: singlePasien.first.noreg,
              tanggal: DateTime.now().toString().substring(0, 10),
              person: toPerson(person: authState.user.person),
              pelayanan: toPelayanan(poliklinik: authState.user.poliklinik)));

          return PasienAwalIGDWidget(menu: menuMedisPasienIGD);
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const IntervensiRisikoJatuhContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }
      }

      if (poliklinik == Poliklinik.perina && person == Person.dokter) {
        //===//
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }
        //===//
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const ReportViewKeperawatanPerinaPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG MEDIK
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context
              .read<InputDiagnosaBloc>()
              .add(const InputDiagnosaEvent.onGetDiagnosa());
          context.read<InputDiagnosaBloc>().add(
              InputDiagnosaEvent.getDiagnosa(noreg: singlePasien.first.noreg));
          return const AsesmenMedisBayiPerinaPage();
        }
      }

      // ==========================
      if (poliklinik == Poliklinik.dalam && person == Person.dokter) {
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const AsesmenDokterWidgetContent();
        }

        // ================
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return AsesmenMedisKeperawatanWidgetContent(
              menu: menuAsesmenKeperawatanMedis);
        }

        //====================
      }

      // ============> POLI KLINIK DALAM
      if (poliklinik == Poliklinik.dalam && person == Person.dokter) {
        // ============ JIKA MEDIS
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI  return HasilPenunjangContentWidget(menu: hasilPenunjangMedik);
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }
      }

      //  ================================== POLI KLINIK GIGI
      if (poliklinik == Poliklinik.gigi && person == Person.dokter) {
        // TAMPILKAN MENU MEDIS
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return AsesmenMedisGigiContentWidget(
              menuAsesmenMedis: menuAsesmenMedis);
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG WIDGET
          context
              .read<PenunjangMedikBloc>()
              .add(OnGetData(noReg: singlePasien.first.noreg));
          return const HasilPenunjangMedikWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG WIDGET
          return ObservasiAnastesiLokalWidget(menu: menuAnastesiLokal);
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG WIDGET
          return Container();
        }
      }

      if (poliklinik == Poliklinik.gigi &&
          (person == Person.nonDokter || person == Person.perawat)) {
        // TAMPILKAN MENU MEDIS

        // TAMPILKAN MENU ADMINISTRASI
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const SkriningPasienPage();
        }

        // Tampilkan Asesmen Kebutuhan Edukasi
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const AssessmentRawatJalanPerawatPage();
        }

        // Tampilkan Asesmen Pasien Rawat Jalan
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const AssessmentKebutuhanEdukasiGigiPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return Container();
        }
      }

      if (poliklinik == Poliklinik.mata &&
          (person == Person.nonDokter || person == Person.perawat)) {
        // TAMPILKAN MENU MEDIS

        // TAMPILKAN MENU ADMINISTRASI
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const SkriningPasienPage();
        }

        // Tampilkan Asesmen Pasien Rawat Jalna
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const AssessmentKebutuhanEdukasiGigiPage();
        }
        // Tampilkan Asesmen Kebutuhan Edukasi
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // TAMPILKAN ASESMEN MEDIS POLI GIGI
          return const AssessmentRawatJalanPerawatPage();
        }
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // TAMPILKAN ASESMEN
          // MEDIS POLI GIGI
          return Container();
        }
      }

      if (poliklinik == Poliklinik.mata &&
          (person == Person.perawat || person == Person.nonDokter)) {
        return const Expanded(child: PengembanganWidget());
      }

      if (poliklinik == Poliklinik.igd && person == Person.dokter) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          // GET DATA // REPORT IGD DOKTER
          context.read<TriaseIgdDokterBloc>().add(
              OnGetReportTriaseIGDDokterEvent(
                  noReg: singlePasien.first.noreg,
                  noRM: singlePasien.first.mrn,
                  tanggal: DateTime.now().toString().substring(0, 10)));
          return const FormulirIGDContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<InputDiagnosaBloc>()
              .add(const InputDiagnosaEvent.onGetDiagnosa());

          context.read<KeluhanUtamaBloc>().add(OnGetKeluhanUtamaEvent(
              noRM: singlePasien.first.mrn,
              noReg: singlePasien.first.noreg,
              tanggal: DateTime.now().toString().substring(0, 10),
              person: toPerson(person: authState.user.person),
              pelayanan: toPelayanan(poliklinik: authState.user.poliklinik)));

          return PasienAwalIGDWidget(menu: menuMedisPasienIGD);
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<TriaseIgdDokterBloc>().add(OnGetTriaseIGDDokterEvent(
              noReg: singlePasien.first.noreg,
              person: toPerson(person: authState.user.person),
              pelayanan: toPelayanan(poliklinik: poliklinik)));
          return const Expanded(child: TriaseIGD());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }
      }

      if (poliklinik == Poliklinik.bidan && person == Person.perawat) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<ResikoJatuhReportBloc>().add(
              OnGetReportResikoJatuhMorseEvent(
                  noreg: singlePasien.first.noreg));
          return const Expanded(child: ReportHasilResikoJatuhWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // DISINI ADALAH REPORT KEBIDANAN
          context.read<ReportPengkajianKebidananAwalKebidananBloc>().add(
              OnGetPengkajianEvent(
                  noRM: singlePasien.first.mrn,
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person)));

          return const Expanded(child: ReportKebidananContentWidget());
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const Expanded(child: FormulirKeperawatanWidgetContent());
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        // KEBIDANAN ASESMEN
        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          //  === RESIKO JAUTH === //
          context.read<KeluhanUtamaKebidananBloc>().add(
              OnGetAsesmenKebidananEvent(
                  noReg: singlePasien.first.noreg,
                  person: toPerson(person: authState.user.person)));
          return const AssesmenKebidananContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          return const IntervensiRisikoJatuhBidanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[3] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG MEDIK
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[4] ==
            menu) {
          // TAMPILKAN HASIL PENUNJANG MEDIK
          return const AsuhanKeperawatanContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[5] ==
            menu) {
          context.read<AnalisaBloc>().add(OnGetDiagnosaKeperawatan());
          context
              .read<AnalisaBloc>()
              .add(OnGetAnalisaDataEvent(noReg: singlePasien.first.noreg));
          return const AnalisaDataPageWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[6] ==
            menu) {
          // GET EWS SYSTEM
          context.read<EarlyWarningSystemBloc>().add(
              OnGetDataEarlyWarningSystem(noReg: singlePasien.first.noreg));
          return const EwsSystemPageWidget();
        }
      }

      if (poliklinik == Poliklinik.bidan && person == Person.dokter) {
        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context.read<HasilPenunjangBloc>().add(
              HasilPenunjangEvent.getHasilLaborOldDB(
                  noReg: singlePasien.first.noreg));
          return HasilPenunjangOldDBWidgetContent(menu: hasilPenunjangMedik);
        }

        if (MenuAsesmen.laporan(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          return const FormulirIGDContentWidget();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[0] ==
            menu) {
          context
              .read<InputDiagnosaBloc>()
              .add(const InputDiagnosaEvent.onGetDiagnosa());

          context.read<KeluhanUtamaBloc>().add(OnGetKeluhanUtamaEvent(
              noRM: singlePasien.first.mrn,
              noReg: singlePasien.first.noreg,
              tanggal: DateTime.now().toString().substring(0, 10),
              person: toPerson(person: authState.user.person),
              pelayanan: toPelayanan(poliklinik: authState.user.poliklinik)));

          return PasienAwalIGDWidget(menu: menuMedisPasienIGD);
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[2] ==
            menu) {
          context
              .read<CpptBloc>()
              .add(CpptEvent.onGetCPPTPasien(noRM: singlePasien.first.mrn));
          context.read<CpptSbarBangsalBloc>().add(
              OnGetCatatanKeperawatanEvent(noReg: singlePasien.first.noreg));
          return const CpptContentWidgetPage();
        }

        if (MenuAsesmen.medis(poliklinik: poliklinik, person: person)[1] ==
            menu) {
          context.read<AlergiBloc>().add(OnGetAlergiObatEvent(
              noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg));
          return const RiwayatAlergiContentWidget();
        }
      }

      // =======================
      return Container();
    }

    return Container();
  }
}

// ====================================== MENU TAMPILAN
List<String> menuAssementAwalPasienRJalan = [
  "Riwayat & Keluhan",
  "Asesmen Fungsional",
  "Tanda Vital & Nutrisi",
  "Perencanaan Pemulangan Pasien (Dischange Planing)",
  "Asesmen Risiko Jatuh (Get Up & Go Test)",
  "Psikologis",
  "Masalah Keperawatan",
  "Rencana Keperawatan"
];

// === Menu Asesment Medis POLI GIGI  ==== //
List<String> menuAsesmenMedis = [
  "Anamnesa",
  "Odontogram",
  "Informasi Medis & Tindak Lanjut",
  "Input Diagnosa Yang Sesui (ICD-10)",
  "Data Intra Oral",
  "Data medik Yang Perlu Diperhatikan"
];

// LIST ASESMEN MEDIS
List<String> menuAnastesiLokal = [
  "Pelaksana",
  "Pra Operasi",
  "Intra Operasi",
  "Pasca Operasi",
];

// LIST TINDAKAN KEDOKTERAN
List<String> tindakanKedokteran = [
  "Pemberi & Penerima Informasi",
  "Rincian Informasi",
  "Input Tindakan Yang Sesuai (ICD-9)"
];

List<String> menuMedisPasienIGD = [
  "Keluhan Utama",
  "Tanda Vital",
  "Pemeriksaan Fisik",
  "Status Lokalis",
  "Input Diagnosa",
  "Pemeriksaan Penunjang",
  "Rencana & Tindak Lanjut",
];

List<String> menuAsesmenKeperawatanBidan = [
  "Asesmen",
];

List<String> menuAsesmenKeperawatanMedis = [
  "Riwayat & Tanda Vital",
  "Asesmen Resiko Jatuh",
  "Skala Nyeri",
  "Skrining Geriatri",
  "Skala Flacc",
];

List<String> hasilPenunjangMedik = [
  "Hasil Labor",
  "Hasil Radiologi",
  "Hasil Fisiotherapy",
  "Hasil Pemeriksaan Gizi"
];

List<String> menuTriaseIGDDokter = [
  "Riwayat Alergi",
  "Tanda Vital Dan Gangguan Perilaku",
  "Skala",
];

List<String> menuAsesmenAwalRawatInap = [
  "Asesmen Awal",
  "Pemeriksaan Fisik",
  "Vital Sign",
  "Diagnosa",
  "Terapi",
  "Rencana Penunjang"
];
