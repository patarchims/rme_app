import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'riwayat_keperawatan_event.dart';
part 'riwayat_keperawatan_state.dart';

class RiwayatKeperawatanBloc
    extends Bloc<RiwayatKeperawatanEvent, RiwayatKeperawatanState> {
  RiwayatKeperawatanBloc() : super(RiwayatKeperawatanState.initial()) {
    on<RiwayatKeperawatanEvent>((event, emit) {});
  }
}
