// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'AppEvent.started()';
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
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AppEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl();

  @override
  String toString() {
    return 'AppState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AppState {
  const factory _Failure() = _$FailureImpl;
}

/// @nodoc
abstract class _$$BadResponseImplCopyWith<$Res> {
  factory _$$BadResponseImplCopyWith(
          _$BadResponseImpl value, $Res Function(_$BadResponseImpl) then) =
      __$$BadResponseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadResponseImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$BadResponseImpl>
    implements _$$BadResponseImplCopyWith<$Res> {
  __$$BadResponseImplCopyWithImpl(
      _$BadResponseImpl _value, $Res Function(_$BadResponseImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BadResponseImpl implements _BadResponse {
  const _$BadResponseImpl();

  @override
  String toString() {
    return 'AppState.badResponse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BadResponseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return badResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return badResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }
}

abstract class _BadResponse implements AppState {
  const factory _BadResponse() = _$BadResponseImpl;
}

/// @nodoc
abstract class _$$ConnectionTimeOutImplCopyWith<$Res> {
  factory _$$ConnectionTimeOutImplCopyWith(_$ConnectionTimeOutImpl value,
          $Res Function(_$ConnectionTimeOutImpl) then) =
      __$$ConnectionTimeOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectionTimeOutImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ConnectionTimeOutImpl>
    implements _$$ConnectionTimeOutImplCopyWith<$Res> {
  __$$ConnectionTimeOutImplCopyWithImpl(_$ConnectionTimeOutImpl _value,
      $Res Function(_$ConnectionTimeOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectionTimeOutImpl implements _ConnectionTimeOut {
  const _$ConnectionTimeOutImpl();

  @override
  String toString() {
    return 'AppState.connectionTimeOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectionTimeOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return connectionTimeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return connectionTimeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (connectionTimeOut != null) {
      return connectionTimeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return connectionTimeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return connectionTimeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (connectionTimeOut != null) {
      return connectionTimeOut(this);
    }
    return orElse();
  }
}

abstract class _ConnectionTimeOut implements AppState {
  const factory _ConnectionTimeOut() = _$ConnectionTimeOutImpl;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl _value, $Res Function(_$NoConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConnectionImpl implements _NoConnection {
  const _$NoConnectionImpl();

  @override
  String toString() {
    return 'AppState.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection implements AppState {
  const factory _NoConnection() = _$NoConnectionImpl;
}

/// @nodoc
abstract class _$$DiconectToServerImplCopyWith<$Res> {
  factory _$$DiconectToServerImplCopyWith(_$DiconectToServerImpl value,
          $Res Function(_$DiconectToServerImpl) then) =
      __$$DiconectToServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DiconectToServerImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$DiconectToServerImpl>
    implements _$$DiconectToServerImplCopyWith<$Res> {
  __$$DiconectToServerImplCopyWithImpl(_$DiconectToServerImpl _value,
      $Res Function(_$DiconectToServerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DiconectToServerImpl implements _DiconectToServer {
  const _$DiconectToServerImpl();

  @override
  String toString() {
    return 'AppState.diconectToServer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DiconectToServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return diconectToServer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return diconectToServer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (diconectToServer != null) {
      return diconectToServer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return diconectToServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return diconectToServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (diconectToServer != null) {
      return diconectToServer(this);
    }
    return orElse();
  }
}

abstract class _DiconectToServer implements AppState {
  const factory _DiconectToServer() = _$DiconectToServerImpl;
}

/// @nodoc
abstract class _$$UpdateNowImplCopyWith<$Res> {
  factory _$$UpdateNowImplCopyWith(
          _$UpdateNowImpl value, $Res Function(_$UpdateNowImpl) then) =
      __$$UpdateNowImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateNowImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$UpdateNowImpl>
    implements _$$UpdateNowImplCopyWith<$Res> {
  __$$UpdateNowImplCopyWithImpl(
      _$UpdateNowImpl _value, $Res Function(_$UpdateNowImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateNowImpl implements _UpdateNow {
  const _$UpdateNowImpl();

  @override
  String toString() {
    return 'AppState.updateNow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateNowImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return updateNow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return updateNow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (updateNow != null) {
      return updateNow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return updateNow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return updateNow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (updateNow != null) {
      return updateNow(this);
    }
    return orElse();
  }
}

abstract class _UpdateNow implements AppState {
  const factory _UpdateNow() = _$UpdateNowImpl;
}

/// @nodoc
abstract class _$$RunOnBoardingImplCopyWith<$Res> {
  factory _$$RunOnBoardingImplCopyWith(
          _$RunOnBoardingImpl value, $Res Function(_$RunOnBoardingImpl) then) =
      __$$RunOnBoardingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunOnBoardingImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$RunOnBoardingImpl>
    implements _$$RunOnBoardingImplCopyWith<$Res> {
  __$$RunOnBoardingImplCopyWithImpl(
      _$RunOnBoardingImpl _value, $Res Function(_$RunOnBoardingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RunOnBoardingImpl implements _RunOnBoarding {
  const _$RunOnBoardingImpl();

  @override
  String toString() {
    return 'AppState.runOnBoarding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunOnBoardingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return runOnBoarding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return runOnBoarding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (runOnBoarding != null) {
      return runOnBoarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return runOnBoarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return runOnBoarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (runOnBoarding != null) {
      return runOnBoarding(this);
    }
    return orElse();
  }
}

abstract class _RunOnBoarding implements AppState {
  const factory _RunOnBoarding() = _$RunOnBoardingImpl;
}

/// @nodoc
abstract class _$$NoTokenImplCopyWith<$Res> {
  factory _$$NoTokenImplCopyWith(
          _$NoTokenImpl value, $Res Function(_$NoTokenImpl) then) =
      __$$NoTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MetaModel? meta});
}

/// @nodoc
class __$$NoTokenImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$NoTokenImpl>
    implements _$$NoTokenImplCopyWith<$Res> {
  __$$NoTokenImplCopyWithImpl(
      _$NoTokenImpl _value, $Res Function(_$NoTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
  }) {
    return _then(_$NoTokenImpl(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaModel?,
    ));
  }
}

/// @nodoc

class _$NoTokenImpl implements _NoToken {
  const _$NoTokenImpl({this.meta});

  @override
  final MetaModel? meta;

  @override
  String toString() {
    return 'AppState.noToken(meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoTokenImpl &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoTokenImplCopyWith<_$NoTokenImpl> get copyWith =>
      __$$NoTokenImplCopyWithImpl<_$NoTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return noToken(meta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return noToken?.call(meta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (noToken != null) {
      return noToken(meta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return noToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return noToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (noToken != null) {
      return noToken(this);
    }
    return orElse();
  }
}

abstract class _NoToken implements AppState {
  const factory _NoToken({final MetaModel? meta}) = _$NoTokenImpl;

  MetaModel? get meta;
  @JsonKey(ignore: true)
  _$$NoTokenImplCopyWith<_$NoTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithBiometricImplCopyWith<$Res> {
  factory _$$LoginWithBiometricImplCopyWith(_$LoginWithBiometricImpl value,
          $Res Function(_$LoginWithBiometricImpl) then) =
      __$$LoginWithBiometricImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithBiometricImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoginWithBiometricImpl>
    implements _$$LoginWithBiometricImplCopyWith<$Res> {
  __$$LoginWithBiometricImplCopyWithImpl(_$LoginWithBiometricImpl _value,
      $Res Function(_$LoginWithBiometricImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginWithBiometricImpl implements _LoginWithBiometric {
  const _$LoginWithBiometricImpl();

  @override
  String toString() {
    return 'AppState.loginWithBiometric()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginWithBiometricImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return loginWithBiometric();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return loginWithBiometric?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (loginWithBiometric != null) {
      return loginWithBiometric();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return loginWithBiometric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return loginWithBiometric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (loginWithBiometric != null) {
      return loginWithBiometric(this);
    }
    return orElse();
  }
}

abstract class _LoginWithBiometric implements AppState {
  const factory _LoginWithBiometric() = _$LoginWithBiometricImpl;
}

/// @nodoc
abstract class _$$RunMainPageImplCopyWith<$Res> {
  factory _$$RunMainPageImplCopyWith(
          _$RunMainPageImpl value, $Res Function(_$RunMainPageImpl) then) =
      __$$RunMainPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$RunMainPageImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$RunMainPageImpl>
    implements _$$RunMainPageImplCopyWith<$Res> {
  __$$RunMainPageImplCopyWithImpl(
      _$RunMainPageImpl _value, $Res Function(_$RunMainPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$RunMainPageImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$RunMainPageImpl implements _RunMainPage {
  const _$RunMainPageImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AppState.runMainPage(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunMainPageImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunMainPageImplCopyWith<_$RunMainPageImpl> get copyWith =>
      __$$RunMainPageImplCopyWithImpl<_$RunMainPageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() failure,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
    required TResult Function() noConnection,
    required TResult Function() diconectToServer,
    required TResult Function() updateNow,
    required TResult Function() runOnBoarding,
    required TResult Function(MetaModel? meta) noToken,
    required TResult Function() loginWithBiometric,
    required TResult Function(UserModel user) runMainPage,
  }) {
    return runMainPage(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? failure,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
    TResult? Function()? noConnection,
    TResult? Function()? diconectToServer,
    TResult? Function()? updateNow,
    TResult? Function()? runOnBoarding,
    TResult? Function(MetaModel? meta)? noToken,
    TResult? Function()? loginWithBiometric,
    TResult? Function(UserModel user)? runMainPage,
  }) {
    return runMainPage?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? failure,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    TResult Function()? noConnection,
    TResult Function()? diconectToServer,
    TResult Function()? updateNow,
    TResult Function()? runOnBoarding,
    TResult Function(MetaModel? meta)? noToken,
    TResult Function()? loginWithBiometric,
    TResult Function(UserModel user)? runMainPage,
    required TResult orElse(),
  }) {
    if (runMainPage != null) {
      return runMainPage(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Failure value) failure,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DiconectToServer value) diconectToServer,
    required TResult Function(_UpdateNow value) updateNow,
    required TResult Function(_RunOnBoarding value) runOnBoarding,
    required TResult Function(_NoToken value) noToken,
    required TResult Function(_LoginWithBiometric value) loginWithBiometric,
    required TResult Function(_RunMainPage value) runMainPage,
  }) {
    return runMainPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DiconectToServer value)? diconectToServer,
    TResult? Function(_UpdateNow value)? updateNow,
    TResult? Function(_RunOnBoarding value)? runOnBoarding,
    TResult? Function(_NoToken value)? noToken,
    TResult? Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult? Function(_RunMainPage value)? runMainPage,
  }) {
    return runMainPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Failure value)? failure,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DiconectToServer value)? diconectToServer,
    TResult Function(_UpdateNow value)? updateNow,
    TResult Function(_RunOnBoarding value)? runOnBoarding,
    TResult Function(_NoToken value)? noToken,
    TResult Function(_LoginWithBiometric value)? loginWithBiometric,
    TResult Function(_RunMainPage value)? runMainPage,
    required TResult orElse(),
  }) {
    if (runMainPage != null) {
      return runMainPage(this);
    }
    return orElse();
  }
}

abstract class _RunMainPage implements AppState {
  const factory _RunMainPage({required final UserModel user}) =
      _$RunMainPageImpl;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$RunMainPageImplCopyWith<_$RunMainPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
