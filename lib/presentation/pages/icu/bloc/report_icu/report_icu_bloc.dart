import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_icu_event.dart';
part 'report_icu_state.dart';

class ReportIcuBloc extends Bloc<ReportIcuEvent, ReportIcuState> {
  ReportIcuBloc() : super(ReportIcuState.initial()) {
    on<ReportIcuEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
