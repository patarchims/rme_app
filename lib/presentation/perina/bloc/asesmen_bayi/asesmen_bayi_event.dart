// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_bayi_bloc.dart';

@immutable
sealed class AsesmenBayiEvent {}

class OnGetAsesmenKeperawatanBayi extends AsesmenBayiEvent {
  final String noReg;
  final String noRM;
  final String person;
  OnGetAsesmenKeperawatanBayi({
    required this.noReg,
    required this.noRM,
    required this.person,
  });
}

class OnGetReportAsesmenAwalKeperawatanBayi extends AsesmenBayiEvent {
  final String noReg;
  final String noRM;
  OnGetReportAsesmenAwalKeperawatanBayi({
    required this.noReg,
    required this.noRM,
  });
}

class OnGetTindakLanjutEvent extends AsesmenBayiEvent {
  final String noReg;
  final String noRM;
  OnGetTindakLanjutEvent({
    required this.noReg,
    required this.noRM,
  });
}

class OnSaveTindakLanjutEvent extends AsesmenBayiEvent {
  final String noReg;
  final String noRM;
  final String pelayanan;
  final String devicesID;
  final String person;
  final TindakLajutModel tindakLajut;
  OnSaveTindakLanjutEvent({
    required this.noReg,
    required this.noRM,
    required this.pelayanan,
    required this.devicesID,
    required this.person,
    required this.tindakLajut,
  });
}

class OnDeleteRiwayatKelahiranLaluEvent extends AsesmenBayiEvent {
  final String nomor;
  final String noReg;
  final String noRM;
  OnDeleteRiwayatKelahiranLaluEvent({
    required this.nomor,
    required this.noReg,
    required this.noRM,
  });
}

class OnSaveDataAsesmenKeperawatanBayiEvent extends AsesmenBayiEvent {
  final String devicesID;
  final String person;
  final String pelayanan;
  final String noReg;
  final String noRM;
  final String kdDPJP;
  final AsesmenBayiModel asesmen;
  OnSaveDataAsesmenKeperawatanBayiEvent({
    required this.devicesID,
    required this.kdDPJP,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.noRM,
    required this.asesmen,
  });
}

class OnSaveAsesmenKeperawatanBayiEvent extends AsesmenBayiEvent {
  final String devicesID;
  final String pelayanan;
  final String person;
  final String noReg;
  final String noRM;
  final RiwayatKehamilanPerinaModel kehamilanPerinal;
  OnSaveAsesmenKeperawatanBayiEvent({
    required this.devicesID,
    required this.pelayanan,
    required this.person,
    required this.noReg,
    required this.noRM,
    required this.kehamilanPerinal,
  });
}
