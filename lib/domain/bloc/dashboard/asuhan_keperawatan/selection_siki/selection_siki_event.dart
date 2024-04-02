// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selection_siki_bloc.dart';

@immutable
sealed class SelectionSikiEvent {}

class OnGetDeskripsiSikiEvent extends SelectionSikiEvent {
  final String siki;
  OnGetDeskripsiSikiEvent({
    required this.siki,
  });
}

class OnCheclistResikoJatuh extends SelectionSikiEvent {
  final int sikiIndex;
  final String katergori;
  final int deskripsiIndex;
  final Deskripsi deskripsi;
  OnCheclistResikoJatuh({
    required this.sikiIndex,
    required this.katergori,
    required this.deskripsiIndex,
    required this.deskripsi,
  });
}
