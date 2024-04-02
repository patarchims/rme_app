// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diagnosa_kebidanan_bloc.dart';

@immutable
sealed class DiagnosaKebidananEvent {}

class OnGetDiagnosaKebidanan extends DiagnosaKebidananEvent {}

class OnSelectedDiagnosaKebidanan extends DiagnosaKebidananEvent {
  final int indexDiagnosa;
  final DiagnosaKebidananModel diagnosa;
  OnSelectedDiagnosaKebidanan({
    required this.indexDiagnosa,
    required this.diagnosa,
  });
}

class OnDeleteDiagnosaKebidananEvent extends DiagnosaKebidananEvent {
  final int noDiagnosa;
  OnDeleteDiagnosaKebidananEvent({
    required this.noDiagnosa,
  });
}

class OnSaveDiagnosaSelectedEvent extends DiagnosaKebidananEvent {
  final String noReg;
  final String deviceID;
  final String userID;
  final List<DiagnosaKebidananModel> diagnosaList;
  OnSaveDiagnosaSelectedEvent({
    required this.noReg,
    required this.deviceID,
    required this.userID,
    required this.diagnosaList,
  });
}

class OnGetDiagnosaKebidananEvent extends DiagnosaKebidananEvent {
  final String noReg;
  OnGetDiagnosaKebidananEvent({
    required this.noReg,
  });
}
