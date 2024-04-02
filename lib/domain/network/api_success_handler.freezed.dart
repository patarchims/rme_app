// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_success_handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiSuccessResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) loaded,
    required TResult Function(dynamic value) auAutorized,
    required TResult Function() emty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? loaded,
    TResult? Function(dynamic value)? auAutorized,
    TResult? Function()? emty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? loaded,
    TResult Function(dynamic value)? auAutorized,
    TResult Function()? emty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_AuAutorized value) auAutorized,
    required TResult Function(_Emty value) emty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_AuAutorized value)? auAutorized,
    TResult? Function(_Emty value)? emty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_AuAutorized value)? auAutorized,
    TResult Function(_Emty value)? emty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiSuccessResultCopyWith<$Res> {
  factory $ApiSuccessResultCopyWith(
          ApiSuccessResult value, $Res Function(ApiSuccessResult) then) =
      _$ApiSuccessResultCopyWithImpl<$Res, ApiSuccessResult>;
}

/// @nodoc
class _$ApiSuccessResultCopyWithImpl<$Res, $Val extends ApiSuccessResult>
    implements $ApiSuccessResultCopyWith<$Res> {
  _$ApiSuccessResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ApiSuccessResultCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$LoadedImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.value});

  @override
  final dynamic value;

  @override
  String toString() {
    return 'ApiSuccessResult.loaded(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) loaded,
    required TResult Function(dynamic value) auAutorized,
    required TResult Function() emty,
  }) {
    return loaded(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? loaded,
    TResult? Function(dynamic value)? auAutorized,
    TResult? Function()? emty,
  }) {
    return loaded?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? loaded,
    TResult Function(dynamic value)? auAutorized,
    TResult Function()? emty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_AuAutorized value) auAutorized,
    required TResult Function(_Emty value) emty,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_AuAutorized value)? auAutorized,
    TResult? Function(_Emty value)? emty,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_AuAutorized value)? auAutorized,
    TResult Function(_Emty value)? emty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ApiSuccessResult {
  const factory _Loaded({required final dynamic value}) = _$LoadedImpl;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuAutorizedImplCopyWith<$Res> {
  factory _$$AuAutorizedImplCopyWith(
          _$AuAutorizedImpl value, $Res Function(_$AuAutorizedImpl) then) =
      __$$AuAutorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$AuAutorizedImplCopyWithImpl<$Res>
    extends _$ApiSuccessResultCopyWithImpl<$Res, _$AuAutorizedImpl>
    implements _$$AuAutorizedImplCopyWith<$Res> {
  __$$AuAutorizedImplCopyWithImpl(
      _$AuAutorizedImpl _value, $Res Function(_$AuAutorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$AuAutorizedImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AuAutorizedImpl implements _AuAutorized {
  const _$AuAutorizedImpl({required this.value});

  @override
  final dynamic value;

  @override
  String toString() {
    return 'ApiSuccessResult.auAutorized(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuAutorizedImpl &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuAutorizedImplCopyWith<_$AuAutorizedImpl> get copyWith =>
      __$$AuAutorizedImplCopyWithImpl<_$AuAutorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) loaded,
    required TResult Function(dynamic value) auAutorized,
    required TResult Function() emty,
  }) {
    return auAutorized(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? loaded,
    TResult? Function(dynamic value)? auAutorized,
    TResult? Function()? emty,
  }) {
    return auAutorized?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? loaded,
    TResult Function(dynamic value)? auAutorized,
    TResult Function()? emty,
    required TResult orElse(),
  }) {
    if (auAutorized != null) {
      return auAutorized(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_AuAutorized value) auAutorized,
    required TResult Function(_Emty value) emty,
  }) {
    return auAutorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_AuAutorized value)? auAutorized,
    TResult? Function(_Emty value)? emty,
  }) {
    return auAutorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_AuAutorized value)? auAutorized,
    TResult Function(_Emty value)? emty,
    required TResult orElse(),
  }) {
    if (auAutorized != null) {
      return auAutorized(this);
    }
    return orElse();
  }
}

abstract class _AuAutorized implements ApiSuccessResult {
  const factory _AuAutorized({required final dynamic value}) =
      _$AuAutorizedImpl;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$AuAutorizedImplCopyWith<_$AuAutorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmtyImplCopyWith<$Res> {
  factory _$$EmtyImplCopyWith(
          _$EmtyImpl value, $Res Function(_$EmtyImpl) then) =
      __$$EmtyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmtyImplCopyWithImpl<$Res>
    extends _$ApiSuccessResultCopyWithImpl<$Res, _$EmtyImpl>
    implements _$$EmtyImplCopyWith<$Res> {
  __$$EmtyImplCopyWithImpl(_$EmtyImpl _value, $Res Function(_$EmtyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmtyImpl implements _Emty {
  const _$EmtyImpl();

  @override
  String toString() {
    return 'ApiSuccessResult.emty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmtyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic value) loaded,
    required TResult Function(dynamic value) auAutorized,
    required TResult Function() emty,
  }) {
    return emty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic value)? loaded,
    TResult? Function(dynamic value)? auAutorized,
    TResult? Function()? emty,
  }) {
    return emty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic value)? loaded,
    TResult Function(dynamic value)? auAutorized,
    TResult Function()? emty,
    required TResult orElse(),
  }) {
    if (emty != null) {
      return emty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_AuAutorized value) auAutorized,
    required TResult Function(_Emty value) emty,
  }) {
    return emty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_AuAutorized value)? auAutorized,
    TResult? Function(_Emty value)? emty,
  }) {
    return emty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_AuAutorized value)? auAutorized,
    TResult Function(_Emty value)? emty,
    required TResult orElse(),
  }) {
    if (emty != null) {
      return emty(this);
    }
    return orElse();
  }
}

abstract class _Emty implements ApiSuccessResult {
  const factory _Emty() = _$EmtyImpl;
}
