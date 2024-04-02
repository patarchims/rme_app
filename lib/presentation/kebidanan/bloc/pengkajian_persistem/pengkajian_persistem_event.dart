part of 'pengkajian_persistem_bloc.dart';

@immutable
sealed class PengkajianPersistemEvent {}

class OnGetPengkajianPersistemEvent extends PengkajianPersistemEvent {
  final String noReg;
  final String person;
  OnGetPengkajianPersistemEvent({
    required this.noReg,
    required this.person,
  });
}

class OnChangedEliminasiBAK extends PengkajianPersistemEvent {
  final String value;
  OnChangedEliminasiBAK({
    required this.value,
  });
}

class OnSavePengkajianPersistemEvent extends PengkajianPersistemEvent {
  final String noReg;
  final String person;
  final String pelayanan;
  final String deviceID;
  final PengkajianPersistemKebidananResponse pengkajian;
  OnSavePengkajianPersistemEvent({
    required this.noReg,
    required this.person,
    required this.pelayanan,
    required this.deviceID,
    required this.pengkajian,
  });
}

class OnChangedEliminasiBAB extends PengkajianPersistemEvent {
  final String value;
  OnChangedEliminasiBAB({
    required this.value,
  });
}

class OnChangedIstirahat extends PengkajianPersistemEvent {
  final String value;
  OnChangedIstirahat({
    required this.value,
  });
}

class OnChangedAktivitas extends PengkajianPersistemEvent {
  final String value;
  OnChangedAktivitas({
    required this.value,
  });
}

class OnChangedMandi extends PengkajianPersistemEvent {
  final String value;
  OnChangedMandi({
    required this.value,
  });
}

class OnChangedBerpakaian extends PengkajianPersistemEvent {
  final String value;
  OnChangedBerpakaian({
    required this.value,
  });
}

class OnChangedMakan extends PengkajianPersistemEvent {
  final String value;
  OnChangedMakan({
    required this.value,
  });
}

class OnChangedEliminasi extends PengkajianPersistemEvent {
  final String value;
  OnChangedEliminasi({
    required this.value,
  });
}

class OnChangedMobilisasi extends PengkajianPersistemEvent {
  final String value;
  OnChangedMobilisasi({
    required this.value,
  });
}

class OnChangedKardiovaskuler extends PengkajianPersistemEvent {
  final String value;
  OnChangedKardiovaskuler({
    required this.value,
  });
}

class OnChangedRespiratori extends PengkajianPersistemEvent {
  final String value;
  OnChangedRespiratori({
    required this.value,
  });
}

class OnChangedPerusiSecebral extends PengkajianPersistemEvent {
  final String value;
  OnChangedPerusiSecebral({
    required this.value,
  });
}

class OnChangedThermoregulasi extends PengkajianPersistemEvent {
  final String value;
  OnChangedThermoregulasi({
    required this.value,
  });
}

class OnChangedPerfusiPefifer extends PengkajianPersistemEvent {
  final String value;
  OnChangedPerfusiPefifer({
    required this.value,
  });
}

class OnChangedSistemPencernaan extends PengkajianPersistemEvent {
  final String value;
  OnChangedSistemPencernaan({
    required this.value,
  });
}

class OnChangedIntegumen extends PengkajianPersistemEvent {
  final String value;
  OnChangedIntegumen({
    required this.value,
  });
}

class OnChangedKenyamanan extends PengkajianPersistemEvent {
  final String value;
  OnChangedKenyamanan({
    required this.value,
  });
}

class OnChangedProteksi extends PengkajianPersistemEvent {
  final String value;
  OnChangedProteksi({
    required this.value,
  });
}

class OnChangedPapsSmer extends PengkajianPersistemEvent {
  final String value;
  OnChangedPapsSmer({
    required this.value,
  });
}

class OnChangedHamil extends PengkajianPersistemEvent {
  final String value;
  OnChangedHamil({
    required this.value,
  });
}

class OnChangedPendaharan extends PengkajianPersistemEvent {
  final String value;
  OnChangedPendaharan({
    required this.value,
  });
}

class OnChangedHambatanBahasa extends PengkajianPersistemEvent {
  final String value;
  OnChangedHambatanBahasa({
    required this.value,
  });
}

class OnChangedCaraBelajar extends PengkajianPersistemEvent {
  final String value;
  OnChangedCaraBelajar({
    required this.value,
  });
}

class OnChangedBahasaSehari extends PengkajianPersistemEvent {
  final String value;
  OnChangedBahasaSehari({
    required this.value,
  });
}

class OnChangedSpikologis extends PengkajianPersistemEvent {
  final String value;
  OnChangedSpikologis({
    required this.value,
  });
}

class OnChangedHambatanSosial extends PengkajianPersistemEvent {
  final String value;
  OnChangedHambatanSosial({
    required this.value,
  });
}

class OnChangedHambatanEkomoni extends PengkajianPersistemEvent {
  final String value;
  OnChangedHambatanEkomoni({
    required this.value,
  });
}

class OnChangedHambatanSpiritual extends PengkajianPersistemEvent {
  final String value;
  OnChangedHambatanSpiritual({
    required this.value,
  });
}

class OnChangedResponseEmosi extends PengkajianPersistemEvent {
  final String value;
  OnChangedResponseEmosi({
    required this.value,
  });
}

class OnChangedNilaiKepercayaaan extends PengkajianPersistemEvent {
  final String value;
  OnChangedNilaiKepercayaaan({
    required this.value,
  });
}

class OnChangedPresepsiSakit extends PengkajianPersistemEvent {
  final String value;
  OnChangedPresepsiSakit({
    required this.value,
  });
}

class OnChangedKhususKepercayaan extends PengkajianPersistemEvent {
  final String value;
  OnChangedKhususKepercayaan({
    required this.value,
  });
}
