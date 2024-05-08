import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengkajian_awal_anak_keperawatan_event.dart';
part 'pengkajian_awal_anak_keperawatan_state.dart';

class PengkajianAwalAnakKeperawatanBloc extends Bloc<
    PengkajianAwalAnakKeperawatanEvent, PengkajianAwalAnakKeperawatanState> {
  PengkajianAwalAnakKeperawatanBloc()
      : super(PengkajianAwalAnakKeperawatanState.initial()) {
    on<PengkajianAwalAnakKeperawatanEvent>((event, emit) {});
  }
}
