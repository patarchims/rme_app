// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_persistem_keperawatan_bloc.dart';

@immutable
sealed class PengkajianPersistemKeperawatanEvent {}

class OnGetPengkajianPersistem extends PengkajianPersistemKeperawatanEvent {
  final String noReg;
  final String noRM;
  final String person;
  OnGetPengkajianPersistem({
    required this.noReg,
    required this.noRM,
    required this.person,
  });
}

class OnSavePengkajianPersistemKeperawatan
    extends PengkajianPersistemKeperawatanEvent {
  final PengkajianKeperawatanPesistemModel pengkajianKeperawatanPesistemModel;
  final String noReg;
  final String person;
  final String pelayanan;
  final String devicesID;
  OnSavePengkajianPersistemKeperawatan({
    required this.pengkajianKeperawatanPesistemModel,
    required this.noReg,
    required this.person,
    required this.pelayanan,
    required this.devicesID,
  });
}
