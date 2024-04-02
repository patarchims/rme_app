// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_nutrisi_bloc.dart';

@immutable
sealed class PengkajianNutrisiEvent {}

class OnGetPengkajianNutrisi extends PengkajianNutrisiEvent {
  final String noReg;
  OnGetPengkajianNutrisi({
    required this.noReg,
  });
}

class OnChangedN1 extends PengkajianNutrisiEvent {
  final String value;
  OnChangedN1({
    required this.value,
  });
}

class OnChangedN2 extends PengkajianNutrisiEvent {
  final String value;
  OnChangedN2({
    required this.value,
  });
}

class OnSavePengkajianNutrisi extends PengkajianNutrisiEvent {
  final String noReg;
  final String deviceID;
  final String n1;
  final String n2;
  final int nilai;
  OnSavePengkajianNutrisi({
    required this.noReg,
    required this.deviceID,
    required this.n1,
    required this.n2,
    required this.nilai,
  });
}
