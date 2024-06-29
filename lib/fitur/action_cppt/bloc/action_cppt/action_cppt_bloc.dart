import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';

part 'action_cppt_event.dart';
part 'action_cppt_state.dart';

class ActionCpptBloc extends Bloc<ActionCpptEvent, ActionCpptState> {
  ActionCpptBloc() : super(ActionCpptState.initial()) {
    on<ActionCpptEvent>((event, emit) {});
  }
}
