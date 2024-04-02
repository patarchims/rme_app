import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/hemodialisis/repository/bhp_hd_response_repository_mode.dart';
import 'package:hms_app/presentation/hemodialisis/services/bhp_services.dart';

part 'bhp_event.dart';
part 'bhp_state.dart';

class BhpBloc extends Bloc<BhpEvent, BhpState> {
  BhpBloc() : super(BhpState.initial()) {
    on<BhpEvent>((event, emit) {});
    on<OnGetBHPHD>(_onGetBHPHaemodalisa);
    on<OnChanged1A>(_onChanged1A);
    on<OnChanged1B>(_onChanged1B);
    on<Onchanged1C>(_onChanged1C);
    on<OnChanged2A>(_onChanged2A);
    on<OnChanged2B>(_onChanged2B);
    on<Onchanged3>(_onChanged3);
    on<Onchanged4>(_onChanged4);
    on<Onchanged5>(_onChanged5);
    on<Onchanged6>(_onChanged6);
  }

  Future<void> _onGetBHPHaemodalisa(
    OnGetBHPHD event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loading,
        bhpHaemodalisaModel: state.bhpHaemodalisaModel));

    try {
      final getData = await bhpServices.getBHPHD(noReg: event.noReg);

      BhpHaemodalisaModel newData =
          BhpHaemodalisaModel.fromJson(getData["response"]);

      log(newData.toString());

      emit(state.copyWith(
          status: BHPStatus.loaded, bhpHaemodalisaModel: newData));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          status: BHPStatus.error,
          bhpHaemodalisaModel: state.bhpHaemodalisaModel));
    }
  }

  Future<void> _onChanged1A(
    OnChanged1A event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item1A: event.selection)));
  }

  Future<void> _onChanged1B(
    OnChanged1B event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item1B: event.selection)));
  }

  Future<void> _onChanged1C(
    Onchanged1C event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item1C: event.selection)));
  }

  Future<void> _onChanged2A(
    OnChanged2A event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item2A: event.selection)));
  }

  Future<void> _onChanged2B(
    OnChanged2B event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item2B: event.selection)));
  }

  Future<void> _onChanged3(
    Onchanged3 event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item3: event.selection)));
  }

  Future<void> _onChanged4(
    Onchanged4 event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item4: event.selection)));
  }

  Future<void> _onChanged5(
    Onchanged5 event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item5: event.selection)));
  }

  Future<void> _onChanged6(
    Onchanged6 event,
    Emitter<BhpState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: BHPStatus.loaded,
        bhpHaemodalisaModel:
            state.bhpHaemodalisaModel.copyWith(item6: event.selection)));
  }
}
