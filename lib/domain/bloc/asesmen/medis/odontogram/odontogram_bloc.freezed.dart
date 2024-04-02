// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odontogram_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OdontogramEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startLoading,
    required TResult Function(String imageUrl, String norReg) saveOdontogram,
    required TResult Function() getOdontogram,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startLoading,
    TResult? Function(String imageUrl, String norReg)? saveOdontogram,
    TResult? Function()? getOdontogram,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startLoading,
    TResult Function(String imageUrl, String norReg)? saveOdontogram,
    TResult Function()? getOdontogram,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartLoading value) startLoading,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_GetOdontogram value) getOdontogram,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartLoading value)? startLoading,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_GetOdontogram value)? getOdontogram,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartLoading value)? startLoading,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_GetOdontogram value)? getOdontogram,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdontogramEventCopyWith<$Res> {
  factory $OdontogramEventCopyWith(
          OdontogramEvent value, $Res Function(OdontogramEvent) then) =
      _$OdontogramEventCopyWithImpl<$Res, OdontogramEvent>;
}

/// @nodoc
class _$OdontogramEventCopyWithImpl<$Res, $Val extends OdontogramEvent>
    implements $OdontogramEventCopyWith<$Res> {
  _$OdontogramEventCopyWithImpl(this._value, this._then);

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
    extends _$OdontogramEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'OdontogramEvent.started()';
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
    required TResult Function() startLoading,
    required TResult Function(String imageUrl, String norReg) saveOdontogram,
    required TResult Function() getOdontogram,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startLoading,
    TResult? Function(String imageUrl, String norReg)? saveOdontogram,
    TResult? Function()? getOdontogram,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startLoading,
    TResult Function(String imageUrl, String norReg)? saveOdontogram,
    TResult Function()? getOdontogram,
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
    required TResult Function(_StartLoading value) startLoading,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_GetOdontogram value) getOdontogram,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartLoading value)? startLoading,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_GetOdontogram value)? getOdontogram,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartLoading value)? startLoading,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_GetOdontogram value)? getOdontogram,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OdontogramEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$StartLoadingImplCopyWith<$Res> {
  factory _$$StartLoadingImplCopyWith(
          _$StartLoadingImpl value, $Res Function(_$StartLoadingImpl) then) =
      __$$StartLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartLoadingImplCopyWithImpl<$Res>
    extends _$OdontogramEventCopyWithImpl<$Res, _$StartLoadingImpl>
    implements _$$StartLoadingImplCopyWith<$Res> {
  __$$StartLoadingImplCopyWithImpl(
      _$StartLoadingImpl _value, $Res Function(_$StartLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartLoadingImpl implements _StartLoading {
  const _$StartLoadingImpl();

  @override
  String toString() {
    return 'OdontogramEvent.startLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startLoading,
    required TResult Function(String imageUrl, String norReg) saveOdontogram,
    required TResult Function() getOdontogram,
  }) {
    return startLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startLoading,
    TResult? Function(String imageUrl, String norReg)? saveOdontogram,
    TResult? Function()? getOdontogram,
  }) {
    return startLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startLoading,
    TResult Function(String imageUrl, String norReg)? saveOdontogram,
    TResult Function()? getOdontogram,
    required TResult orElse(),
  }) {
    if (startLoading != null) {
      return startLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartLoading value) startLoading,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_GetOdontogram value) getOdontogram,
  }) {
    return startLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartLoading value)? startLoading,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_GetOdontogram value)? getOdontogram,
  }) {
    return startLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartLoading value)? startLoading,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_GetOdontogram value)? getOdontogram,
    required TResult orElse(),
  }) {
    if (startLoading != null) {
      return startLoading(this);
    }
    return orElse();
  }
}

abstract class _StartLoading implements OdontogramEvent {
  const factory _StartLoading() = _$StartLoadingImpl;
}

/// @nodoc
abstract class _$$SaveOdontogramImplCopyWith<$Res> {
  factory _$$SaveOdontogramImplCopyWith(_$SaveOdontogramImpl value,
          $Res Function(_$SaveOdontogramImpl) then) =
      __$$SaveOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imageUrl, String norReg});
}

/// @nodoc
class __$$SaveOdontogramImplCopyWithImpl<$Res>
    extends _$OdontogramEventCopyWithImpl<$Res, _$SaveOdontogramImpl>
    implements _$$SaveOdontogramImplCopyWith<$Res> {
  __$$SaveOdontogramImplCopyWithImpl(
      _$SaveOdontogramImpl _value, $Res Function(_$SaveOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? norReg = null,
  }) {
    return _then(_$SaveOdontogramImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      norReg: null == norReg
          ? _value.norReg
          : norReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveOdontogramImpl implements _SaveOdontogram {
  const _$SaveOdontogramImpl({required this.imageUrl, required this.norReg});

  @override
  final String imageUrl;
  @override
  final String norReg;

  @override
  String toString() {
    return 'OdontogramEvent.saveOdontogram(imageUrl: $imageUrl, norReg: $norReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOdontogramImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.norReg, norReg) || other.norReg == norReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, norReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveOdontogramImplCopyWith<_$SaveOdontogramImpl> get copyWith =>
      __$$SaveOdontogramImplCopyWithImpl<_$SaveOdontogramImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startLoading,
    required TResult Function(String imageUrl, String norReg) saveOdontogram,
    required TResult Function() getOdontogram,
  }) {
    return saveOdontogram(imageUrl, norReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startLoading,
    TResult? Function(String imageUrl, String norReg)? saveOdontogram,
    TResult? Function()? getOdontogram,
  }) {
    return saveOdontogram?.call(imageUrl, norReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startLoading,
    TResult Function(String imageUrl, String norReg)? saveOdontogram,
    TResult Function()? getOdontogram,
    required TResult orElse(),
  }) {
    if (saveOdontogram != null) {
      return saveOdontogram(imageUrl, norReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartLoading value) startLoading,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_GetOdontogram value) getOdontogram,
  }) {
    return saveOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartLoading value)? startLoading,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_GetOdontogram value)? getOdontogram,
  }) {
    return saveOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartLoading value)? startLoading,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_GetOdontogram value)? getOdontogram,
    required TResult orElse(),
  }) {
    if (saveOdontogram != null) {
      return saveOdontogram(this);
    }
    return orElse();
  }
}

abstract class _SaveOdontogram implements OdontogramEvent {
  const factory _SaveOdontogram(
      {required final String imageUrl,
      required final String norReg}) = _$SaveOdontogramImpl;

  String get imageUrl;
  String get norReg;
  @JsonKey(ignore: true)
  _$$SaveOdontogramImplCopyWith<_$SaveOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOdontogramImplCopyWith<$Res> {
  factory _$$GetOdontogramImplCopyWith(
          _$GetOdontogramImpl value, $Res Function(_$GetOdontogramImpl) then) =
      __$$GetOdontogramImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOdontogramImplCopyWithImpl<$Res>
    extends _$OdontogramEventCopyWithImpl<$Res, _$GetOdontogramImpl>
    implements _$$GetOdontogramImplCopyWith<$Res> {
  __$$GetOdontogramImplCopyWithImpl(
      _$GetOdontogramImpl _value, $Res Function(_$GetOdontogramImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOdontogramImpl implements _GetOdontogram {
  const _$GetOdontogramImpl();

  @override
  String toString() {
    return 'OdontogramEvent.getOdontogram()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOdontogramImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startLoading,
    required TResult Function(String imageUrl, String norReg) saveOdontogram,
    required TResult Function() getOdontogram,
  }) {
    return getOdontogram();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startLoading,
    TResult? Function(String imageUrl, String norReg)? saveOdontogram,
    TResult? Function()? getOdontogram,
  }) {
    return getOdontogram?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startLoading,
    TResult Function(String imageUrl, String norReg)? saveOdontogram,
    TResult Function()? getOdontogram,
    required TResult orElse(),
  }) {
    if (getOdontogram != null) {
      return getOdontogram();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartLoading value) startLoading,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_GetOdontogram value) getOdontogram,
  }) {
    return getOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartLoading value)? startLoading,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_GetOdontogram value)? getOdontogram,
  }) {
    return getOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartLoading value)? startLoading,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_GetOdontogram value)? getOdontogram,
    required TResult orElse(),
  }) {
    if (getOdontogram != null) {
      return getOdontogram(this);
    }
    return orElse();
  }
}

abstract class _GetOdontogram implements OdontogramEvent {
  const factory _GetOdontogram() = _$GetOdontogramImpl;
}

/// @nodoc
mixin _$OdontogramState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OdontogramStateCopyWith<OdontogramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdontogramStateCopyWith<$Res> {
  factory $OdontogramStateCopyWith(
          OdontogramState value, $Res Function(OdontogramState) then) =
      _$OdontogramStateCopyWithImpl<$Res, OdontogramState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult});
}

/// @nodoc
class _$OdontogramStateCopyWithImpl<$Res, $Val extends OdontogramState>
    implements $OdontogramStateCopyWith<$Res> {
  _$OdontogramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? getResult = null,
    Object? saveResult = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      getResult: null == getResult
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveResult: null == saveResult
          ? _value.saveResult
          : saveResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OdontogramStateImplCopyWith<$Res>
    implements $OdontogramStateCopyWith<$Res> {
  factory _$$OdontogramStateImplCopyWith(_$OdontogramStateImpl value,
          $Res Function(_$OdontogramStateImpl) then) =
      __$$OdontogramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult});
}

/// @nodoc
class __$$OdontogramStateImplCopyWithImpl<$Res>
    extends _$OdontogramStateCopyWithImpl<$Res, _$OdontogramStateImpl>
    implements _$$OdontogramStateImplCopyWith<$Res> {
  __$$OdontogramStateImplCopyWithImpl(
      _$OdontogramStateImpl _value, $Res Function(_$OdontogramStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? getResult = null,
    Object? saveResult = null,
  }) {
    return _then(_$OdontogramStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      getResult: null == getResult
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveResult: null == saveResult
          ? _value.saveResult
          : saveResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
    ));
  }
}

/// @nodoc

class _$OdontogramStateImpl implements _OdontogramState {
  const _$OdontogramStateImpl(
      {required this.isLoading,
      required this.getResult,
      required this.saveResult});

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;

  @override
  String toString() {
    return 'OdontogramState(isLoading: $isLoading, getResult: $getResult, saveResult: $saveResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdontogramStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.getResult, getResult) ||
                other.getResult == getResult) &&
            (identical(other.saveResult, saveResult) ||
                other.saveResult == saveResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, getResult, saveResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OdontogramStateImplCopyWith<_$OdontogramStateImpl> get copyWith =>
      __$$OdontogramStateImplCopyWithImpl<_$OdontogramStateImpl>(
          this, _$identity);
}

abstract class _OdontogramState implements OdontogramState {
  const factory _OdontogramState(
      {required final bool isLoading,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          getResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          saveResult}) = _$OdontogramStateImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveResult;
  @override
  @JsonKey(ignore: true)
  _$$OdontogramStateImplCopyWith<_$OdontogramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
