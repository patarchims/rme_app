import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pemeriksaan_fisik_icu_event.dart';
part 'pemeriksaan_fisik_icu_state.dart';

class PemeriksaanFisikIcuBloc
    extends Bloc<PemeriksaanFisikIcuEvent, PemeriksaanFisikIcuState> {
  PemeriksaanFisikIcuBloc() : super(PemeriksaanFisikIcuState.initial()) {
    on<PemeriksaanFisikIcuEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
