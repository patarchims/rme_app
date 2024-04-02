import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'riwayat_penyakit_keluarga_event.dart';
part 'riwayat_penyakit_keluarga_state.dart';

class RiwayatPenyakitKeluargaBloc
    extends Bloc<RiwayatPenyakitKeluargaEvent, RiwayatPenyakitKeluargaState> {
  RiwayatPenyakitKeluargaBloc()
      : super(RiwayatPenyakitKeluargaState.initial()) {
    on<RiwayatPenyakitKeluargaEvent>((event, emit) {});
  }
}
