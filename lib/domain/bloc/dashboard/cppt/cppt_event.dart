part of 'cppt_bloc.dart';

@freezed
class CpptEvent with _$CpptEvent {
  const factory CpptEvent.started() = _Started;

  const factory CpptEvent.onGetCPPTPasien({required String noRM}) =
      _OnGetCPPTPasien;

  const factory CpptEvent.onDeleteCPPTPasien(
      {required String noRM, required int no}) = _OnDeleteCPPTPasien;

  const factory CpptEvent.saveCPPTPasien(
      {required String deviceID,
      required String waktu,
      required String kelompok,
      required String kdbagian,
      required String noReg,
      required String dpjp,
      required String subjetif,
      required String objektif,
      required String asesmen,
      required String pelayanan,
      required String ppa,
      required String plan}) = _SaveCPPTPasien;

  const factory CpptEvent.onUpdateCPPT(
      {required int idCppt,
      required String bagian,
      required String subjetif,
      required String objektif,
      required String asesmen,
      required String ppa,
      required String instruksiPPA,
      required String plan}) = _OnUpdateCPPT;
}
