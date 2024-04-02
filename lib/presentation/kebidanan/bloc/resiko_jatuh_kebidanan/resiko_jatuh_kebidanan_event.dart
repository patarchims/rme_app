// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_kebidanan_bloc.dart';

@immutable
sealed class ResikoJatuhKebidananEvent {}

class OnSaveResikoJatuhKebidanan extends ResikoJatuhKebidananEvent {
  final String device;
  final String noReg;
  final String kategori;
  final String pelayanan;
  final ResikoJatuhKebidananModel resikoJatuhKebidananModel;
  OnSaveResikoJatuhKebidanan({
    required this.device,
    required this.kategori,
    required this.noReg,
    required this.pelayanan,
    required this.resikoJatuhKebidananModel,
  });
}

class OnGetResikoJatuhKebidanan extends ResikoJatuhKebidananEvent {
  final String noReg;
  OnGetResikoJatuhKebidanan({
    required this.noReg,
  });
}

class OnChangedRiwayatJatuh extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedRiwayatJatuh({
    required this.value,
  });
}

class OnChangedDiagnosa extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedDiagnosa({
    required this.value,
  });
}

class OnChangedAlatBantu1 extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedAlatBantu1({
    required this.value,
  });
}

class OnChangedAlatBantu2 extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedAlatBantu2({
    required this.value,
  });
}

class OnChangedAlatBantu3 extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedAlatBantu3({
    required this.value,
  });
}

class OnChangedInfuse extends ResikoJatuhKebidananEvent {
  final String value;
  OnChangedInfuse({
    required this.value,
  });
}
