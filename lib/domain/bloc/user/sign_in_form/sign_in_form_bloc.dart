// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api_failure_handler.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  AuthRepository authRepository;
  SignInFormBloc(this.authRepository) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) => _onEventChanged(event, emit));
  }
  Future<void> _onEventChanged(
      SignInFormEvent event, Emitter<SignInFormState> emit) async {
    await event.maybeMap(
        orElse: () {},
        selectedUserLogin: (e) {
          emit(state.copyWith(selectedUser: e.selectedUser));
        },
        sigInWithUserIdAndPassword: (e) async {
          emit(state.copyWith(loading: true, failOrSuccessResult: none()));

          final signIn = await authRepository.signInWithUserIdAndPassword(
              userID: e.userID, password: e.password, kodeModul: e.kodeModul);

          emit(state.copyWith(
              loading: false, failOrSuccessResult: optionOf(signIn)));

          emit(state.copyWith(loading: false, failOrSuccessResult: none()));
        },
        isHiddenPassword: (e) {
          emit(state.copyWith(isHiddenPassword: e.isHidden));
        },
        signInWithEmailAndPassword: (e) async {
          emit(state.copyWith(loading: true, failOrSuccessResult: none()));

          final signIn = await authRepository.signInWithEmailAndPassword(
              email: e.email, password: e.password, kodeModul: e.kodeModul);

          emit(state.copyWith(
              loading: false, failOrSuccessResult: optionOf(signIn)));

          emit(state.copyWith(loading: false, failOrSuccessResult: none()));
        });
  }
}
