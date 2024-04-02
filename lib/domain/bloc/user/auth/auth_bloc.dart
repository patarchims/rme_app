import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/token/token_pref.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(AuthEvent event, Emitter<AuthState> emit) async {
    await event.maybeMap(
        orElse: () {},
        signOut: (e) async {
          await TokenPref.deleteToken();
          emit(const AuthState.unauthenticated());
        },
        started: (e) {},
        addUser: (e) {
          emit(AuthState.authenticated(user: e.userModel));
        });
  }
}
