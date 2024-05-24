// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kartu_observasi_bloc.dart';

@immutable
sealed class KartuObservasiEvent {}

class OnGetKartuCairanEvent extends KartuObservasiEvent {
  final String noReg;
  OnGetKartuCairanEvent({
    required this.noReg,
  });
}

class OnUpdateKartuCairanEvent extends KartuObservasiEvent {
  final int idKartu;
  final String cairamMasuk1;
  final String cairamMasuk2;
  final String cairamMasuk3;
  final String cairamMasukNgt;
  final String namaCairan;
  final String cairanKeluarUrine;
  final String cairanKeluarNgt;
  final String drain;
  final String keterangan;
  OnUpdateKartuCairanEvent({
    required this.idKartu,
    required this.cairamMasuk1,
    required this.cairamMasuk2,
    required this.cairamMasuk3,
    required this.cairamMasukNgt,
    required this.namaCairan,
    required this.cairanKeluarUrine,
    required this.cairanKeluarNgt,
    required this.drain,
    required this.keterangan,
  });
}

class OnDeleteKartuObservasiEvent extends KartuObservasiEvent {
  final String noReg;
  final int idKartu;
  OnDeleteKartuObservasiEvent({
    required this.noReg,
    required this.idKartu,
  });
}

class OnDeleteKartuCairanEvent extends KartuObservasiEvent {
  final int idKartu;
  final String noReg;
  OnDeleteKartuCairanEvent({
    required this.idKartu,
    required this.noReg,
  });
}

class OnUpdateKartuObservasiEvent extends KartuObservasiEvent {
  final int idObservasi;
  final String t;
  final String noReg;
  final String n;
  final String p;
  final String s;
  final String cvp;
  final String ekg;
  final String pupilKiri;
  final String pupilKanan;
  final String redaksiKiri;
  final String redaksiKanan;
  final String anggoataBadan;
  final String kesadaran;
  final String sputumWarna;
  final String isiCup;
  final String keterangan;
  OnUpdateKartuObservasiEvent({
    required this.idObservasi,
    required this.t,
    required this.noReg,
    required this.n,
    required this.p,
    required this.s,
    required this.cvp,
    required this.ekg,
    required this.pupilKiri,
    required this.pupilKanan,
    required this.redaksiKiri,
    required this.redaksiKanan,
    required this.anggoataBadan,
    required this.kesadaran,
    required this.sputumWarna,
    required this.isiCup,
    required this.keterangan,
  });
}

class OnSaveKartuCarianEvent extends KartuObservasiEvent {
  final String noReg;
  final String cairanMasuk1;
  final String cairanMasuk2;
  final String cairanMasuk3;
  final String cairanMasukNgt;
  final String namaCairan;
  final String cairanKeluarUrine;
  final String cairanKeluarNgt;
  final String cairanMasuk;
  final String drainDll;
  final String keterangan;
  OnSaveKartuCarianEvent({
    required this.noReg,
    required this.cairanMasuk1,
    required this.cairanMasuk2,
    required this.cairanMasuk3,
    required this.cairanMasukNgt,
    required this.namaCairan,
    required this.cairanKeluarUrine,
    required this.cairanKeluarNgt,
    required this.cairanMasuk,
    required this.drainDll,
    required this.keterangan,
  });
}

class OnSaveKartuObservasiEvent extends KartuObservasiEvent {
  final String noReg;
  final String t;
  final String n;
  final String p;
  final String s;
  final String cvp;
  final String ekg;
  final String ukuranKi;
  final String ukuranKa;
  final String redaksiKi;
  final String redaksiKa;
  final String anggotaGerak;
  final String kesadaran;
  final String sputumWarna;
  final String isiCUP;
  final String keterangan;
  OnSaveKartuObservasiEvent({
    required this.noReg,
    required this.t,
    required this.n,
    required this.p,
    required this.s,
    required this.cvp,
    required this.ekg,
    required this.ukuranKi,
    required this.ukuranKa,
    required this.redaksiKi,
    required this.redaksiKa,
    required this.anggotaGerak,
    required this.kesadaran,
    required this.sputumWarna,
    required this.isiCUP,
    required this.keterangan,
  });
}

class OnGetKartuObservasiEvent extends KartuObservasiEvent {
  final String noReg;
  OnGetKartuObservasiEvent({
    required this.noReg,
  });
}
