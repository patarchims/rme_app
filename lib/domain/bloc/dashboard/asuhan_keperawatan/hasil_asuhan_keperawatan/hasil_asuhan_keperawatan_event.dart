// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hasil_asuhan_keperawatan_bloc.dart';

@immutable
sealed class HasilAsuhanKeperawatanEvent {}

class OnGetHasilAsuhanKeperawatanEvent extends HasilAsuhanKeperawatanEvent {
  final String noReg;
  final String status;
  OnGetHasilAsuhanKeperawatanEvent({
    required this.noReg,
    required this.status,
  });
}

class OnDeleteAsuhanKeperawatanEvent extends HasilAsuhanKeperawatanEvent {
  final String noDaskep;
  OnDeleteAsuhanKeperawatanEvent({
    required this.noDaskep,
  });
}

class OnGetHasilAsuhanKeperawatanStatusClosedEvent
    extends HasilAsuhanKeperawatanEvent {
  final String noReg;
  final String status;
  OnGetHasilAsuhanKeperawatanStatusClosedEvent({
    required this.noReg,
    required this.status,
  });
}

class OnUpdateStatusHasilEvent extends HasilAsuhanKeperawatanEvent {
  final String noReg;
  final String noDaskep;
  OnUpdateStatusHasilEvent({
    required this.noReg,
    required this.noDaskep,
  });
}

class OnSelectionHasilEvent extends HasilAsuhanKeperawatanEvent {
  final int angkaSelection;
  final DeskripsiSlki deskripsiSlki;
  final int indexDeskripsiSiki;
  final int indexDiagnosa;
  OnSelectionHasilEvent({
    required this.angkaSelection,
    required this.deskripsiSlki,
    required this.indexDeskripsiSiki,
    required this.indexDiagnosa,
  });
}

class OnSaveIntervensiEvent extends HasilAsuhanKeperawatanEvent {
  final String noDaskep;
  final String kodeSLKI;
  final int idKriteria;
  final int hasil;
  OnSaveIntervensiEvent({
    required this.noDaskep,
    required this.kodeSLKI,
    required this.idKriteria,
    required this.hasil,
  });
}

class OnSaveIntervensiEventV2 extends HasilAsuhanKeperawatanEvent {
  final int indexDiagnosa;
  final String noReg;
  OnSaveIntervensiEventV2({
    required this.indexDiagnosa,
    required this.noReg,
  });
}
