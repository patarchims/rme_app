abstract class EndPoint {
  static String kPelayanan = '/v1/lib/kpelayanan';
  static String createAccount = '/v1/create-account';
  static String signIn = '/v1/sign-in';
  static String loginUser = '/v1/login';
  static String cariKaryawan = '/v1/cari-karyawan';
  static String registerUser = '/v1/register-user';
  static String verifikasiUser = '/v1/verifikasi-user';
  static String checkVersion = '/v1/lib/version';
  static String session = '/v1/session';
  static String listAntreanPasien = '/v1/list-antrean-pasien';
  static String detailPasien = '/v1/detail-pasien';
  static String kVitalSign = '/v1/lib/kvital-sign';
  static String saveAnatomi = '/v1/save-anatomi';
  static String saveSkrining = '/v1/save-skrining';
  static String getSkrining = '/v1/get-skrining';
  static String saveOdontogram = '/v1/save-odontogram';
  static String deleteOdontogram = '/v1/delete-odontogram';
  static String saveAsesRawatJalanPerawat = '/v1/save-asses-rawatJalan-perawat';
  static String getAsesRawatJalanPerawat = '/v1/get-asses-rawatJalan-perawat';
  static String listOdontogram = '/v1/get-odontograms';
  static String insertOdontogram = '/v1/insert-odontogram';
  static String getKebEdukasi = '/v1/get-kebutuhanEdukasi';
  static String saveKebEdukasi = '/v1/save-kebutuhanEdukasi';
  static String getRawatJalanDokter = '/v1/getrawatjalan-dokter';
  static String asesmenPemeriksaanFisikBangsalDokter =
      '/v1/asesmen-pemeriksaan-fisik-bangsal-dokter';
  // ODONTOGRAM
  static String publishOdontogram = '/v1/publish-odontogram';
  static String odontogram = '/v1/odontogram';
  static String svaeRawatJalanDokter = '/v1/saveRawatjalan-dokter';
  static String bankData = '/v1/lib-bankdata/';
  static String getAllICD10 = '/v1/lib-icd-all';
  static String penunjangMedik = '/v1/hasil-penunjang-medik';
  static String saveAnamnesa = '/v1/save-anamnesa';
  static String dataMedik = '/v1/data-medik';
  static String getAnamnesa = '/v1/get-anamnesa';
  static String asesmentAnamnesa = '/v1/anamnesa';
  static String diagnosa = '/v1/diagnosa';
  static String diagnosaPerawatForDokter = '/v1/asesmen-dokter-perawat';
  static String informasiMedis = '/v1/informasi-medis';
  static String dataIntraOral = '/v1/data-intra-oral';
  static String getICD10 = '/v1/lib-icd/';
  static String getAllICD = '/v1/lib-icd-all';
  static String historyPasien = '/v1/history-pasien';
  static String triase = '/v1/triase';
  static String lokalis = '/v1/lokalis-image';
  static String anamnesaIGD = '/v1/anamnesa-igd';
  static String pemeriksaanFisik = '/v1/pemeriksaan-fisik';
  static String dokterSpesialis = '/v1/dokter-spesialis';
  static String kProcedure = '/v1/kprocedure/LAB001';
  static String detailPemeriksaanLabor = '/v1/detail-pemeriksaan-labor';
  static String inputPemeriksaanLabor = '/v1/input-pemeriksaan-labor';
  static String inputPemeriksaanPenunjang = '/v1/input-pemeriksaan-penunjang';
  static String kProcedureFisioTerapi = '/v1/procedure/';
  static String detailRad = '/v1/detail-rad';
  static String rencanaTindakLanjut = '/v1/rencana-tindak-lanjut';
  static String asesmedKeperawatanBidan = '/v1/asesmed-keperawatan-bidan';
  static String cariSDKI = '/v1/sdki/';
  static String cariIntervensi = '/v1/intervensi';
  static String cariSIKI = '/v1/siki';
  static String saveAsesmenKeperawatan = '/v1/save-asesmen-keperawatan';
  static String getAsesmenKeperawatan = '/v1/get-asesmen-keperawatan';

  // ASUHAN KEPERAWATAN
  static String asuhanKeperawatan = '/v1/asuhan-keperawatan-bidan';
  static String asesmenKeperawatanBidan = '/v1/asesmen-keperawatan-bidan';
  // PASCA OPERASI
  static String pascaOperasi = '/v1/pasca-operasi';

  // END POINT REPORT
  static String rmjReport = '/v1/rmj';
  static String reportAsesmentRawatJalan = '/v1/rawat-jalan';
  static String rmjDownload = '/v1/skrining/download';

  // SEARCH DESKRIPSI SIKI
  static String searchDeskripsiSiki = '/v1/search-deskripsi-siki';
  static String searchDeskripsiLuaranSiki = '/v1/deskripsi-luaran-slki';
  static String dHasilLabor = '/v1/hasil-pemeriksaan-labor';
  static String dHasilLaborOldDB = '/v1/hasil-pemeriksaan-labor-old';
  static String dhasilRadiologiOldDB = '/v1/hasil-pemeriksaan-radiologi-old';
  static String dhasilFisioterapiOldDB =
      '/v1/hasil-pemeriksaan-fisioterapi-old';
  static String dhasilGiziOldDB = '/v1/hasil-pemeriksaan-gizi-old';
  static String hasilGizi = '/v1/hasil-gizi';
  static String hasilRadiologi = '/v1/hasil-radiologi';
  static String hasilFisioterapi = '/v1/hasil-fisioterap';

  // DOKTER
  static String cariDokter = '/v3/cari-dokter';
  static String cpptPasien = '/v1/cppt-pasien';
  static String reportPengkajianRawatInapDokter = '/v1/pengkajian-awal-dokter';
  static String reportPengkajianRawatInapPerawat =
      '/v1/report-pengkajian-awal-perawat';
  static String reportIntervensiResikoJatuh =
      '/v1/report-intervensi-resiko-jatuh';
  static String reportResikoJatuhMorse = "/v1/report-resiko-jatuh-morse";
  static String reportResikoJatuhDewasa = "/v1/report-resiko-jatuh-dewasa";
  static String reportResikoJatuhAnak = "/v1/report-resiko-jatuh-anak";
  static String reportReAsesmenResikoJatuhAnak =
      "/v1/report-resiko-jatuh-reasesmen-anak";

  // RIWAYAT ALERGI
  static String riwayatAlergi = '/v1/riwayat-alergi';
  static String gangguanPerilaku = '/v1/vital-sign-igd';
  // static String gangguanPerilaku = '/v1/vital-sign-gangguan-perilaku';
  static String asesmenPemeriksaanFisik = '/v1/asesmen-pemeriksaan-fisik';
  static String skalaNyeri = '/v1/skala-nyeri';
  static String asesmenPemeriksaanFisikBangsal =
      '/v1/asesmen-pemeriksaan-fisik-bangsal';

  // =============================== ASESMEN PADA IGD
  static String informasiKeluhan = '/v1/asesmen-info-keluhan-igd';
  static String skriningResikoDekubitus = '/v1/skrining-resiko-dekubitus';
  static String riwayatKehamilan = '/v1/riwayat-kehamilan';
  static String skriningNyeri = '/v1/skrining-nyeri';
  static String tindakLanjut = '/v1/tindak-lanjut';
  static String asesmenDokter = '/v1/asesmen-dokter';
  static String keadaanUmumBangsal = '/v1/keadaan-umum-bangsal';
  static String vitalSignBangsal = '/v1/dvital-sign';
  static String pemeriksaanFisikAnak = '/v1/pemeriksaan-fisik-anak';

  // ============================ RESIKO JATUH
  static String resikoJatuh = '/v1/resiko-jatuh';
  static String deteksiResikoJatuh = '/v1/deteksi-resiko-jatuh';
  static String intervensiResikoJatuh = '/v1/intervensi-resiko-jatuh';
  static String saveDeskripsiLuaran = '/v1/save-deskripsi-luaran-slki';
  static String hasilAsuhanKeperawatan = '/v1/asuhan-keperawatan';
  static String hasilAsuhanKeperawatanV2 = '/v2/asuhan-keperawatan';
  static String saveDaskepSLKI = '/v1/daskep-slki';
  static String saveDaskepSLKIAll = '/v1/daskep-slki-all';
  static String onClosedSLKI = '/v1/closed-daskep-slki';
  static String alergi = '/v1/alergi';
  static String alergiKeluarga = "/v1/alergi-keluarga";

  // ====== REPORT ======= //
  static String ringkasanpulang = '/v1/ringkasan-pulang';
  static String triaseReport = '/v1/triase-report';
  static String pengkajianRawatInapAnak = '/v1/pengkajian-rawat-inap-anak';
  static String reportPerkembanganPasien = '/v1/report-perkembangan-pasien';
  static String reportIntervensi = '/v1/report-intervensi';
  static String keluhanUtamaDokterIGD = '/v1/keluhan-utama-dokter-igd';
  static String diagnosaBandingIGDDokter = '/v1/diagnosa-banding-dokter';
  static String riwayatPenyakitKeluargaIGD =
      '/v1/riwayat-penyakit-keluarga-dokter-igd';
  static String pemeriksaanFisikIGDDokter = '/v1/pemeriksaan-fisik-dokter-igd';

  static String pemeriksaanFisikIGDPerawat =
      '/v1/pemeriksaan-fisik-perawat-igd';
  static String pemeriksaanFisikIGDDokterMethodist =
      '/v1/pemeriksaan-fisik-dokter-igd-methodist';
  static String pemeriksaanFisikBangsal = '/v1/pemeriksaan-fisik-bangsal';
  static String resepObat = '/v1/resep-obat';
  static String pengkajianPersistemKeperawatan =
      '/v1/pengkajian-persistem-keperawatan';
  static String tandaVitalIGDDokter = '/v1/tanda-vital-igd-dokter';
  static String tandaVitalIGDPerawat = '/v1/tanda-vital-igd-perawat';
  static String pengkajianAwalKeperawatan = '/v1/pengkajian-awal-perawat';
  static String getPemeriksaanFisikAnak = '/v1/get-pemeriksaan-fisik-anak';
  static String savePemeriksaanFisikAnak = '/v1/save-pemeriksaan-fisik-anak';
  static String riwayatPenyakitKeluarga =
      '/v1/riwayat-penyakit-keluarga-bangsal';

  // ===================== KEPERAWATAN ===================== //
  static String tandaVitalKeperawatan = '/v1/tanda-vital-bangsal-keperawatan';
  static String cpptBangsal = '/v1/cppt-sbar-bangsal';
  static String tandaVitalAnak = '/v1/tanda-vital-bangsal-anak';
}
