// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'deteksi_resiko_jatuh_bloc.dart';

@immutable
sealed class DeteksiResikoJatuhEvent {}

class OnDetectionResikoJatuhEvent extends DeteksiResikoJatuhEvent {
  final String noReg;
  OnDetectionResikoJatuhEvent({
    required this.noReg,
  });
}

class OnGetDetectionResikoJatuhEvent extends DeteksiResikoJatuhEvent {
  final String noReg;
  OnGetDetectionResikoJatuhEvent({
    required this.noReg,
  });
}
