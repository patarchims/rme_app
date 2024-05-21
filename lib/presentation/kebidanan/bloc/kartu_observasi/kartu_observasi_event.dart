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

class OnSaveKartuCarianEvent extends KartuObservasiEvent {
  final String noReg;
  final String cairanMasuk1;
  final String cairanMasuk2;
  final String cairanMasuk3;
  final String cairanMasukNgt;
  final String namaCairan;
  final String cairanKeluar;
  final String cairanNgt;
  final String cairanMasuk;
  final String keterangan;
  final String drainDll;
  OnSaveKartuCarianEvent({
    required this.noReg,
    required this.cairanMasuk1,
    required this.cairanMasuk2,
    required this.cairanMasuk3,
    required this.cairanMasukNgt,
    required this.namaCairan,
    required this.cairanKeluar,
    required this.cairanNgt,
    required this.cairanMasuk,
    required this.keterangan,
    required this.drainDll,
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

class OnUpdateKartuObservasiEvent extends KartuObservasiEvent {}

class OnDeleteKartuObservasiEvent extends KartuObservasiEvent {}

class OnGetKartuObservasiEvent extends KartuObservasiEvent {
  final String noReg;
  OnGetKartuObservasiEvent({
    required this.noReg,
  });
}
