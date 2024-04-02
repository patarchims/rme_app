part of 'create_user_bloc.dart';

@freezed
class CreateUserEvent with _$CreateUserEvent {
  const factory CreateUserEvent.started() = _Started;

  const factory CreateUserEvent.selectedUserLogin({required String selected}) =
      _SelectedUserLogin;

  const factory CreateUserEvent.cariDokter({required String idDokter}) =
      _CariDokter;

  const factory CreateUserEvent.verifikasiAkun({required String kodeActivasi}) =
      _CreateUserEvent;

  const factory CreateUserEvent.clearUser() = _CleaUser;

  const factory CreateUserEvent.changeKodeModul({required String kodeModul}) =
      _ChangeKodeModul;

  const factory CreateUserEvent.addUser({required KaryawanModel userModel}) =
      _AddUser;

  const factory CreateUserEvent.getKpelayanan() = _GetKpelayanan;

  const factory CreateUserEvent.registerUser(
      {required String nik,
      required String kodeModul,
      required String password}) = _RegisterUser;

  const factory CreateUserEvent.getKaryawan({required String params}) =
      _GetKaryawan;
}
