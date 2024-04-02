// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'down_score_neonatus_bloc.dart';

@immutable
sealed class DownScoreNeonatusEvent {}

class OnGetDownScoreNeoNatus extends DownScoreNeonatusEvent {
  final String noReg;
  OnGetDownScoreNeoNatus({
    required this.noReg,
  });
}

class OnSaveScroeNeoNatus extends DownScoreNeonatusEvent {
  final String noReg;
  final String person;
  final DDownScorePerinaModel neoNatus;
  OnSaveScroeNeoNatus({
    required this.neoNatus,
    required this.noReg,
    required this.person,
  });
}

class OnChangeFrekwesiEvent extends DownScoreNeonatusEvent {
  final int value;
  OnChangeFrekwesiEvent({
    required this.value,
  });
}

class OnChangedSianosisEvent extends DownScoreNeonatusEvent {
  final int value;
  OnChangedSianosisEvent({
    required this.value,
  });
}

class OnChangedRetraksiEvent extends DownScoreNeonatusEvent {
  final int value;
  OnChangedRetraksiEvent({
    required this.value,
  });
}

class OnChangedAirEntryEvent extends DownScoreNeonatusEvent {
  final int value;
  OnChangedAirEntryEvent({
    required this.value,
  });
}

class OnChangeMerintihEvent extends DownScoreNeonatusEvent {
  final int value;
  OnChangeMerintihEvent({
    required this.value,
  });
}
