// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_anak_bloc.dart';

@immutable
sealed class AsesmenAnakEvent {}

class OnGetAsessmenAnakEvent extends AsesmenAnakEvent {
  final String noReg;
  final String noRM;
  final String person;
  final String tanggal;
  OnGetAsessmenAnakEvent({
    required this.noReg,
    required this.noRM,
    required this.person,
    required this.tanggal,
  });
}

class OnSaveAsesmenAnakEvent extends AsesmenAnakEvent {
  //===//
}

class OnChangeJenisAsesmenEvent extends AsesmenAnakEvent {
  final String value;
  OnChangeJenisAsesmenEvent({
    required this.value,
  });
}
