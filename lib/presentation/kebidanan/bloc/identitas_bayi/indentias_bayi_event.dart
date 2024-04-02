// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'indentias_bayi_bloc.dart';

@immutable
sealed class IndentiasBayiEvent {}

class OnUploadCapSidikKakikananBayi extends IndentiasBayiEvent {
  final String noReg;
  final String noRM;
  final File file;
  final String dpjp;
  final String deviceID;
  final String kategori;
  OnUploadCapSidikKakikananBayi({
    required this.file,
    required this.noReg,
    required this.dpjp,
    required this.deviceID,
    required this.kategori,
    required this.noRM,
  });
}

class OnSaveIdentitasBayi extends IndentiasBayiEvent {
  final String noReg;
  final String noRM;
  final String ttd1;
  final String ttd2;
  final String pemberiGelang;
  final String penentuJK;
  final String namaWali;
  final String person;
  final String deviceID;
  final String pelayanan;
  final String kategori;
  final String dpjp;
  final String namaPenentuJK;
  final String jamKelahiranBayi;
  OnSaveIdentitasBayi({
    required this.noReg,
    required this.noRM,
    required this.ttd1,
    required this.ttd2,
    required this.pemberiGelang,
    required this.penentuJK,
    required this.namaWali,
    required this.person,
    required this.pelayanan,
    required this.deviceID,
    required this.kategori,
    required this.dpjp,
    required this.namaPenentuJK,
    required this.jamKelahiranBayi,
  });
}

class OnDisableButton1 extends IndentiasBayiEvent {
  final bool isActive;
  OnDisableButton1({
    required this.isActive,
  });
}

class OnDisableButton2 extends IndentiasBayiEvent {
  final bool isActive;
  OnDisableButton2({
    required this.isActive,
  });
}

class OnDisableButton3 extends IndentiasBayiEvent {
  final bool isActive;
  OnDisableButton3({
    required this.isActive,
  });
}

class OnGetIdentitasBayi extends IndentiasBayiEvent {
  final String noReg;
  final String noRM;
  OnGetIdentitasBayi({
    required this.noReg,
    required this.noRM,
  });
}
