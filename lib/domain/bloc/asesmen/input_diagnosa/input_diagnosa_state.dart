part of 'input_diagnosa_bloc.dart';

@freezed
class InputDiagnosaState with _$InputDiagnosaState {
  factory InputDiagnosaState({
    @Default(false) bool isLoading,
    @Default(false) bool isAdd,
    @Default(false) bool isGet,
    @Default(false) bool isDelete,
    @Default(false) bool isSave,
    @Default(false) bool isErrorSaveData,
    @Default("") String errorMessage,
    @Default(null) DiagnosaModel? diagnosaModel,
    @Default([]) List<DiagnosaIcdModel> diagnosaICD,
    @Default([]) List<DiagnosaIcdModel> diagnosaSecondary,
    @Default([]) List<DiagnosaModel> diagnosa,
    @Default(0) int enableDelete,
    @Default(0) int enableAdd,
  }) = _InputDiagnosaState;
}
