part of 'penunjang_medik_bloc.dart';

@immutable
abstract class PenunjangMedikEvent {}

class OnGetData extends PenunjangMedikEvent {
  final String noReg;
  OnGetData({
    required this.noReg,
  });
}
