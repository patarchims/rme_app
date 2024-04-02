part of 'odontogram_bloc.dart';

@freezed
class OdontogramEvent with _$OdontogramEvent {
  const factory OdontogramEvent.started() = _Started;
  const factory OdontogramEvent.startLoading() = _StartLoading;
  const factory OdontogramEvent.saveOdontogram({
    required String imageUrl,
    required String norReg,
  }) = _SaveOdontogram;
  const factory OdontogramEvent.getOdontogram() = _GetOdontogram;
}
