// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_nutrisi_anak_bloc.dart';

sealed class PengkajianNutrisiAnakEvent {}

class OnGetPengkajianNutrisiAnakEvent extends PengkajianNutrisiAnakEvent {
  final String noReg;
  OnGetPengkajianNutrisiAnakEvent({
    required this.noReg,
  });
}

class OnChangedNilai1Event extends PengkajianNutrisiAnakEvent {
  final String value;
  OnChangedNilai1Event({
    required this.value,
  });
}

class OnChangedNilai2Event extends PengkajianNutrisiAnakEvent {
  final String value;
  OnChangedNilai2Event({
    required this.value,
  });
}

class OnChangedNilai3Event extends PengkajianNutrisiAnakEvent {
  final String value;
  OnChangedNilai3Event({
    required this.value,
  });
}

class OnChangedNilai4Event extends PengkajianNutrisiAnakEvent {
  final String value;
  OnChangedNilai4Event({
    required this.value,
  });
}

class OnSavePengkajianNutrisiAnakEvent extends PengkajianNutrisiAnakEvent {
  final String noReg;
  final String deviceID;
  final String nilai1;
  final String nilai2;
  final String nilai3;
  final String nilai4;
  final int nilai;
  OnSavePengkajianNutrisiAnakEvent({
    required this.noReg,
    required this.deviceID,
    required this.nilai1,
    required this.nilai2,
    required this.nilai3,
    required this.nilai4,
    required this.nilai,
  });
}
