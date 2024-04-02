// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res, SignInFormEvent>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res, $Val extends SignInFormEvent>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectedUserLoginImplCopyWith<$Res> {
  factory _$$SelectedUserLoginImplCopyWith(_$SelectedUserLoginImpl value,
          $Res Function(_$SelectedUserLoginImpl) then) =
      __$$SelectedUserLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedUser});
}

/// @nodoc
class __$$SelectedUserLoginImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$SelectedUserLoginImpl>
    implements _$$SelectedUserLoginImplCopyWith<$Res> {
  __$$SelectedUserLoginImplCopyWithImpl(_$SelectedUserLoginImpl _value,
      $Res Function(_$SelectedUserLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUser = null,
  }) {
    return _then(_$SelectedUserLoginImpl(
      selectedUser: null == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedUserLoginImpl implements _SelectedUserLogin {
  const _$SelectedUserLoginImpl({required this.selectedUser});

  @override
  final String selectedUser;

  @override
  String toString() {
    return 'SignInFormEvent.selectedUserLogin(selectedUser: $selectedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedUserLoginImpl &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedUserLoginImplCopyWith<_$SelectedUserLoginImpl> get copyWith =>
      __$$SelectedUserLoginImplCopyWithImpl<_$SelectedUserLoginImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) {
    return selectedUserLogin(selectedUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) {
    return selectedUserLogin?.call(selectedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (selectedUserLogin != null) {
      return selectedUserLogin(selectedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) {
    return selectedUserLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) {
    return selectedUserLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (selectedUserLogin != null) {
      return selectedUserLogin(this);
    }
    return orElse();
  }
}

abstract class _SelectedUserLogin implements SignInFormEvent {
  const factory _SelectedUserLogin({required final String selectedUser}) =
      _$SelectedUserLoginImpl;

  String get selectedUser;
  @JsonKey(ignore: true)
  _$$SelectedUserLoginImplCopyWith<_$SelectedUserLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SignInFormEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignInFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$IsHiddenPasswordImplCopyWith<$Res> {
  factory _$$IsHiddenPasswordImplCopyWith(_$IsHiddenPasswordImpl value,
          $Res Function(_$IsHiddenPasswordImpl) then) =
      __$$IsHiddenPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isHidden});
}

/// @nodoc
class __$$IsHiddenPasswordImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$IsHiddenPasswordImpl>
    implements _$$IsHiddenPasswordImplCopyWith<$Res> {
  __$$IsHiddenPasswordImplCopyWithImpl(_$IsHiddenPasswordImpl _value,
      $Res Function(_$IsHiddenPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHidden = null,
  }) {
    return _then(_$IsHiddenPasswordImpl(
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsHiddenPasswordImpl implements _IsHiddenPassword {
  const _$IsHiddenPasswordImpl({required this.isHidden});

  @override
  final bool isHidden;

  @override
  String toString() {
    return 'SignInFormEvent.isHiddenPassword(isHidden: $isHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsHiddenPasswordImpl &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsHiddenPasswordImplCopyWith<_$IsHiddenPasswordImpl> get copyWith =>
      __$$IsHiddenPasswordImplCopyWithImpl<_$IsHiddenPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) {
    return isHiddenPassword(isHidden);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) {
    return isHiddenPassword?.call(isHidden);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (isHiddenPassword != null) {
      return isHiddenPassword(isHidden);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) {
    return isHiddenPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) {
    return isHiddenPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (isHiddenPassword != null) {
      return isHiddenPassword(this);
    }
    return orElse();
  }
}

abstract class _IsHiddenPassword implements SignInFormEvent {
  const factory _IsHiddenPassword({required final bool isHidden}) =
      _$IsHiddenPasswordImpl;

  bool get isHidden;
  @JsonKey(ignore: true)
  _$$IsHiddenPasswordImplCopyWith<_$IsHiddenPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithEmailAndPasswordImplCopyWith<$Res> {
  factory _$$SignInWithEmailAndPasswordImplCopyWith(
          _$SignInWithEmailAndPasswordImpl value,
          $Res Function(_$SignInWithEmailAndPasswordImpl) then) =
      __$$SignInWithEmailAndPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String kodeModul});
}

/// @nodoc
class __$$SignInWithEmailAndPasswordImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res,
        _$SignInWithEmailAndPasswordImpl>
    implements _$$SignInWithEmailAndPasswordImplCopyWith<$Res> {
  __$$SignInWithEmailAndPasswordImplCopyWithImpl(
      _$SignInWithEmailAndPasswordImpl _value,
      $Res Function(_$SignInWithEmailAndPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? kodeModul = null,
  }) {
    return _then(_$SignInWithEmailAndPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInWithEmailAndPasswordImpl implements _SignInWithEmailAndPassword {
  const _$SignInWithEmailAndPasswordImpl(
      {required this.email, required this.password, required this.kodeModul});

  @override
  final String email;
  @override
  final String password;
  @override
  final String kodeModul;

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPassword(email: $email, password: $password, kodeModul: $kodeModul)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailAndPasswordImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.kodeModul, kodeModul) ||
                other.kodeModul == kodeModul));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, kodeModul);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithEmailAndPasswordImplCopyWith<_$SignInWithEmailAndPasswordImpl>
      get copyWith => __$$SignInWithEmailAndPasswordImplCopyWithImpl<
          _$SignInWithEmailAndPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) {
    return signInWithEmailAndPassword(email, password, kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) {
    return signInWithEmailAndPassword?.call(email, password, kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(email, password, kodeModul);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) {
    return signInWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) {
    return signInWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailAndPassword implements SignInFormEvent {
  const factory _SignInWithEmailAndPassword(
      {required final String email,
      required final String password,
      required final String kodeModul}) = _$SignInWithEmailAndPasswordImpl;

  String get email;
  String get password;
  String get kodeModul;
  @JsonKey(ignore: true)
  _$$SignInWithEmailAndPasswordImplCopyWith<_$SignInWithEmailAndPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SigInWithUserIdAndPasswordImplCopyWith<$Res> {
  factory _$$SigInWithUserIdAndPasswordImplCopyWith(
          _$SigInWithUserIdAndPasswordImpl value,
          $Res Function(_$SigInWithUserIdAndPasswordImpl) then) =
      __$$SigInWithUserIdAndPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userID, String password, String kodeModul});
}

/// @nodoc
class __$$SigInWithUserIdAndPasswordImplCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res,
        _$SigInWithUserIdAndPasswordImpl>
    implements _$$SigInWithUserIdAndPasswordImplCopyWith<$Res> {
  __$$SigInWithUserIdAndPasswordImplCopyWithImpl(
      _$SigInWithUserIdAndPasswordImpl _value,
      $Res Function(_$SigInWithUserIdAndPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? password = null,
    Object? kodeModul = null,
  }) {
    return _then(_$SigInWithUserIdAndPasswordImpl(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SigInWithUserIdAndPasswordImpl implements _SigInWithUserIdAndPassword {
  const _$SigInWithUserIdAndPasswordImpl(
      {required this.userID, required this.password, required this.kodeModul});

  @override
  final String userID;
  @override
  final String password;
  @override
  final String kodeModul;

  @override
  String toString() {
    return 'SignInFormEvent.sigInWithUserIdAndPassword(userID: $userID, password: $password, kodeModul: $kodeModul)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SigInWithUserIdAndPasswordImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.kodeModul, kodeModul) ||
                other.kodeModul == kodeModul));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, password, kodeModul);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SigInWithUserIdAndPasswordImplCopyWith<_$SigInWithUserIdAndPasswordImpl>
      get copyWith => __$$SigInWithUserIdAndPasswordImplCopyWithImpl<
          _$SigInWithUserIdAndPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedUser) selectedUserLogin,
    required TResult Function() started,
    required TResult Function(bool isHidden) isHiddenPassword,
    required TResult Function(String email, String password, String kodeModul)
        signInWithEmailAndPassword,
    required TResult Function(String userID, String password, String kodeModul)
        sigInWithUserIdAndPassword,
  }) {
    return sigInWithUserIdAndPassword(userID, password, kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String selectedUser)? selectedUserLogin,
    TResult? Function()? started,
    TResult? Function(bool isHidden)? isHiddenPassword,
    TResult? Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult? Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
  }) {
    return sigInWithUserIdAndPassword?.call(userID, password, kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedUser)? selectedUserLogin,
    TResult Function()? started,
    TResult Function(bool isHidden)? isHiddenPassword,
    TResult Function(String email, String password, String kodeModul)?
        signInWithEmailAndPassword,
    TResult Function(String userID, String password, String kodeModul)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (sigInWithUserIdAndPassword != null) {
      return sigInWithUserIdAndPassword(userID, password, kodeModul);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_Started value) started,
    required TResult Function(_IsHiddenPassword value) isHiddenPassword,
    required TResult Function(_SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
    required TResult Function(_SigInWithUserIdAndPassword value)
        sigInWithUserIdAndPassword,
  }) {
    return sigInWithUserIdAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_Started value)? started,
    TResult? Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult? Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult? Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
  }) {
    return sigInWithUserIdAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_Started value)? started,
    TResult Function(_IsHiddenPassword value)? isHiddenPassword,
    TResult Function(_SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    TResult Function(_SigInWithUserIdAndPassword value)?
        sigInWithUserIdAndPassword,
    required TResult orElse(),
  }) {
    if (sigInWithUserIdAndPassword != null) {
      return sigInWithUserIdAndPassword(this);
    }
    return orElse();
  }
}

abstract class _SigInWithUserIdAndPassword implements SignInFormEvent {
  const factory _SigInWithUserIdAndPassword(
      {required final String userID,
      required final String password,
      required final String kodeModul}) = _$SigInWithUserIdAndPasswordImpl;

  String get userID;
  String get password;
  String get kodeModul;
  @JsonKey(ignore: true)
  _$$SigInWithUserIdAndPasswordImplCopyWith<_$SigInWithUserIdAndPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInFormState {
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  bool get isHiddenPassword => throw _privateConstructorUsedError;
  String get selectedUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res, SignInFormState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      bool loading,
      bool isHidden,
      bool isHiddenPassword,
      String selectedUser});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res, $Val extends SignInFormState>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failOrSuccessResult = null,
    Object? loading = null,
    Object? isHidden = null,
    Object? isHiddenPassword = null,
    Object? selectedUser = null,
  }) {
    return _then(_value.copyWith(
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isHiddenPassword: null == isHiddenPassword
          ? _value.isHiddenPassword
          : isHiddenPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: null == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInFormStateImplCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$SignInFormStateImplCopyWith(_$SignInFormStateImpl value,
          $Res Function(_$SignInFormStateImpl) then) =
      __$$SignInFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      bool loading,
      bool isHidden,
      bool isHiddenPassword,
      String selectedUser});
}

/// @nodoc
class __$$SignInFormStateImplCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res, _$SignInFormStateImpl>
    implements _$$SignInFormStateImplCopyWith<$Res> {
  __$$SignInFormStateImplCopyWithImpl(
      _$SignInFormStateImpl _value, $Res Function(_$SignInFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failOrSuccessResult = null,
    Object? loading = null,
    Object? isHidden = null,
    Object? isHiddenPassword = null,
    Object? selectedUser = null,
  }) {
    return _then(_$SignInFormStateImpl(
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isHiddenPassword: null == isHiddenPassword
          ? _value.isHiddenPassword
          : isHiddenPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedUser: null == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInFormStateImpl implements _SignInFormState {
  const _$SignInFormStateImpl(
      {required this.failOrSuccessResult,
      required this.loading,
      required this.isHidden,
      required this.isHiddenPassword,
      required this.selectedUser});

  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult;
  @override
  final bool loading;
  @override
  final bool isHidden;
  @override
  final bool isHiddenPassword;
  @override
  final String selectedUser;

  @override
  String toString() {
    return 'SignInFormState(failOrSuccessResult: $failOrSuccessResult, loading: $loading, isHidden: $isHidden, isHiddenPassword: $isHiddenPassword, selectedUser: $selectedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInFormStateImpl &&
            (identical(other.failOrSuccessResult, failOrSuccessResult) ||
                other.failOrSuccessResult == failOrSuccessResult) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.isHiddenPassword, isHiddenPassword) ||
                other.isHiddenPassword == isHiddenPassword) &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failOrSuccessResult, loading,
      isHidden, isHiddenPassword, selectedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInFormStateImplCopyWith<_$SignInFormStateImpl> get copyWith =>
      __$$SignInFormStateImplCopyWithImpl<_$SignInFormStateImpl>(
          this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResult,
      required final bool loading,
      required final bool isHidden,
      required final bool isHiddenPassword,
      required final String selectedUser}) = _$SignInFormStateImpl;

  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult;
  @override
  bool get loading;
  @override
  bool get isHidden;
  @override
  bool get isHiddenPassword;
  @override
  String get selectedUser;
  @override
  @JsonKey(ignore: true)
  _$$SignInFormStateImplCopyWith<_$SignInFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
