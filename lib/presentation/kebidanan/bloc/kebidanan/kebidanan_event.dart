// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kebidanan_bloc.dart';

@immutable
sealed class KebidananEvent {}

class OnGetPengkajianFungsionalKebidanan extends KebidananEvent {
  final String noReg;
  OnGetPengkajianFungsionalKebidanan({
    required this.noReg,
  });
}

class OnChangeTandaKebidananPupil extends KebidananEvent {
  final String value;
  OnChangeTandaKebidananPupil({
    required this.value,
  });
}

class OnChangedTandaKebidananKesadaran extends KebidananEvent {
  final String value;
  OnChangedTandaKebidananKesadaran({
    required this.value,
  });
}

class OnChangedTandaKebidananAkral extends KebidananEvent {
  final String value;
  OnChangedTandaKebidananAkral({
    required this.value,
  });
}

class OnGetPemeriksasanFisikKebidanan extends KebidananEvent {
  final String noReg;
  final String pelayanan;
  final String person;
  OnGetPemeriksasanFisikKebidanan({
    required this.noReg,
    required this.pelayanan,
    required this.person,
  });
}

class OnGetTandaVitalKebidanan extends KebidananEvent {
  final String noReg;
  OnGetTandaVitalKebidanan({
    required this.noReg,
  });
}

class OnDeleteRiwayatPengobatanDirumahKebidanan extends KebidananEvent {
  final String noRiwayat;
  final String noReg;
  OnDeleteRiwayatPengobatanDirumahKebidanan({
    required this.noRiwayat,
    required this.noReg,
  });
}

class OnDeleteRiwayatKehamilanEvent extends KebidananEvent {
  final int no;
  final String noReg;
  OnDeleteRiwayatKehamilanEvent({
    required this.no,
    required this.noReg,
  });
}

class OnSavePemeriksaanFisikKebidahan extends KebidananEvent {
  final String deviceID;
  final String person;
  final String kdBagian;
  final String pelayanan;
  final String noReg;
  final String kepala;
  final String mata;
  final String telinga;
  final String mulut;
  final String gigi;
  final String hidung;
  final String tenggorokan;
  final String payudara;
  final String leherDanBahu;
  final String mucosaMulut;
  final String abdomen;
  final String nutrisiDanHidrasi;
  OnSavePemeriksaanFisikKebidahan({
    required this.deviceID,
    required this.person,
    required this.kdBagian,
    required this.pelayanan,
    required this.noReg,
    required this.kepala,
    required this.mata,
    required this.telinga,
    required this.mulut,
    required this.gigi,
    required this.hidung,
    required this.tenggorokan,
    required this.payudara,
    required this.leherDanBahu,
    required this.mucosaMulut,
    required this.abdomen,
    required this.nutrisiDanHidrasi,
  });
}

class OnSaveRiwayatPengobatanDirumah extends KebidananEvent {
  final String noReg;
  final String deviceID;
  final String userID;
  final String namaObat;
  final String dosis;
  final String caraPemberian;
  final String frekuensi;
  final String waktuPemberian;

  OnSaveRiwayatPengobatanDirumah({
    required this.noReg,
    required this.deviceID,
    required this.userID,
    required this.namaObat,
    required this.dosis,
    required this.caraPemberian,
    required this.frekuensi,
    required this.waktuPemberian,
  });
}

class OnSavePengkajianFungsionalEvent extends KebidananEvent {
  final String noReg;
  final String devicesID;
  final String f1;
  final String f2;
  final String f3;
  final String f4;
  final String f5;
  final String f6;
  final String f7;
  final String f8;
  final String f9;
  final String f10;
  final int nilai;
  OnSavePengkajianFungsionalEvent({
    required this.noReg,
    required this.devicesID,
    required this.f1,
    required this.f2,
    required this.f3,
    required this.f4,
    required this.f5,
    required this.f6,
    required this.f7,
    required this.f8,
    required this.f9,
    required this.f10,
    required this.nilai,
  });
}

class OnChangedFungsionalF1 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF1({
    required this.value,
  });
}

class OnChangedFungsionalF2 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF2({
    required this.value,
  });
}

class OnChangedFungsionalF3 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF3({
    required this.value,
  });
}

class OnChangedFungsionalF4 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF4({
    required this.value,
  });
}

class OnChangedFungsionalF5 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF5({
    required this.value,
  });
}

class OnChangedFungsionalF6 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF6({
    required this.value,
  });
}

class OnChangedFungsionalF7 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF7({
    required this.value,
  });
}

class OnChangedFungsionalF8 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF8({
    required this.value,
  });
}

class OnChangedFungsionalF9 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF9({
    required this.value,
  });
}

class OnChangedFungsionalF10 extends KebidananEvent {
  final String value;
  OnChangedFungsionalF10({
    required this.value,
  });
}

class OnSelectionKepala extends KebidananEvent {
  final String value;
  OnSelectionKepala({
    required this.value,
  });
}

class OnChangedKepalaLainnya extends KebidananEvent {
  final String value;
  OnChangedKepalaLainnya({
    required this.value,
  });
}

class OnChangeMataLainnya extends KebidananEvent {
  final String value;
  OnChangeMataLainnya({
    required this.value,
  });
}

class OnChangedMataLainnya extends KebidananEvent {
  final String value;
  OnChangedMataLainnya({
    required this.value,
  });
}

class OnChangedTelingaLainnya extends KebidananEvent {
  final String value;
  OnChangedTelingaLainnya({
    required this.value,
  });
}

class OnChangedLeherDanBahuLainnya extends KebidananEvent {
  final String value;
  OnChangedLeherDanBahuLainnya({
    required this.value,
  });
}

class OnchangedMulutLainnya extends KebidananEvent {
  final String value;
  OnchangedMulutLainnya({
    required this.value,
  });
}

class OnChangedMucosaMulutLainnya extends KebidananEvent {
  final String value;
  OnChangedMucosaMulutLainnya({
    required this.value,
  });
}

class OnChangedGigiLainnya extends KebidananEvent {
  final String value;
  OnChangedGigiLainnya({
    required this.value,
  });
}

class OnchangedHidungLainnya extends KebidananEvent {
  final String value;
  OnchangedHidungLainnya({
    required this.value,
  });
}

class OnChangedTenggorokanLainya extends KebidananEvent {
  final String value;
  OnChangedTenggorokanLainya({
    required this.value,
  });
}

class OnChangedPayudaraLainnya extends KebidananEvent {
  final String value;
  OnChangedPayudaraLainnya({
    required this.value,
  });
}

class OnChangedAbdomenLainnya extends KebidananEvent {
  final String value;
  OnChangedAbdomenLainnya({
    required this.value,
  });
}

class OnChangedNutrisiDahHidrasiLainnya extends KebidananEvent {
  final String value;
  OnChangedNutrisiDahHidrasiLainnya({
    required this.value,
  });
}

class OnSelectionMata extends KebidananEvent {
  final String value;
  OnSelectionMata({
    required this.value,
  });
}

class OnSelectionTelinga extends KebidananEvent {
  final String value;
  OnSelectionTelinga({
    required this.value,
  });
}

class OnSelecteionMulut extends KebidananEvent {
  final String value;
  OnSelecteionMulut({
    required this.value,
  });
}

class OnSelectionMucosaMulut extends KebidananEvent {
  final String value;
  OnSelectionMucosaMulut({
    required this.value,
  });
}

class OnSelectionGigi extends KebidananEvent {
  final String value;
  OnSelectionGigi({
    required this.value,
  });
}

class OnSelectionHidung extends KebidananEvent {
  final String value;
  OnSelectionHidung({
    required this.value,
  });
}

class OnSelectionTenggorakan extends KebidananEvent {
  final String value;
  OnSelectionTenggorakan({
    required this.value,
  });
}

class OnSelectionAbdomen extends KebidananEvent {
  final String value;
  OnSelectionAbdomen({
    required this.value,
  });
}

class OnSelectionNutrisiDanHidrasi extends KebidananEvent {
  final String value;
  OnSelectionNutrisiDanHidrasi({
    required this.value,
  });
}

class OnSelectionPayudara extends KebidananEvent {
  final String value;
  OnSelectionPayudara({
    required this.value,
  });
}

class OnSelectionLeherDanBahu extends KebidananEvent {
  final String value;
  OnSelectionLeherDanBahu({
    required this.value,
  });
}

class OnSaveRiwayatKehamilanBidan extends KebidananEvent {
  final String deviceID;
  final String pelayanan;
  final String tahun;
  final String tempat;
  final String noReg;
  final String umur;
  final String jenisPersalinan;
  final String penolong;
  final String penyulit;
  final String nifas;
  final String jenisKelamin;
  final String beratBadan;
  final String keadaanSekarang;
  OnSaveRiwayatKehamilanBidan({
    required this.deviceID,
    required this.pelayanan,
    required this.tahun,
    required this.tempat,
    required this.noReg,
    required this.umur,
    required this.jenisPersalinan,
    required this.penolong,
    required this.penyulit,
    required this.nifas,
    required this.jenisKelamin,
    required this.beratBadan,
    required this.keadaanSekarang,
  });
}

class OnSaveTandaTandaVitalSignKebidanan extends KebidananEvent {
  final String deviceID;
  final String pelayanan;
  final String person;
  final String noReg;
  final String tekananDarah;
  final String nadi;
  final String pernapasan;
  final String suhu;
  final String tinggiBadan;
  final String beratBadan;
  final String ddj;
  final String gcsE;
  final String gcsV;
  final String gcsM;
  final String tfu;
  final String kesadaran;
  final String akral;
  final String pupil;

  OnSaveTandaTandaVitalSignKebidanan({
    required this.deviceID,
    required this.ddj,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.tekananDarah,
    required this.nadi,
    required this.pernapasan,
    required this.suhu,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.tfu,
    required this.kesadaran,
    required this.akral,
    required this.pupil,
  });
}

class OnGetRiwayatPengobatanDirumah extends KebidananEvent {
  final String noReg;
  OnGetRiwayatPengobatanDirumah({
    required this.noReg,
  });
}

class OnGetRiwayatKebidanan extends KebidananEvent {
  final String noReg;
  OnGetRiwayatKebidanan({
    required this.noReg,
  });
}

class OnChangeTFU extends KebidananEvent {
  final String value;
  OnChangeTFU({
    required this.value,
  });
}

class OnGetVitalSignKebidanan extends KebidananEvent {
  final String noReg;
  final String person;
  OnGetVitalSignKebidanan({
    required this.noReg,
    required this.person,
  });
}

class OnChangedTekananDarah extends KebidananEvent {
  final String value;
  OnChangedTekananDarah({
    required this.value,
  });
}

class OnChangedPernapasan extends KebidananEvent {
  final String value;
  OnChangedPernapasan({
    required this.value,
  });
}

class OnChangedSuhu extends KebidananEvent {
  final String value;
  OnChangedSuhu({
    required this.value,
  });
}

class OnChangedNadi extends KebidananEvent {
  final String value;
  OnChangedNadi({
    required this.value,
  });
}

class OnChangedDDJ extends KebidananEvent {
  final String value;
  OnChangedDDJ({
    required this.value,
  });
}

class OnChangedBeratBadan extends KebidananEvent {
  final String value;
  OnChangedBeratBadan({
    required this.value,
  });
}

class OnChangedTinggiBadan extends KebidananEvent {
  final String value;
  OnChangedTinggiBadan({
    required this.value,
  });
}

class OnChangedGcsE extends KebidananEvent {
  final String value;
  OnChangedGcsE({
    required this.value,
  });
}

class OnChangedGcsV extends KebidananEvent {
  final String value;
  OnChangedGcsV({
    required this.value,
  });
}

class OnChangedGcsM extends KebidananEvent {
  final String value;
  OnChangedGcsM({
    required this.value,
  });
}
