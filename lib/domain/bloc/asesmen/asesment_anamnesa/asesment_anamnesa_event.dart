// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesment_anamnesa_bloc.dart';

@immutable
class AsesmentAnamnesaEvent {}

class OnGetDiagnosa extends AsesmentAnamnesaEvent {
  final String noreg;
  OnGetDiagnosa({
    required this.noreg,
  });
}

class OnGetKeluhanUtama extends AsesmentAnamnesaEvent {}

class OnGetRiwayatSekarang extends AsesmentAnamnesaEvent {}

class OnGetRiwayatPenyakit extends AsesmentAnamnesaEvent {}

class OnGetRiwayatPenyakitKeluarga extends AsesmentAnamnesaEvent {}

class OnFilterKeluhanUtama extends AsesmentAnamnesaEvent {
  final String value;
  OnFilterKeluhanUtama({
    required this.value,
  });
}
class OnGetAsesmenDokterForPerawat extends AsesmentAnamnesaEvent {
  final String noReg;
  OnGetAsesmenDokterForPerawat({
    required this.noReg,
  });
}

class OnSelectedKeluhanUtama extends AsesmentAnamnesaEvent {
  final String value;
  OnSelectedKeluhanUtama({
    required this.value,
  });
}

class OnSelectedRiwayatSekarang extends AsesmentAnamnesaEvent {
  final String value;
  OnSelectedRiwayatSekarang({
    required this.value,
  });
}
