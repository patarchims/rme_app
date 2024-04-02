part of 'input_diagnosa_bloc.dart';

@freezed
class InputDiagnosaEvent with _$InputDiagnosaEvent {
  const factory InputDiagnosaEvent.started() = _Started;
  const factory InputDiagnosaEvent.addDiagnosa(
      {required DiagnosaModel diagnosaModel}) = _AddDiagnosa;
  const factory InputDiagnosaEvent.getDiagnosa({required String noreg}) =
      _GetDiagnosa;

  const factory InputDiagnosaEvent.saveDiagnosa({
    required String noreg,
    required String code,
    required String type,
    required String table,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) = _SaveDiagnosa;

  const factory InputDiagnosaEvent.addPrimaryDiagnosa(
      {required DiagnosaIcdModel diagnosaIcdModel}) = _AddPrimaryDiagnosa;
  const factory InputDiagnosaEvent.addSecondaryDiagnosa(
      {required DiagnosaIcdModel diagnosaIcdModel}) = _AddSecondaryDiagnosa;
  const factory InputDiagnosaEvent.onGetDiagnosa() = _OnGetDiagnosa;
  const factory InputDiagnosaEvent.enableButton({required int index}) =
      _EnableButton;
  const factory InputDiagnosaEvent.deleteButton({required int index}) =
      _DeleteButton;
  const factory InputDiagnosaEvent.deleteItem(
      {required String noReg, required String table}) = _DeleteItem;
  const factory InputDiagnosaEvent.addListDiagnosa({required int index}) =
      _AddListDiagnosa;
}
