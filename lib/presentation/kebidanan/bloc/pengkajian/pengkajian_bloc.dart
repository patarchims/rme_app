import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengkajian_event.dart';
part 'pengkajian_state.dart';

class PengkajianBloc extends Bloc<PengkajianEvent, PengkajianState> {
  PengkajianBloc() : super(PengkajianState.initial()) {
    on<PengkajianEvent>((event, emit) {});
  }
}
