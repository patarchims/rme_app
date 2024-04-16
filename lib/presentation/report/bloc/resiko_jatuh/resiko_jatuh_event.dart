// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_bloc.dart';

@immutable
sealed class ResikoJatuhEvent {}

class OnGetIntervensiResikoJatuhEvent extends ResikoJatuhEvent {
  final String noReg;
  final String noRM;
  OnGetIntervensiResikoJatuhEvent({
    required this.noReg,
    required this.noRM,
  });
}

class OnGetRisikoJatuhDewasaEvent extends ResikoJatuhEvent {
  final String noReg;
  OnGetRisikoJatuhDewasaEvent({
    required this.noReg,
  });
}

class OnGetResikoJatuhAnakEvent extends ResikoJatuhEvent {
  final String noReg;
  OnGetResikoJatuhAnakEvent({
    required this.noReg,
  });
}

class OnGetReAsesmenResikoJatuhAnakEvent extends ResikoJatuhEvent {
  final String noReg;
  OnGetReAsesmenResikoJatuhAnakEvent({
    required this.noReg,
  });
}

class OnGetReportResikoJatuhMorseEvent extends ResikoJatuhEvent {
  final String noreg;
  OnGetReportResikoJatuhMorseEvent({
    required this.noreg,
  });
}
