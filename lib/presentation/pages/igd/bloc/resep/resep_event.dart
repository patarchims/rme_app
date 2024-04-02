// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resep_bloc.dart';

@immutable
sealed class ResepEvent {}

class OnGetResepObatEvent extends ResepEvent {}

class OnAddResepObatEvent extends ResepEvent {
  final KTaripObatModel obat;
  OnAddResepObatEvent({
    required this.obat,
  });
}

class OnDeleteResepObatEvent extends ResepEvent {
  final KTaripObatModel kTaripObatModel;
  OnDeleteResepObatEvent({
    required this.kTaripObatModel,
  });
}

class OnChangeInformasiResepEvent extends ResepEvent {
  final String value;
  OnChangeInformasiResepEvent({
    required this.value,
  });
}

class OnSaveResepObatEvent extends ResepEvent {
  final String noReg;
  final String noRM;
  final String catatan;
  final String keterangan;
  final String deviceID;
  final String namaUser;
  final String namaPasien;
  final List<KTaripObatModel> selectionResep;
  OnSaveResepObatEvent({
    required this.namaPasien,
    required this.noReg,
    required this.noRM,
    required this.catatan,
    required this.keterangan,
    required this.deviceID,
    required this.namaUser,
    required this.selectionResep,
  });
}
