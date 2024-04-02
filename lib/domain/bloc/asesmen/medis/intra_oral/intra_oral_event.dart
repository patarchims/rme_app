part of 'intra_oral_bloc.dart';

@freezed
class IntraOralEvent with _$IntraOralEvent {
  const factory IntraOralEvent.started() = _Started;
  const factory IntraOralEvent.getData({required String noReg}) = _GetData;
  const factory IntraOralEvent.saveData(
      {required DataIntraOralModel dataIntraOralModel}) = _SaveData;
}
