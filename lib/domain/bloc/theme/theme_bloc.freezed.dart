// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeEvent {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) themeModeChanged,
    required TResult Function(ThemeMode themeMode) themeModeSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? themeModeChanged,
    TResult? Function(ThemeMode themeMode)? themeModeSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? themeModeChanged,
    TResult Function(ThemeMode themeMode)? themeModeSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_ThemeModeSaved value) themeModeSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeModeChanged value)? themeModeChanged,
    TResult? Function(_ThemeModeSaved value)? themeModeSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ThemeModeSaved value)? themeModeSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeEventCopyWith<ThemeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeModeChangedImplCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory _$$ThemeModeChangedImplCopyWith(_$ThemeModeChangedImpl value,
          $Res Function(_$ThemeModeChangedImpl) then) =
      __$$ThemeModeChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$ThemeModeChangedImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ThemeModeChangedImpl>
    implements _$$ThemeModeChangedImplCopyWith<$Res> {
  __$$ThemeModeChangedImplCopyWithImpl(_$ThemeModeChangedImpl _value,
      $Res Function(_$ThemeModeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$ThemeModeChangedImpl(
      null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$ThemeModeChangedImpl implements _ThemeModeChanged {
  const _$ThemeModeChangedImpl(this.themeMode);

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeEvent.themeModeChanged(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeChangedImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModeChangedImplCopyWith<_$ThemeModeChangedImpl> get copyWith =>
      __$$ThemeModeChangedImplCopyWithImpl<_$ThemeModeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) themeModeChanged,
    required TResult Function(ThemeMode themeMode) themeModeSaved,
  }) {
    return themeModeChanged(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? themeModeChanged,
    TResult? Function(ThemeMode themeMode)? themeModeSaved,
  }) {
    return themeModeChanged?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? themeModeChanged,
    TResult Function(ThemeMode themeMode)? themeModeSaved,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_ThemeModeSaved value) themeModeSaved,
  }) {
    return themeModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeModeChanged value)? themeModeChanged,
    TResult? Function(_ThemeModeSaved value)? themeModeSaved,
  }) {
    return themeModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ThemeModeSaved value)? themeModeSaved,
    required TResult orElse(),
  }) {
    if (themeModeChanged != null) {
      return themeModeChanged(this);
    }
    return orElse();
  }
}

abstract class _ThemeModeChanged implements ThemeEvent {
  const factory _ThemeModeChanged(final ThemeMode themeMode) =
      _$ThemeModeChangedImpl;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeModeChangedImplCopyWith<_$ThemeModeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeModeSavedImplCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory _$$ThemeModeSavedImplCopyWith(_$ThemeModeSavedImpl value,
          $Res Function(_$ThemeModeSavedImpl) then) =
      __$$ThemeModeSavedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$ThemeModeSavedImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ThemeModeSavedImpl>
    implements _$$ThemeModeSavedImplCopyWith<$Res> {
  __$$ThemeModeSavedImplCopyWithImpl(
      _$ThemeModeSavedImpl _value, $Res Function(_$ThemeModeSavedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$ThemeModeSavedImpl(
      null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$ThemeModeSavedImpl implements _ThemeModeSaved {
  const _$ThemeModeSavedImpl(this.themeMode);

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeEvent.themeModeSaved(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModeSavedImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModeSavedImplCopyWith<_$ThemeModeSavedImpl> get copyWith =>
      __$$ThemeModeSavedImplCopyWithImpl<_$ThemeModeSavedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) themeModeChanged,
    required TResult Function(ThemeMode themeMode) themeModeSaved,
  }) {
    return themeModeSaved(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? themeModeChanged,
    TResult? Function(ThemeMode themeMode)? themeModeSaved,
  }) {
    return themeModeSaved?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? themeModeChanged,
    TResult Function(ThemeMode themeMode)? themeModeSaved,
    required TResult orElse(),
  }) {
    if (themeModeSaved != null) {
      return themeModeSaved(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeModeChanged value) themeModeChanged,
    required TResult Function(_ThemeModeSaved value) themeModeSaved,
  }) {
    return themeModeSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ThemeModeChanged value)? themeModeChanged,
    TResult? Function(_ThemeModeSaved value)? themeModeSaved,
  }) {
    return themeModeSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeModeChanged value)? themeModeChanged,
    TResult Function(_ThemeModeSaved value)? themeModeSaved,
    required TResult orElse(),
  }) {
    if (themeModeSaved != null) {
      return themeModeSaved(this);
    }
    return orElse();
  }
}

abstract class _ThemeModeSaved implements ThemeEvent {
  const factory _ThemeModeSaved(final ThemeMode themeMode) =
      _$ThemeModeSavedImpl;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeModeSavedImplCopyWith<_$ThemeModeSavedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThemeState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeStateImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateImplCopyWith(
          _$ThemeStateImpl value, $Res Function(_$ThemeStateImpl) then) =
      __$$ThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$ThemeStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateImpl>
    implements _$$ThemeStateImplCopyWith<$Res> {
  __$$ThemeStateImplCopyWithImpl(
      _$ThemeStateImpl _value, $Res Function(_$ThemeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$ThemeStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$ThemeStateImpl implements _ThemeState {
  const _$ThemeStateImpl({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      __$$ThemeStateImplCopyWithImpl<_$ThemeStateImpl>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({required final ThemeMode themeMode}) =
      _$ThemeStateImpl;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
