import 'package:hms_app/presentation/component/constant/constants.dart';

abstract class ListConstants {
  ListConstants._();

  // ====================== FREKUENSI NYERI
  static String toTarget({required String kategori, required int angka}) {
    switch (kategori) {
      case "Meningkat":
        if (angka == 1) {
          return "Meningkat";
        }
        if (angka == 2) {
          return "Cukup Meningkat";
        }
        if (angka == 3) {
          return "Sedang";
        }
        if (angka == 4) {
          return "Cukup Menurun";
        }
        if (angka == 5) {
          return "Menurun";
        }
        return "";
      case "Memburuk":
        if (angka == 1) {
          return "Memburuk";
        }
        if (angka == 2) {
          return "Cukup Memburuk";
        }
        if (angka == 3) {
          return "Sedang";
        }
        if (angka == 4) {
          return "Cukup Membaik";
        }
        if (angka == 5) {
          return "Membaik";
        }
        return "";
      default:
        if (angka == 1) {
          return "Menurun";
        }
        if (angka == 2) {
          return "Cukup Menurun";
        }
        if (angka == 3) {
          return "Sedang";
        }
        if (angka == 4) {
          return "Cukup Meningkat";
        }
        if (angka == 5) {
          return "Meningkat";
        }
        return "";
    }
  }

  static const List<String> caraKeluarDariIGD = [
    "Dipulangkan",
    "Dirujuk",
    "Ditransfer"
  ];
  static const List<String> pemeriksaanFisik = ["TAK", "Lainnya"];

  static const List<String> frekuensiNyeriChoose = [
    "Jarang",
    "Hilang Timbul",
    "Terus Menerus"
  ];

  static const List<int> hasilAngka = [1, 2, 3, 4, 5];
  static const List<String> waktu = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
  ];
  static const List<String> gcsM = [
    " ",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];

  static const List<String> gcsE = [
    " ",
    "1",
    "2",
    "3",
    "4",
  ];

  static const List<String> gcsV = [" ", "1", "2", "3", "4", "5"];

  static const List<String> kesadaranManusia = [
    "",
    "Composmentis",
    "Apatis",
    "Delirium",
    "Somnolen",
    "Sopor",
    "Semi-koma",
    "Koma Ringan",
    "Koma"
  ];

  static const List<String> pupilChoose = [
    "",
    "Isokor",
    "Unisokor",
    "Midriasis",
    "Miosis",
    "Tidak ada reaksi"
  ];

  static const List<String> akralChoose = [
    "",
    "Hangat",
    "Kering",
    "Merah",
    "Dingin",
    "Basah",
  ];

  static const List<String> kualitasNyeri = [
    "Nyeri Tumpul",
    "Nyeri Tajam",
    "Panas/Terbakar"
  ];

  static const List<String> kgb = [
    "Teraba",
    "Tidak Teraba",
  ];

  static const List<String> kodisiSaatPulangChoose = [
    "Membaik",
    "Memburuk",
    "Stabil",
    "Meninggal",
    "Tidak Ada Perubahan",
    "DOA"
  ];
  static const List<String> transportasiPulangChoose = [
    "Kendaraan Pribadi",
    "Ambulan",
    "Kendaraan Jenazah"
  ];
  static const List<String> pendidikanSaatPulang = [
    "Makan/Minum Obat Teratur",
    "Jaga Kebersihan Luka",
    "Diet",
    Constants.lainnya
  ];

  // ====================== END PILIHAN FREKUSI NYERI

  // ========================= PILIH DARI ASESMEN  INFROMSAI DARI IGD
  static const List<String> informasiDidapatDari = [
    "Auto-anamnesa",
    "Hetero-anamnesa",
    "Jalan Tanpa Bantuan",
    "Kursi Roda",
    Constants.lainnya
  ];
  static const List<String> informasiDidapatDariIGD = [
    "Autoanamnese",
    "Alloanamnese"
  ];

  static const List<String> keadaanUmum = [
    "Baik",
    "Sedang",
    "Jelek",
    "Kooperatif",
    "Non Kooperatif"
  ];

  static const List<String> skriningFungsiAktifitasSehariHari = [
    "Mandiri",
    "Dengan Bantuan",
  ];

  static const List<String> yaTidak = [
    "Tidak",
    "Ya",
  ];

  static const List<String> caraMasuk = [
    "Jalan Tanpa Bantuan",
    "Kursi Roda",
    "Tempat Tidur Dorong",
    "Jalan Dengan Bantuan",
  ];

  static const List<String> asalMasuk = [
    "Non Rujukan",
    "Rujukan",
  ];

  static const List<String> yaAtauTidak = ["Ya", "Tidak"];

  // =========================== END PILIHAN DARI ASESMEN IGD

  static const List<String> kesadaran = [
    "Compos Mentis",
    "Apatis",
    "Somnolent",
    "Sporocoma",
    "Koma",
    "Sopor",
    Constants.lainnya
  ];

  static const List<String> shiftList = ["Pagi", "Sore", "Malam"];

  static const List<String> kepala = [
    "Mesosefal",
    "Asimetris",
    "Hematoma",
    "Tidak ada kelainan",
    Constants.lainnya
  ];

  static const List<String> rambut = [
    "Kotor",
    "Berminyak",
    "Kering",
    "Rontok",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> wajah = [
    "Asimetris",
    "Belis Palsu",
    "Tic Facials",
    Constants.kelainanCongenital,
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> punggung = [
    "Simetris",
    "Asimetris",
    "Benjolan",
    "Hematom",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> genetalia = [
    "Kotor",
    "Keputihan",
    "Berbau",
    "Abses",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> ekstremitas = [
    "Kejang",
    "Tremor",
    "Kontraktur",
    "Fraktur",
    "Lemah",
    "Paralysis",
    "Defomitas",
    Constants.kelainanCongenital,
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> mata = [
    "Gangguan Penglihatan",
    "Sciera animes",
    "Kunjungtivitas",
    "Anisokor",
    "Midriasis/Miosis",
    "Tidak ada reaksi cahaya",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> telinga = [
    "Asimetris",
    "Iritasi",
    "Tuli",
    "Keluar cairan",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> hidung = [
    "Asimetris",
    "Epistaksis",
    "Polip/Sinusitis",
    Constants.kelainanCongenital,
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> mulut = [
    "Simetris",
    "Asimetris",
    "Bibir pucat",
    Constants.kelainanCongenital,
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> gigi = [
    "Karies",
    "Goyang",
    "Tambal",
    "Gigi Palsu",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> lidah = [
    "Kotor",
    "Mukosa Kering",
    "Gerakan Asimetris",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> tenggorakan = [
    "Faring Merah",
    "Pembesaran vena jugularis",
    "Tensil membesar",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> leher = [
    "Pembesaran Tiroid",
    "Retraksi",
    "Kaku kuduk",
    "Keterbatansan gerak",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> dada = [
    "Asimetris",
    "Tracheostomy",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> paru = [
    "Pneumonia",
    "Tuberkulosis (TB)",
    "Bronkitis",
    "Asma",
    "Vesiculer",
    "Ronichi",
    "Wheezing",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];
  static const List<String> paruAnak = [
    "Asma",
    "Vesiculer",
    "Ronichi",
    "Wheezing",
  ];

  static const List<String> respirasi = [
    "Sputum",
    "Dyspne",
    "Nafas pendek",
    "Batuk",
    "Wheezing",
    "Ronchi di paru kanan/kiri",
    "Haemapoe",
    "Rales",
    "Bradipnea",
    "Takinea",
    Constants.lainnya
  ];

  static const List<String> perut = [
    "Bentuk",
    "Simetris",
    "Asimetris",
    "Kembung",
    "Nyeri",
    "Tidak ada masalah",
    Constants.lainnya
  ];

  static const List<String> abdomen = [
    "Supel",
    "Kembung",
    "Acites",
    "Pulsasi",
    "Umbillikus menonjol:",
    "Perut membesar",
    "Tugor kulit lembek",
    "Distensi Abdomen",
    "Memapan",
    Constants.lainnya
  ];

  static const List<String> jantung = [
    "Suara S1/S2 normal",
    "Aritmia",
    "Murmur",
    "Gallop",
    "Benjolan",
    "Aritmia",
    "Bradikardi",
    "Distentsi",
    "Palpitasi",
    "Nyeri dada",
    "Tachikardi",
    Constants.lainnya
  ];
  static const List<String> jantungAnak = [
    "BJ I/II",
    "Mur-mur",
    "Gallop",
    "Bunyi Tambahan :"
  ];
  static const List<String> dindingDadaAnak = [
    "Simetris",
    "Tidak simetris",
  ];

  static const List<String> mataAnak = ["Anamis", "Tidak Anemis"];
  static const List<String> heparAnak = [
    "Teraba",
    "Tidak Teraba",
  ];
  static const List<String> limpaAnak = [
    "Teraba",
    "Tidak Teraba",
  ];
  static const List<String> ginjalAnak = [
    "Teraba",
    "Tidak Teraba",
  ];
  static const List<String> genetaliaAnak = [
    "Fimosis",
    "Tidak fimosis",
  ];
  static const List<String> oufAnak = ["Kemerahan", "Tidak Kemerahan"];
  static const List<String> tugorKulit = ["Baik", "Sedang", "Kurang baik"];
  static const List<String> ekstremitasAnak = [
    "Akral",
    "CRT",
    "Sianosis +",
    "Sianosis -",
    "Ekstremitas",
    "Motorik"
  ];

  // =========================================== PEMERIKSAAN   static const FISIK

  static const List<String> eliminasiBAK = [
    "TAK",
    "Sering BAK",
    "BAK Nyeri",
    "Volume BAK Sedikit",
    "Hematuri"
  ];
  static const List<String> eliminasiBAB = [
    "TAK",
    "Konstipasi",
    "Diare",
    "Melena",
  ];
  static const List<String> aktivitasIstirahat = [
    "TAK",
    "Susah Tidur",
  ];
  static const List<String> aktivitas = [
    "Mandiri",
    "Bantuan Sebagian",
  ];

  static const List<String> batuk = [
    "TAK",
    "Berdahak",
    "Tidak Berdahak",
    Constants.lainnya
  ];
  static const List<String> kardiovaSkuler = [
    "TAK",
    "Nyeri Dada",
    Constants.lainnya
  ];

  static const List<String> batukPilihan = [
    "TAK",
    "Berdahak",
    "Tidak Berdahak",
    Constants.lainnya
  ];
  static const List<String> respiratori = ["TAK", "Sesak Napas"];
  static const List<String> perfusiSecebral = [
    "TAK",
    "Kejang",
    "Riwayat Kejang",
  ];
  static const List<String> thermoregulasi = [
    "TAK",
    "Demam",
    "Riwayat Demam",
  ];
  static const List<String> sistemPerfusiPerifer = [
    "TAK",
    "Odema",
    "Kesemutan/Kebas",
  ];
  static const List<String> sistemPencernaan = [
    "TAK",
    "Perut Kembung",
    "Distensi Abdomen",
    Constants.lainnya
  ];
  static const List<String> sistemUsus = [
    "YA",
    "TIDAK",
  ];
  static const List<String> integumen = [
    "TAK",
    "Luka",
    "Abses",
    Constants.lainnya
  ];

  static const List<String> odema = [
    "Tidak",
    "Ya",
  ];

  static const List<String> statusMental = [
    "Orientasi",
    "Agitasi",
    "Menyerang",
    "Tak Ada Response",
    "Letargi",
    "Kooperatif",
    "Disorientasi"
  ];
  static const List<String> pAPSSMER = [
    "Tidak",
    "Ya",
  ];

  static const List<String> masalahProstat = ["Tidak", "Ya"];

  static const List<String> hambatanBahasa = [
    "Tidak",
    "Tuna rungu",
    "Tuna wicara",
    "Retardasi mental",
    "Gangguan mental",
    Constants.lainnya
  ];

  static const List<String> caraBelajarYangDisukai = [
    "Demontrasi",
    "Diskusi",
    "Menulis",
  ];
  static const List<String> bahasaSehariHari = [
    "Indonesia",
    "Bahasa Daerah",
  ];
  static const List<String> perluPenerjemah = ["Tidak", "Ya, Bahasa"];
  static const List<String> spikologis = [
    "Stabil/Tenang",
    "Cemas/Takut",
    "Marah",
    "Sedih",
  ];
  static const List<String> hambatanSosial = ["Tidak Ada", "Ada, Sebutkan"];
  static const List<String> hambatanEkonomi = ["Tidak Ada", "Ada, Sebutkan"];
  static const List<String> hambatanSpiritual = ["Tidak Ada", "Ada, Sebutkan"];
  static const List<String> responseEmosi = [
    "TAK",
    "Takut Terhadap Lingkungan/Tindakan di RS",
    "Mudah Marah",
    "Sedih",
    "Menangis",
    "Rendah Diri",
    "Cemas",
  ];
  static const List<String> menjalankanIbadah = [
    "Selalu/Taat",
    "Kadang-kadang",
    "Tidak Pernah",
  ];

  static const List<String> hamil = [
    "Tidak",
    "Ya",
  ];

  static const List<String> nilaiKepercayaan = [
    "Tidak ada",
    "Ada, jelaskan",
  ];
  static const List<String> presepsiTerhadapSakit = [
    "Perasaan Bersalah",
    "Perasaan Ditinggal Tuhan",
    "Pasrah",
    Constants.lainnya
  ];
  static const List<String> pendarahan = [
    "Belum menstruasi",
    "Menstruasi tidak teratur",
    "Sedang menstruasi hari ke",
    "Tidak menstruasi",
    "Menometroragia",
    "Amenorhoe selama……………",
    Constants.lainnya
  ];
  static const List<String> riwayatHipertensi = [
    "Tidak",
    "Ya",
  ];
  static const List<int> skorAktivitas = [1, 2, 3, 4, 5];

  static const List<String> sakitKepala = ["Tidak", "Ya, Jelaskan"];

  static const List<String> anggotaGerak = ["Tidak", "Ya, Lokasi"];

  static const List<String> perubahanStatusMental = ["TAK", "Gelisah", "Cemas"];

  static const List<String> kekuatanOTOT = ["0", "1", "2", "3", "4", "5"];

  static const List<String> akral = ["Hangat", "Dingin", "Cyanotik"];

  static const List<String> nutrisiHidrasi = [
    "TAK",
    "Mual",
    "Muntah",
    "Mulas",
    "Tak Nafsu Makan",
    Constants.lainnya
  ];
//   static const List<String> batuk = ["Tidak", "Berdahak/Darah", "Ya"];
  static const List<String> suaraNapas = [
    "Wheezing",
    "Ronchi",
    "Stridor",
    "Vesikuler",
    "Bronchoveresikuler"
  ];
  static const List<String> merokok = [
    "Tidak",
    "Riwayat Perokok",
    "Ya",
  ];
  static const List<int> skorAktivitasMandi = [0, 1, 2, 3, 4];
  static const List<String> bicara = ["Tak", "Pelo", "Tidak Bisa Bicara"];
  static const List<String> kenyamanan = ["TAK", "Tidak Nyaman", "Gelisah"];

  // ================= PEMERIKSAAN FISIK IGD

  static const List<String> fisik = [
    "KEPALA",
    "LEHER",
    "DADA",
    "ABDOMEN",
    "PINGGANG",
    "EXTREMITAS"
  ];

  static const List<String> pemeriksaanFisikPilihan = ["DBN", "ABNORMAL"];
  static const List<String> pemeriksaanFisikJantung = [
    "DBN",
    "ABNORMAL",
    "Murmur",
    "Gallop",
    "Aritmia",
    "Takikardia",
    "Bradikardi",
    "Palpitasi",
    "Pracemaker"
  ];

  static const List<String> pemeriksaanFisikLeher = [
    "DBN",
    "Pembesaran Tiroid",
    "Pembesaran vena jugularis",
    "Kaku kuduk",
    "Keterbatasan gerak"
  ];

  static const List<String> pemeriksaanFisikAnus = [
    "DBN",
    "Hemoroid",
    Constants.lainnya
  ];

  static const List<String> pemeriksaanFisikGinjal = [
    "DBN",
    "Nyeri Ketuk CVA, lokasi",
    Constants.lainnya
  ];

  static const List<String> pemeriksaanFisikMata = [
    "DBN",
    "Secret",
    "Refleks berkedip",
    "Mata Cekung",
    "Sclera icteric",
    "Simetris Kanan Refleks berkedip",
    "Simetris Kiri Refleks berkedip",
    Constants.lainnya
  ];
  static const List<String> pemeriksaanFisikDada = [
    "DBN",
    "Retraksi Dada",
    "Faktur Clavikula",
    Constants.lainnya
  ];
  static const List<String> pemeriksaanFisikHati = [
    "DBN",
    "Teraba membesar",
    Constants.lainnya
  ];
  static const List<String> pemeriksaanFisikPerut = [
    "DBN",
    "Perut membesar",
    "Tugor kulit lembek",
    "Distensi Abdomen",
    "Acites",
    "Memapan",
    Constants.lainnya
  ];
  static const List<String> pemeriksaanFisikTHT = [
    "DBN",
    "Keluar Cairan",
    Constants.lainnya
  ];

  static const List<String> pemeriksaanFisikUsus = [
    "DBN",
    "Terdengar Lambat",
    "Terdengar Cepat",
    "Tidak terdengar",
    Constants.lainnya
  ];

  static const List<String> pemeriksaanFisikMulut = [
    "DBN",
    "Sariawan",
    "Refleks Menelan Menurun",
    Constants.lainnya
  ];

  // LOKASI NYERI
  static const List<String> frekuensiNyeri = [
    "Jarang",
    "Hilang Timbul",
    "Menetap"
  ];
  static const List<String> lokasiNyeri = [];
  static const List<String> menjalar = ["Tidak", "Ya, ke"];
}
