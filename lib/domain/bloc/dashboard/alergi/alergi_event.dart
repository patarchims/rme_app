// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'alergi_bloc.dart';

@immutable
sealed class AlergiEvent {}

class OnSaveAlergiObatEvent extends AlergiEvent {
  final String noRM;
  final String kelompok;
  final String alergi;
  final String namaUser;
  OnSaveAlergiObatEvent({
    required this.noRM,
    required this.kelompok,
    required this.alergi,
    required this.namaUser,
  });
}

class OnGetPenyakitKeluarga extends AlergiEvent {
  final String noRM;
  final String noReg;
  OnGetPenyakitKeluarga({
    required this.noRM,
    required this.noReg,
  });
}

class OnGetAlergiKeluargaEvent extends AlergiEvent {
  final String noRM;
  final String noReg;
  OnGetAlergiKeluargaEvent({
    required this.noRM,
    required this.noReg,
  });
}

class OnGetRiwayatAlergi extends AlergiEvent {
  final String noRM;
  final String noReg;
  OnGetRiwayatAlergi({
    required this.noRM,
    required this.noReg,
  });
}

class OnDeleteAlergiKeluargaEvent extends AlergiEvent {
  final int nomor;
  final String noRm;
  final String kelompok;
  OnDeleteAlergiKeluargaEvent({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
  });
}

class OnRemovePenyakitKeluargaEvent extends AlergiEvent {
  final int nomor;
  final String noRm;
  final String kelompok;

  OnRemovePenyakitKeluargaEvent({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
  });
}

class OnSavePenyakitKeluarga extends AlergiEvent {
  final String noRM;
  final String alergi;
  final String namaUser;
  OnSavePenyakitKeluarga({
    required this.noRM,
    required this.alergi,
    required this.namaUser,
  });
}

class OnSaveRiwayatPenyakitKeluargaEvent extends AlergiEvent {
  final String noRM;
  final String alergi;
  final String namaUser;
  OnSaveRiwayatPenyakitKeluargaEvent({
    required this.noRM,
    required this.alergi,
    required this.namaUser,
  });
}

class OnDeleteAlergi extends AlergiEvent {
  final int no;
  final String noRM;
  final String kelompok;
  final String insertDttm;
  OnDeleteAlergi({
    required this.noRM,
    required this.no,
    required this.kelompok,
    required this.insertDttm,
  });
}

class OnGetAlergiObatEvent extends AlergiEvent {
  final String noRM;
  final String noReg;
  OnGetAlergiObatEvent({
    required this.noRM,
    required this.noReg,
  });
}

class OnAddalergiObatEvent extends AlergiEvent {}

class OnSaveAlergiMakananEvent extends AlergiEvent {
  final String noRM;
  final String kelompok;
  final String alergi;
  final String namaUser;
  OnSaveAlergiMakananEvent({
    required this.noRM,
    required this.kelompok,
    required this.alergi,
    required this.namaUser,
  });
}

class OnSaveAlergiLainnyaEvent extends AlergiEvent {
  final String noRM;
  final String kelompok;
  final String alergi;
  final String namaUser;
  OnSaveAlergiLainnyaEvent({
    required this.noRM,
    required this.kelompok,
    required this.alergi,
    required this.namaUser,
  });
}
