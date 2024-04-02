part of 'rawat_jalan_bloc.dart';

@freezed
class RawatJalanEvent with _$RawatJalanEvent {
  const factory RawatJalanEvent.started() = _Started;
  const factory RawatJalanEvent.getMasalahMedis() = _GetMasalahMedis;
  const factory RawatJalanEvent.addDiagnosa(
      {required List<DiagnosaIcdModel> diagnosa}) = _AddDiagnosa;
  const factory RawatJalanEvent.getTerapi() = _GetTerapi;
  const factory RawatJalanEvent.selectMasalahMedis({required String value}) =
      _SelectMasalahMedis;
  const factory RawatJalanEvent.selectedTerapi({required String value}) =
      _SelectTerapi;
  const factory RawatJalanEvent.selectedDiagnosa(
      {required DiagnosaIcdModel diagnosaIcdModel}) = _SelectedDiagnosa;
  const factory RawatJalanEvent.getDiagnosa(
      {required String code, int? page, int? limit}) = _GetDiagnosa;
}
