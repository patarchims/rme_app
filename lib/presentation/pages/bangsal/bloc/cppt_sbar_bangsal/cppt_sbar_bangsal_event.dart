// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cppt_sbar_bangsal_bloc.dart';

@immutable
sealed class CpptSbarBangsalEvent {}

class OnGetCpptBangsal extends CpptSbarBangsalEvent {
  final String noReg;
  OnGetCpptBangsal({
    required this.noReg,
  });
}

class OnDeleteCPPTBangsalEvent extends CpptSbarBangsalEvent {
  final int noCppt;
  OnDeleteCPPTBangsalEvent({
    required this.noCppt,
  });
}

class OnGetCatatanKeperawatanEvent extends CpptSbarBangsalEvent {
  final String noReg;
  OnGetCatatanKeperawatanEvent({
    required this.noReg,
  });
}

class OnSaveCatatanEvent extends CpptSbarBangsalEvent {
  final String catatan;
  final String noReg;
  OnSaveCatatanEvent({
    required this.catatan,
    required this.noReg,
  });
}

class OnUpdateCpptSBARBangsalEvent extends CpptSbarBangsalEvent {
  final int noCppt;
  final String situation;
  final String background;
  final String asesmen;
  final String recomendation;
  OnUpdateCpptSBARBangsalEvent({
    required this.noCppt,
    required this.situation,
    required this.background,
    required this.asesmen,
    required this.recomendation,
  });
}

class OnSaveCPPTSBARBangsal extends CpptSbarBangsalEvent {
  final String noReg;
  final String deviceID;
  final String kelompok;
  final String situation;
  final String background;
  final String asesmen;
  final String recomendation;
  final String ppa;
  final String dpjp;
  final String pelayanan;
  OnSaveCPPTSBARBangsal({
    required this.noReg,
    required this.deviceID,
    required this.kelompok,
    required this.situation,
    required this.background,
    required this.asesmen,
    required this.recomendation,
    required this.ppa,
    required this.dpjp,
    required this.pelayanan,
  });
}
