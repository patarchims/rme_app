part of 'apgar_score_bloc.dart';

@immutable
sealed class ApgarScoreEvent {}

class OnGetApgarScoreEvent extends ApgarScoreEvent {
  final String noReg;
  OnGetApgarScoreEvent({
    required this.noReg,
  });
}

class OnChangedJantungEvent extends ApgarScoreEvent {
  final int value;
  OnChangedJantungEvent({
    required this.value,
  });
}

class OnChangedWaktuEvent extends ApgarScoreEvent {
  final String value;
  OnChangedWaktuEvent({
    required this.value,
  });
}

class OnChangedUsahaNafasEvent extends ApgarScoreEvent {
  final int value;
  OnChangedUsahaNafasEvent({
    required this.value,
  });
}

class OnChangedTonusOtotEvent extends ApgarScoreEvent {
  final int value;
  OnChangedTonusOtotEvent({
    required this.value,
  });
}

class OnChangedReflesiEvent extends ApgarScoreEvent {
  final int value;
  OnChangedReflesiEvent({
    required this.value,
  });
}

class OnSaveApgarScoreEvent extends ApgarScoreEvent {
  final String noReg;
  final ApgarScoreModel apgarScore;
  OnSaveApgarScoreEvent({
    required this.noReg,
    required this.apgarScore,
  });
}

class OnChangedKulitEvent extends ApgarScoreEvent {
  final int value;
  OnChangedKulitEvent({
    required this.value,
  });
}
