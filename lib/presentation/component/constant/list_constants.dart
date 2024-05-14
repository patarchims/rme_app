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
  static const List<String> gcs = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];
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
    " Jaga Kebersihan Luka",
    "Diet",
    "Lain-Lain"
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
    "Hamaton",
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
    "Pembesaran Tirod",
    "Retraksi",
    "Kaku kudu",
    "Keterbatansan gerak",
    Constants.tidakAdaKelainan,
    Constants.lainnya
  ];

  static const List<String> dada = [
    "Asimetris",
    "Tracheostomy",
    "Tidak ada kesulitan",
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
    "Normal",
    "Abnormal",
    "Peristaltik",
    "Pulsasi",
    "Umbillikus:",
    "Tidak ada masalah",
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
}
