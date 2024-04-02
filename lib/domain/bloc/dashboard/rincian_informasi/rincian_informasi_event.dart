part of 'rincian_informasi_bloc.dart';

@freezed
class RincianInformasiEvent with _$RincianInformasiEvent {
  const factory RincianInformasiEvent.started() = _Started;
  const factory RincianInformasiEvent.lainLain({required String value}) =
      _LainLain;
  const factory RincianInformasiEvent.tidakDilakukanTindakan(
      {required String value}) = _TidakDilakukanTindakan;
  const factory RincianInformasiEvent.addRisikoDanKompilasi(
      {required String value}) = _AddRisikoDanKompilasi;
  const factory RincianInformasiEvent.addPrognosis({required String value}) =
      _AddPrognosis;
  const factory RincianInformasiEvent.addAlternatif({required String value}) =
      _AddAlternatif;
  const factory RincianInformasiEvent.addTujuanTindakan(
      {required String value}) = _AddTujuanTindakan;
  const factory RincianInformasiEvent.addTataCara({required String value}) =
      _AddTataCara;
  const factory RincianInformasiEvent.addIndikasiTindakan(
      {required String value}) = _AddIndikasiTindakan;
  const factory RincianInformasiEvent.addDasarDiagnosis(
      {required String value}) = _AddDasarDiagnosis;
  const factory RincianInformasiEvent.getBankData({required String kategori}) =
      _GetBankData;
  const factory RincianInformasiEvent.getDiagnosis() = _GetDiagnosis;
  const factory RincianInformasiEvent.addDiagnosis(
      {required List<DiagnosaIcdModel> diagsnosis}) = _AddDiagnosis;
  const factory RincianInformasiEvent.getModelDiagnosa() = _GetModelDiagnosa;
  const factory RincianInformasiEvent.saveDiagnosis() = _SaveDiagnosis;
  const factory RincianInformasiEvent.addAKerjaValue({required String value}) =
      _AddAKerjaValue;
  const factory RincianInformasiEvent.addBandingValue({required String value}) =
      _AddBandingValue;
}
