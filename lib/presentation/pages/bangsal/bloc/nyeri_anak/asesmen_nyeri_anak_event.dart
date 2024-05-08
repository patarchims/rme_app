// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_anak_bloc.dart';

@immutable
sealed class AsesmenNyeriAnakEvent {}

class OnGetAsesmenNyeriAnakEvent extends AsesmenNyeriAnakEvent {
  final String noReg;
  OnGetAsesmenNyeriAnakEvent({
    required this.noReg,
  });
}

class OnChangeEkspresiWajahEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangeEkspresiWajahEvent({
    required this.value,
  });
}

class OnChangedTangisanEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedTangisanEvent({
    required this.value,
  });
}

class OnChangedPolaNapasEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedPolaNapasEvent({
    required this.value,
  });
}

class OnchangedTanganEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnchangedTanganEvent({
    required this.value,
  });
}

class OnChangedKakiEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedKakiEvent({
    required this.value,
  });
}

class OnChangedKesadaraEvent extends AsesmenNyeriAnakEvent {
  final String value;
  OnChangedKesadaraEvent({
    required this.value,
  });
}

class OnChangedSkalaNyeriEvent extends AsesmenNyeriAnakEvent {
  final int skalaNyeri;
  OnChangedSkalaNyeriEvent({
    required this.skalaNyeri,
  });
}
