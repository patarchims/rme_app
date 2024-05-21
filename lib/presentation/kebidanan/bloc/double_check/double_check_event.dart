// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'double_check_bloc.dart';

@immutable
sealed class DoubleCheckEvent {}

class OnInitCheckHigh extends DoubleCheckEvent {}

class OnGetDoubleCheckEvent extends DoubleCheckEvent {
  final String noReg;
  OnGetDoubleCheckEvent({
    required this.noReg,
  });
}

class OnChangedPasien extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedPasien({
    required this.isChanged,
  });
}

class OnChangedVerifyPasien extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyPasien({
    required this.isChanged,
  });
}

class OnSaveDoubleCheckVerify extends DoubleCheckEvent {
  final String noReg;
  final bool pasien;
  final bool obat;
  final bool dosis;
  final bool cara;
  final bool waktu;
  final bool informasi;
  final bool dokumentasi;
  OnSaveDoubleCheckVerify({
    required this.noReg,
    required this.pasien,
    required this.obat,
    required this.dosis,
    required this.cara,
    required this.waktu,
    required this.informasi,
    required this.dokumentasi,
  });
}

class OnSaveDoubleCheckHigh extends DoubleCheckEvent {
  final String noReg;
  final String devices;
  final bool pasien;
  final bool obat;
  final bool dosis;
  final bool cara;
  final bool waktu;
  final bool informasi;
  final bool dokumentasi;
  final String keterangan;

  OnSaveDoubleCheckHigh({
    required this.noReg,
    required this.devices,
    required this.pasien,
    required this.obat,
    required this.dosis,
    required this.cara,
    required this.waktu,
    required this.informasi,
    required this.dokumentasi,
    required this.keterangan,
  });
}

class OnChangedDosis extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedDosis({
    required this.isChanged,
  });
}

class OnChangedVerifyDosis extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyDosis({
    required this.isChanged,
  });
}

class OnChangedObat extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedObat({
    required this.isChanged,
  });
}

class OnChangedVerifyObat extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyObat({
    required this.isChanged,
  });
}

class OnChangedCara extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedCara({
    required this.isChanged,
  });
}

class OnChangedVerifyCara extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyCara({
    required this.isChanged,
  });
}

class OnChangedWaktu extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedWaktu({
    required this.isChanged,
  });
}

class OnChangedVerifyWaktu extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyWaktu({
    required this.isChanged,
  });
}

class OnChangedInformasi extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedInformasi({
    required this.isChanged,
  });
}

class OnChangedVerifyInformasi extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedVerifyInformasi({
    required this.isChanged,
  });
}

class OnChangedDokumentasi extends DoubleCheckEvent {
  final bool isChanged;
  OnChangedDokumentasi({
    required this.isChanged,
  });
}

class OnChangedKeterangan extends DoubleCheckEvent {
  final String keterangan;
  OnChangedKeterangan({
    required this.keterangan,
  });
}
