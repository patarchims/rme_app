part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.addUser({required UserModel userModel}) = _AddUser;
  const factory AuthEvent.signOut() = _SignOut;
}
