// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_kebidanan_awal_kebidanan_bloc.dart';

@immutable
sealed class PengkajianKebidananAwalKebidananEvent {}

class OnGetPengkajianEvent extends PengkajianKebidananAwalKebidananEvent {
  final String noReg;
  final String person;
  final String noRM;
  OnGetPengkajianEvent({
    required this.noReg,
    required this.person,
    required this.noRM,
  });
}
