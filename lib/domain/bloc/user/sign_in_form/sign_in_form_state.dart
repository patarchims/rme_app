part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Option<Either<ApiFailureResult, ApiSuccessResult>>
        failOrSuccessResult,
    required bool loading,
    required bool isHidden,
    required bool isHiddenPassword,
    required String selectedUser,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
      failOrSuccessResult: none(),
      selectedUser: "POL025",
      isHiddenPassword: true,
      loading: false,
      isHidden: false);
}
