part of 'data_medik_bloc.dart';

@freezed
class DataMedikEvent with _$DataMedikEvent {
  const factory DataMedikEvent.started() = _Started;
  const factory DataMedikEvent.getDataMedik({required String noreg}) =
      _GetDataMedik;
  const factory DataMedikEvent.saveDataMedik({
    required String noReg,
    required String golDarah,
    required String tekananDarah,
    required String tekananDarahDetail,
    required String penyJantung,
    required String penyJantungDetail,
    required String diabet,
    required String diabetDetail,
    required String haemop,
    required String haemopDetail,
    required String hepat,
    required String hepatDetail,
    required String penyLain,
    required String penyLainDetail,
    required String alergiObat,
    required String alergiObatDetail,
    required String alergiMakanan,
    required String alergiMakananDetail,
    required String kebiasaanBuruk,
  }) = _SaveDataMedik;
}
