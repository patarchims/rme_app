import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_sign_anak_bloc_event.dart';
part 'vital_sign_anak_bloc_state.dart';

class VitalSignAnakBlocBloc
    extends Bloc<VitalSignAnakBlocEvent, VitalSignAnakBlocState> {
  VitalSignAnakBlocBloc() : super(VitalSignAnakBlocState.initial()) {
    on<VitalSignAnakBlocEvent>((event, emit) {});
  }
}
