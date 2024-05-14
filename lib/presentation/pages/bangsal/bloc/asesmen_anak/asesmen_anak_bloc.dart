import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asesmen_anak_event.dart';
part 'asesmen_anak_state.dart';

class AsesmenAnakBloc extends Bloc<AsesmenAnakEvent, AsesmenAnakState> {
  AsesmenAnakBloc() : super(AsesmenAnakState.initial()) {
    on<AsesmenAnakEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
