import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pengkajian_fisik_keperawatan_event.dart';
part 'pengkajian_fisik_keperawatan_state.dart';

class PengkajianFisikKeperawatanBloc extends Bloc<
    PengkajianFisikKeperawatanEvent, PengkajianFisikKeperawatanState> {
  PengkajianFisikKeperawatanBloc()
      : super(PengkajianFisikKeperawatanState.initial()) {
    on<PengkajianFisikKeperawatanEvent>((event, emit) {});
  }
}
