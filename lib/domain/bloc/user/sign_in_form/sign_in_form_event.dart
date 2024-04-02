part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.selectedUserLogin(
      {required String selectedUser}) = _SelectedUserLogin;
  const factory SignInFormEvent.started() = _Started;
  const factory SignInFormEvent.isHiddenPassword({required bool isHidden}) =
      _IsHiddenPassword;
  const factory SignInFormEvent.signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String kodeModul}) = _SignInWithEmailAndPassword;
  const factory SignInFormEvent.sigInWithUserIdAndPassword(
      {required String userID,
      required String password,
      required String kodeModul}) = _SigInWithUserIdAndPassword;
}
