// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure_handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiFailureResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureResultCopyWith<$Res> {
  factory $ApiFailureResultCopyWith(
          ApiFailureResult value, $Res Function(ApiFailureResult) then) =
      _$ApiFailureResultCopyWithImpl<$Res, ApiFailureResult>;
}

/// @nodoc
class _$ApiFailureResultCopyWithImpl<$Res, $Val extends ApiFailureResult>
    implements $ApiFailureResultCopyWith<$Res> {
  _$ApiFailureResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MetaModel meta});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ApiFailureResultCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
  }) {
    return _then(_$FailureImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaModel,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.meta});

  @override
  final MetaModel meta;

  @override
  String toString() {
    return 'ApiFailureResult.failure(meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return failure(meta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return failure?.call(meta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(meta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ApiFailureResult {
  const factory _Failure({required final MetaModel meta}) = _$FailureImpl;

  MetaModel get meta;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnProccessableImplCopyWith<$Res> {
  factory _$$UnProccessableImplCopyWith(_$UnProccessableImpl value,
          $Res Function(_$UnProccessableImpl) then) =
      __$$UnProccessableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$UnProccessableImplCopyWithImpl<$Res>
    extends _$ApiFailureResultCopyWithImpl<$Res, _$UnProccessableImpl>
    implements _$$UnProccessableImplCopyWith<$Res> {
  __$$UnProccessableImplCopyWithImpl(
      _$UnProccessableImpl _value, $Res Function(_$UnProccessableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$UnProccessableImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$UnProccessableImpl implements _UnProccessable {
  const _$UnProccessableImpl({required this.value});

  @override
  final dynamic value;

  @override
  String toString() {
    return 'ApiFailureResult.unProccessable(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnProccessableImpl &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnProccessableImplCopyWith<_$UnProccessableImpl> get copyWith =>
      __$$UnProccessableImplCopyWithImpl<_$UnProccessableImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return unProccessable(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return unProccessable?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (unProccessable != null) {
      return unProccessable(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return unProccessable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return unProccessable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (unProccessable != null) {
      return unProccessable(this);
    }
    return orElse();
  }
}

abstract class _UnProccessable implements ApiFailureResult {
  const factory _UnProccessable({required final dynamic value}) =
      _$UnProccessableImpl;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$UnProccessableImplCopyWith<_$UnProccessableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$ApiFailureResultCopyWithImpl<$Res, _$NoConnectionImpl>
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
    return 'ApiFailureResult.noConnection()';
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
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
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
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection implements ApiFailureResult {
  const factory _NoConnection() = _$NoConnectionImpl;
}

/// @nodoc
abstract class _$$DisconectToServerImplCopyWith<$Res> {
  factory _$$DisconectToServerImplCopyWith(_$DisconectToServerImpl value,
          $Res Function(_$DisconectToServerImpl) then) =
      __$$DisconectToServerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisconectToServerImplCopyWithImpl<$Res>
    extends _$ApiFailureResultCopyWithImpl<$Res, _$DisconectToServerImpl>
    implements _$$DisconectToServerImplCopyWith<$Res> {
  __$$DisconectToServerImplCopyWithImpl(_$DisconectToServerImpl _value,
      $Res Function(_$DisconectToServerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisconectToServerImpl implements _DisconectToServer {
  const _$DisconectToServerImpl();

  @override
  String toString() {
    return 'ApiFailureResult.disconectToServer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisconectToServerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return disconectToServer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return disconectToServer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (disconectToServer != null) {
      return disconectToServer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return disconectToServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return disconectToServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (disconectToServer != null) {
      return disconectToServer(this);
    }
    return orElse();
  }
}

abstract class _DisconectToServer implements ApiFailureResult {
  const factory _DisconectToServer() = _$DisconectToServerImpl;
}

/// @nodoc
abstract class _$$BadResponseImplCopyWith<$Res> {
  factory _$$BadResponseImplCopyWith(
          _$BadResponseImpl value, $Res Function(_$BadResponseImpl) then) =
      __$$BadResponseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadResponseImplCopyWithImpl<$Res>
    extends _$ApiFailureResultCopyWithImpl<$Res, _$BadResponseImpl>
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
    return 'ApiFailureResult.badResponse()';
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
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return badResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return badResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
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
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }
}

abstract class _BadResponse implements ApiFailureResult {
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
    extends _$ApiFailureResultCopyWithImpl<$Res, _$ConnectionTimeOutImpl>
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
    return 'ApiFailureResult.connectionTimeOut()';
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
    required TResult Function(MetaModel meta) failure,
    required TResult Function(dynamic value) unProccessable,
    required TResult Function() noConnection,
    required TResult Function() disconectToServer,
    required TResult Function() badResponse,
    required TResult Function() connectionTimeOut,
  }) {
    return connectionTimeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MetaModel meta)? failure,
    TResult? Function(dynamic value)? unProccessable,
    TResult? Function()? noConnection,
    TResult? Function()? disconectToServer,
    TResult? Function()? badResponse,
    TResult? Function()? connectionTimeOut,
  }) {
    return connectionTimeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MetaModel meta)? failure,
    TResult Function(dynamic value)? unProccessable,
    TResult Function()? noConnection,
    TResult Function()? disconectToServer,
    TResult Function()? badResponse,
    TResult Function()? connectionTimeOut,
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
    required TResult Function(_Failure value) failure,
    required TResult Function(_UnProccessable value) unProccessable,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_DisconectToServer value) disconectToServer,
    required TResult Function(_BadResponse value) badResponse,
    required TResult Function(_ConnectionTimeOut value) connectionTimeOut,
  }) {
    return connectionTimeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_UnProccessable value)? unProccessable,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_DisconectToServer value)? disconectToServer,
    TResult? Function(_BadResponse value)? badResponse,
    TResult? Function(_ConnectionTimeOut value)? connectionTimeOut,
  }) {
    return connectionTimeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_UnProccessable value)? unProccessable,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_DisconectToServer value)? disconectToServer,
    TResult Function(_BadResponse value)? badResponse,
    TResult Function(_ConnectionTimeOut value)? connectionTimeOut,
    required TResult orElse(),
  }) {
    if (connectionTimeOut != null) {
      return connectionTimeOut(this);
    }
    return orElse();
  }
}

abstract class _ConnectionTimeOut implements ApiFailureResult {
  const factory _ConnectionTimeOut() = _$ConnectionTimeOutImpl;
}
