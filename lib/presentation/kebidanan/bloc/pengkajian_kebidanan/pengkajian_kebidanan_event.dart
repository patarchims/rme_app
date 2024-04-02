// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_kebidanan_bloc.dart';

@immutable
sealed class PengkajianKebidananEvent {}

// GET ASESMEN
class OnGetAsesmenKebidananEvent extends PengkajianKebidananEvent {
  final String noReg;
  final String person;
  OnGetAsesmenKebidananEvent({
    required this.noReg,
    required this.person,
  });
}

class OnChangedHaidterakhir extends PengkajianKebidananEvent {
  final String value;
  OnChangedHaidterakhir({
    required this.value,
  });
}

class OnChangedHodgeEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedHodgeEvent({
    required this.value,
  });
}

class OnchangedInspeksiEvent extends PengkajianKebidananEvent {
  final String value;
  OnchangedInspeksiEvent({
    required this.value,
  });
}

class OnChangedPalpasiEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedPalpasiEvent({
    required this.value,
  });
}

class OnChangedInspekuloV extends PengkajianKebidananEvent {
  final String value;
  OnChangedInspekuloV({
    required this.value,
  });
}

class OnChangedInspekuloP extends PengkajianKebidananEvent {
  final String value;
  OnChangedInspekuloP({
    required this.value,
  });
}

class OnChangedPemeriksaanDalam extends PengkajianKebidananEvent {
  final String value;
  OnChangedPemeriksaanDalam({
    required this.value,
  });
}

class OnChangedKehamilanG extends PengkajianKebidananEvent {
  final String value;
  OnChangedKehamilanG({
    required this.value,
  });
}

class OnChangedKehamilanP extends PengkajianKebidananEvent {
  final String value;
  OnChangedKehamilanP({
    required this.value,
  });
}

class OnChangePerkiraanPartus extends PengkajianKebidananEvent {
  final String value;
  OnChangePerkiraanPartus({
    required this.value,
  });
}

class OnChangedKehamilanAB extends PengkajianKebidananEvent {
  final String value;
  OnChangedKehamilanAB({
    required this.value,
  });
}

class OnChangedUsiaKehamilanEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedUsiaKehamilanEvent({
    required this.value,
  });
}

class OnChangedHaidEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedHaidEvent({
    required this.value,
  });
}

class OnChangedHamilMudaEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedHamilMudaEvent({
    required this.value,
  });
}

class OnChangedLeopold1 extends PengkajianKebidananEvent {
  final String value;
  OnChangedLeopold1({
    required this.value,
  });
}

class OnChangedLeopold2 extends PengkajianKebidananEvent {
  final String value;
  OnChangedLeopold2({
    required this.value,
  });
}

class OnChangedLeopold3 extends PengkajianKebidananEvent {
  final String value;
  OnChangedLeopold3({
    required this.value,
  });
}

class OnChangedLeopold4 extends PengkajianKebidananEvent {
  final String value;
  OnChangedLeopold4({
    required this.value,
  });
}

class OnChangedHamilTuaEvent extends PengkajianKebidananEvent {
  final String value;
  OnChangedHamilTuaEvent({
    required this.value,
  });
}

class OnChangedTfu extends PengkajianKebidananEvent {
  final String value;
  OnChangedTfu({
    required this.value,
  });
}

class OnChangedNyeriTekan extends PengkajianKebidananEvent {
  final String value;
  OnChangedNyeriTekan({
    required this.value,
  });
}

class OnChangedTbj extends PengkajianKebidananEvent {
  final String value;
  OnChangedTbj({
    required this.value,
  });
}

class OnSaveAsesmenKebidananEvent extends PengkajianKebidananEvent {
  final AsesmenKebidananModel asesmenKebidananModel;
  final String noReg;
  final String pelayanan;
  final String dpjp;
  final String devicesID;
  final String person;
  OnSaveAsesmenKebidananEvent({
    required this.asesmenKebidananModel,
    required this.noReg,
    required this.pelayanan,
    required this.dpjp,
    required this.devicesID,
    required this.person,
  });
}


// SAVE ASESMEN
