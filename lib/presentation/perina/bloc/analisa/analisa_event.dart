// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'analisa_bloc.dart';

@immutable
sealed class AnalisaEvent {}

class OnGetDiagnosaKeperawatan extends AnalisaEvent {}

class OnAddDiagnosaKeperawatan extends AnalisaEvent {
  final DiagnosaKeperawatanModel diagnosa;
  OnAddDiagnosaKeperawatan({
    required this.diagnosa,
  });
}

class OnDeleteAnalisaKeperawatan extends AnalisaEvent {
  final String kodeAnalisa;
  OnDeleteAnalisaKeperawatan({
    required this.kodeAnalisa,
  });
}

class OnRemoveDiagnosaKeperawatan extends AnalisaEvent {
  final DiagnosaKeperawatanModel diagnosa;
  OnRemoveDiagnosaKeperawatan({
    required this.diagnosa,
  });
}

class OnValidasiAnalisaDataEvent extends AnalisaEvent {
  final String kodeAnalisa;
  final String tanggal;
  final String jam;
  final String noReg;
  OnValidasiAnalisaDataEvent({
    required this.kodeAnalisa,
    required this.tanggal,
    required this.jam,
    required this.noReg,
  });
}

class OnSaveDiagnosaKeperawatan extends AnalisaEvent {
  final String noReg;
  final String data;
  final List<DiagnosaKeperawatanModel> diagnosa;
  OnSaveDiagnosaKeperawatan({
    required this.noReg,
    required this.data,
    required this.diagnosa,
  });
}

class OnGetAnalisaDataEvent extends AnalisaEvent {
  final String noReg;
  OnGetAnalisaDataEvent({
    required this.noReg,
  });
}
