import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_bedah/spesialisasi_bedah_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_medical/spesialis_medical_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_anak/spesialisasi_anak_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/spesialisasi_obgyn/spesialisasi_obgyn_content_widget.dart';

// =========================== TAMPILKAN MENU ASESMEN KHUSUS DI BANGSAL ============================ //
class AsesmenBangsalMedicalDokterContentWidget extends StatelessWidget {
  const AsesmenBangsalMedicalDokterContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;

    // CHEK ASESMEN
    if (authState is Authenticated) {
      // ============ PEMATAAN MENU UNTUK SETIAP DOKTER SPESIALIS

      // TODO: ASESMEN BANGSAL //PADA DOKTER DI RAWAT INAP ANAK
      if (authState.user.spesialisasi == Spesialisasi.anak) {
        return const SpesialisasiAnakContentWidget();
      }

      if (authState.user.spesialisasi == Spesialisasi.jantung ||
          authState.user.spesialisasi == Spesialisasi.paru ||
          authState.user.spesialisasi == Spesialisasi.penyakitDalam) {
        return const SpesialisMedicalContentWidget();
      }

      if (authState.user.spesialisasi == Spesialisasi.bedahOrtophedi ||
          authState.user.spesialisasi == Spesialisasi.bedahPlastik ||
          authState.user.spesialisasi == Spesialisasi.bedahSaraf ||
          authState.user.spesialisasi == Spesialisasi.bedahUmum) {
        return const SpesialisasiBedahContentWidget();
      }

      if (authState.user.spesialisasi == Spesialisasi.obgyn) {
        return const SpesialisasiObgynContentWidget();
      }

      //=============
    }

    return Center(
      child: Text(
        "Tidak dapat didefenisikan",
        style: blackTextStyle,
      ),
    );
  }
}

// =========== MENU INI UNTUK DOKTER MEDICAL (INTERNA, PARU, KARDIO)
// TAMPILKAN MENU UNTUK DOKTER KHUSUS YANG MELAKUKAN ASESMEN BANGSAL MEDICAL

List<String> menuBangsalMedical = [
  "Keluhan",
  "Pemeriksaan Fisik",
];

List<String> menuBangsalMedicalPerawat = [
  "Asesmen Awal",
  "Pemeriksaan Fisik",
  "Vital Sign",
  "Diagnosa",
  "Terapi",
  "Rencana Penunjang"
];

List<String> toMappingMenuBangsalMedical({required UserModel user}) {
  if (user.person == Person.dokter && user.spesialisasi == Spesialisasi.paru) {
    return menuBangsalMedical;
  }

  if (user.person == Person.nonDokter || user.person == Person.perawat) {
    return menuBangsalMedicalPerawat;
  }

  return [""];
}

// PADA HALAMAN INI,
// DETEKSI APAKAH USER SEBAGAI PERAWAT ATAU DOKTER,
// MAPPING HALAMAN MENUJU MASING MASING USER
// SETIAP DOKTER MEMILIKI HALAMAN ASESMEN YANG BERBEDA
