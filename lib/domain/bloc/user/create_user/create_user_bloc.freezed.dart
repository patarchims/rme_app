// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateUserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserEventCopyWith<$Res> {
  factory $CreateUserEventCopyWith(
          CreateUserEvent value, $Res Function(CreateUserEvent) then) =
      _$CreateUserEventCopyWithImpl<$Res, CreateUserEvent>;
}

/// @nodoc
class _$CreateUserEventCopyWithImpl<$Res, $Val extends CreateUserEvent>
    implements $CreateUserEventCopyWith<$Res> {
  _$CreateUserEventCopyWithImpl(this._value, this._then);

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
    extends _$CreateUserEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CreateUserEvent.started()';
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
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
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
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CreateUserEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SelectedUserLoginImplCopyWith<$Res> {
  factory _$$SelectedUserLoginImplCopyWith(_$SelectedUserLoginImpl value,
          $Res Function(_$SelectedUserLoginImpl) then) =
      __$$SelectedUserLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selected});
}

/// @nodoc
class __$$SelectedUserLoginImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$SelectedUserLoginImpl>
    implements _$$SelectedUserLoginImplCopyWith<$Res> {
  __$$SelectedUserLoginImplCopyWithImpl(_$SelectedUserLoginImpl _value,
      $Res Function(_$SelectedUserLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
  }) {
    return _then(_$SelectedUserLoginImpl(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedUserLoginImpl implements _SelectedUserLogin {
  const _$SelectedUserLoginImpl({required this.selected});

  @override
  final String selected;

  @override
  String toString() {
    return 'CreateUserEvent.selectedUserLogin(selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedUserLoginImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedUserLoginImplCopyWith<_$SelectedUserLoginImpl> get copyWith =>
      __$$SelectedUserLoginImplCopyWithImpl<_$SelectedUserLoginImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return selectedUserLogin(selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return selectedUserLogin?.call(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (selectedUserLogin != null) {
      return selectedUserLogin(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return selectedUserLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return selectedUserLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (selectedUserLogin != null) {
      return selectedUserLogin(this);
    }
    return orElse();
  }
}

abstract class _SelectedUserLogin implements CreateUserEvent {
  const factory _SelectedUserLogin({required final String selected}) =
      _$SelectedUserLoginImpl;

  String get selected;
  @JsonKey(ignore: true)
  _$$SelectedUserLoginImplCopyWith<_$SelectedUserLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CariDokterImplCopyWith<$Res> {
  factory _$$CariDokterImplCopyWith(
          _$CariDokterImpl value, $Res Function(_$CariDokterImpl) then) =
      __$$CariDokterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idDokter});
}

/// @nodoc
class __$$CariDokterImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$CariDokterImpl>
    implements _$$CariDokterImplCopyWith<$Res> {
  __$$CariDokterImplCopyWithImpl(
      _$CariDokterImpl _value, $Res Function(_$CariDokterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDokter = null,
  }) {
    return _then(_$CariDokterImpl(
      idDokter: null == idDokter
          ? _value.idDokter
          : idDokter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CariDokterImpl implements _CariDokter {
  const _$CariDokterImpl({required this.idDokter});

  @override
  final String idDokter;

  @override
  String toString() {
    return 'CreateUserEvent.cariDokter(idDokter: $idDokter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CariDokterImpl &&
            (identical(other.idDokter, idDokter) ||
                other.idDokter == idDokter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idDokter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CariDokterImplCopyWith<_$CariDokterImpl> get copyWith =>
      __$$CariDokterImplCopyWithImpl<_$CariDokterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return cariDokter(idDokter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return cariDokter?.call(idDokter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (cariDokter != null) {
      return cariDokter(idDokter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return cariDokter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return cariDokter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (cariDokter != null) {
      return cariDokter(this);
    }
    return orElse();
  }
}

abstract class _CariDokter implements CreateUserEvent {
  const factory _CariDokter({required final String idDokter}) =
      _$CariDokterImpl;

  String get idDokter;
  @JsonKey(ignore: true)
  _$$CariDokterImplCopyWith<_$CariDokterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateUserEventImplCopyWith<$Res> {
  factory _$$CreateUserEventImplCopyWith(_$CreateUserEventImpl value,
          $Res Function(_$CreateUserEventImpl) then) =
      __$$CreateUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String kodeActivasi});
}

/// @nodoc
class __$$CreateUserEventImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$CreateUserEventImpl>
    implements _$$CreateUserEventImplCopyWith<$Res> {
  __$$CreateUserEventImplCopyWithImpl(
      _$CreateUserEventImpl _value, $Res Function(_$CreateUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodeActivasi = null,
  }) {
    return _then(_$CreateUserEventImpl(
      kodeActivasi: null == kodeActivasi
          ? _value.kodeActivasi
          : kodeActivasi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateUserEventImpl implements _CreateUserEvent {
  const _$CreateUserEventImpl({required this.kodeActivasi});

  @override
  final String kodeActivasi;

  @override
  String toString() {
    return 'CreateUserEvent.verifikasiAkun(kodeActivasi: $kodeActivasi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserEventImpl &&
            (identical(other.kodeActivasi, kodeActivasi) ||
                other.kodeActivasi == kodeActivasi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kodeActivasi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserEventImplCopyWith<_$CreateUserEventImpl> get copyWith =>
      __$$CreateUserEventImplCopyWithImpl<_$CreateUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return verifikasiAkun(kodeActivasi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return verifikasiAkun?.call(kodeActivasi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (verifikasiAkun != null) {
      return verifikasiAkun(kodeActivasi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return verifikasiAkun(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return verifikasiAkun?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (verifikasiAkun != null) {
      return verifikasiAkun(this);
    }
    return orElse();
  }
}

abstract class _CreateUserEvent implements CreateUserEvent {
  const factory _CreateUserEvent({required final String kodeActivasi}) =
      _$CreateUserEventImpl;

  String get kodeActivasi;
  @JsonKey(ignore: true)
  _$$CreateUserEventImplCopyWith<_$CreateUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CleaUserImplCopyWith<$Res> {
  factory _$$CleaUserImplCopyWith(
          _$CleaUserImpl value, $Res Function(_$CleaUserImpl) then) =
      __$$CleaUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CleaUserImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$CleaUserImpl>
    implements _$$CleaUserImplCopyWith<$Res> {
  __$$CleaUserImplCopyWithImpl(
      _$CleaUserImpl _value, $Res Function(_$CleaUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CleaUserImpl implements _CleaUser {
  const _$CleaUserImpl();

  @override
  String toString() {
    return 'CreateUserEvent.clearUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CleaUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return clearUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return clearUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (clearUser != null) {
      return clearUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return clearUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return clearUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (clearUser != null) {
      return clearUser(this);
    }
    return orElse();
  }
}

abstract class _CleaUser implements CreateUserEvent {
  const factory _CleaUser() = _$CleaUserImpl;
}

/// @nodoc
abstract class _$$ChangeKodeModulImplCopyWith<$Res> {
  factory _$$ChangeKodeModulImplCopyWith(_$ChangeKodeModulImpl value,
          $Res Function(_$ChangeKodeModulImpl) then) =
      __$$ChangeKodeModulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String kodeModul});
}

/// @nodoc
class __$$ChangeKodeModulImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$ChangeKodeModulImpl>
    implements _$$ChangeKodeModulImplCopyWith<$Res> {
  __$$ChangeKodeModulImplCopyWithImpl(
      _$ChangeKodeModulImpl _value, $Res Function(_$ChangeKodeModulImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kodeModul = null,
  }) {
    return _then(_$ChangeKodeModulImpl(
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeKodeModulImpl implements _ChangeKodeModul {
  const _$ChangeKodeModulImpl({required this.kodeModul});

  @override
  final String kodeModul;

  @override
  String toString() {
    return 'CreateUserEvent.changeKodeModul(kodeModul: $kodeModul)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeKodeModulImpl &&
            (identical(other.kodeModul, kodeModul) ||
                other.kodeModul == kodeModul));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kodeModul);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeKodeModulImplCopyWith<_$ChangeKodeModulImpl> get copyWith =>
      __$$ChangeKodeModulImplCopyWithImpl<_$ChangeKodeModulImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return changeKodeModul(kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return changeKodeModul?.call(kodeModul);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (changeKodeModul != null) {
      return changeKodeModul(kodeModul);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return changeKodeModul(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return changeKodeModul?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (changeKodeModul != null) {
      return changeKodeModul(this);
    }
    return orElse();
  }
}

abstract class _ChangeKodeModul implements CreateUserEvent {
  const factory _ChangeKodeModul({required final String kodeModul}) =
      _$ChangeKodeModulImpl;

  String get kodeModul;
  @JsonKey(ignore: true)
  _$$ChangeKodeModulImplCopyWith<_$ChangeKodeModulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddUserImplCopyWith<$Res> {
  factory _$$AddUserImplCopyWith(
          _$AddUserImpl value, $Res Function(_$AddUserImpl) then) =
      __$$AddUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({KaryawanModel userModel});
}

/// @nodoc
class __$$AddUserImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$AddUserImpl>
    implements _$$AddUserImplCopyWith<$Res> {
  __$$AddUserImplCopyWithImpl(
      _$AddUserImpl _value, $Res Function(_$AddUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = null,
  }) {
    return _then(_$AddUserImpl(
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as KaryawanModel,
    ));
  }
}

/// @nodoc

class _$AddUserImpl implements _AddUser {
  const _$AddUserImpl({required this.userModel});

  @override
  final KaryawanModel userModel;

  @override
  String toString() {
    return 'CreateUserEvent.addUser(userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserImplCopyWith<_$AddUserImpl> get copyWith =>
      __$$AddUserImplCopyWithImpl<_$AddUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return addUser(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return addUser?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return addUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return addUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(this);
    }
    return orElse();
  }
}

abstract class _AddUser implements CreateUserEvent {
  const factory _AddUser({required final KaryawanModel userModel}) =
      _$AddUserImpl;

  KaryawanModel get userModel;
  @JsonKey(ignore: true)
  _$$AddUserImplCopyWith<_$AddUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetKpelayananImplCopyWith<$Res> {
  factory _$$GetKpelayananImplCopyWith(
          _$GetKpelayananImpl value, $Res Function(_$GetKpelayananImpl) then) =
      __$$GetKpelayananImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetKpelayananImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$GetKpelayananImpl>
    implements _$$GetKpelayananImplCopyWith<$Res> {
  __$$GetKpelayananImplCopyWithImpl(
      _$GetKpelayananImpl _value, $Res Function(_$GetKpelayananImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetKpelayananImpl implements _GetKpelayanan {
  const _$GetKpelayananImpl();

  @override
  String toString() {
    return 'CreateUserEvent.getKpelayanan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetKpelayananImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return getKpelayanan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return getKpelayanan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (getKpelayanan != null) {
      return getKpelayanan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return getKpelayanan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return getKpelayanan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (getKpelayanan != null) {
      return getKpelayanan(this);
    }
    return orElse();
  }
}

abstract class _GetKpelayanan implements CreateUserEvent {
  const factory _GetKpelayanan() = _$GetKpelayananImpl;
}

/// @nodoc
abstract class _$$RegisterUserImplCopyWith<$Res> {
  factory _$$RegisterUserImplCopyWith(
          _$RegisterUserImpl value, $Res Function(_$RegisterUserImpl) then) =
      __$$RegisterUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nik, String kodeModul, String password});
}

/// @nodoc
class __$$RegisterUserImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$RegisterUserImpl>
    implements _$$RegisterUserImplCopyWith<$Res> {
  __$$RegisterUserImplCopyWithImpl(
      _$RegisterUserImpl _value, $Res Function(_$RegisterUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nik = null,
    Object? kodeModul = null,
    Object? password = null,
  }) {
    return _then(_$RegisterUserImpl(
      nik: null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterUserImpl implements _RegisterUser {
  const _$RegisterUserImpl(
      {required this.nik, required this.kodeModul, required this.password});

  @override
  final String nik;
  @override
  final String kodeModul;
  @override
  final String password;

  @override
  String toString() {
    return 'CreateUserEvent.registerUser(nik: $nik, kodeModul: $kodeModul, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserImpl &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.kodeModul, kodeModul) ||
                other.kodeModul == kodeModul) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nik, kodeModul, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      __$$RegisterUserImplCopyWithImpl<_$RegisterUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return registerUser(nik, kodeModul, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return registerUser?.call(nik, kodeModul, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(nik, kodeModul, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return registerUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return registerUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(this);
    }
    return orElse();
  }
}

abstract class _RegisterUser implements CreateUserEvent {
  const factory _RegisterUser(
      {required final String nik,
      required final String kodeModul,
      required final String password}) = _$RegisterUserImpl;

  String get nik;
  String get kodeModul;
  String get password;
  @JsonKey(ignore: true)
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetKaryawanImplCopyWith<$Res> {
  factory _$$GetKaryawanImplCopyWith(
          _$GetKaryawanImpl value, $Res Function(_$GetKaryawanImpl) then) =
      __$$GetKaryawanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String params});
}

/// @nodoc
class __$$GetKaryawanImplCopyWithImpl<$Res>
    extends _$CreateUserEventCopyWithImpl<$Res, _$GetKaryawanImpl>
    implements _$$GetKaryawanImplCopyWith<$Res> {
  __$$GetKaryawanImplCopyWithImpl(
      _$GetKaryawanImpl _value, $Res Function(_$GetKaryawanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$GetKaryawanImpl(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetKaryawanImpl implements _GetKaryawan {
  const _$GetKaryawanImpl({required this.params});

  @override
  final String params;

  @override
  String toString() {
    return 'CreateUserEvent.getKaryawan(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetKaryawanImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetKaryawanImplCopyWith<_$GetKaryawanImpl> get copyWith =>
      __$$GetKaryawanImplCopyWithImpl<_$GetKaryawanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String selected) selectedUserLogin,
    required TResult Function(String idDokter) cariDokter,
    required TResult Function(String kodeActivasi) verifikasiAkun,
    required TResult Function() clearUser,
    required TResult Function(String kodeModul) changeKodeModul,
    required TResult Function(KaryawanModel userModel) addUser,
    required TResult Function() getKpelayanan,
    required TResult Function(String nik, String kodeModul, String password)
        registerUser,
    required TResult Function(String params) getKaryawan,
  }) {
    return getKaryawan(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String selected)? selectedUserLogin,
    TResult? Function(String idDokter)? cariDokter,
    TResult? Function(String kodeActivasi)? verifikasiAkun,
    TResult? Function()? clearUser,
    TResult? Function(String kodeModul)? changeKodeModul,
    TResult? Function(KaryawanModel userModel)? addUser,
    TResult? Function()? getKpelayanan,
    TResult? Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult? Function(String params)? getKaryawan,
  }) {
    return getKaryawan?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String selected)? selectedUserLogin,
    TResult Function(String idDokter)? cariDokter,
    TResult Function(String kodeActivasi)? verifikasiAkun,
    TResult Function()? clearUser,
    TResult Function(String kodeModul)? changeKodeModul,
    TResult Function(KaryawanModel userModel)? addUser,
    TResult Function()? getKpelayanan,
    TResult Function(String nik, String kodeModul, String password)?
        registerUser,
    TResult Function(String params)? getKaryawan,
    required TResult orElse(),
  }) {
    if (getKaryawan != null) {
      return getKaryawan(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedUserLogin value) selectedUserLogin,
    required TResult Function(_CariDokter value) cariDokter,
    required TResult Function(_CreateUserEvent value) verifikasiAkun,
    required TResult Function(_CleaUser value) clearUser,
    required TResult Function(_ChangeKodeModul value) changeKodeModul,
    required TResult Function(_AddUser value) addUser,
    required TResult Function(_GetKpelayanan value) getKpelayanan,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetKaryawan value) getKaryawan,
  }) {
    return getKaryawan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult? Function(_CariDokter value)? cariDokter,
    TResult? Function(_CreateUserEvent value)? verifikasiAkun,
    TResult? Function(_CleaUser value)? clearUser,
    TResult? Function(_ChangeKodeModul value)? changeKodeModul,
    TResult? Function(_AddUser value)? addUser,
    TResult? Function(_GetKpelayanan value)? getKpelayanan,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetKaryawan value)? getKaryawan,
  }) {
    return getKaryawan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedUserLogin value)? selectedUserLogin,
    TResult Function(_CariDokter value)? cariDokter,
    TResult Function(_CreateUserEvent value)? verifikasiAkun,
    TResult Function(_CleaUser value)? clearUser,
    TResult Function(_ChangeKodeModul value)? changeKodeModul,
    TResult Function(_AddUser value)? addUser,
    TResult Function(_GetKpelayanan value)? getKpelayanan,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetKaryawan value)? getKaryawan,
    required TResult orElse(),
  }) {
    if (getKaryawan != null) {
      return getKaryawan(this);
    }
    return orElse();
  }
}

abstract class _GetKaryawan implements CreateUserEvent {
  const factory _GetKaryawan({required final String params}) =
      _$GetKaryawanImpl;

  String get params;
  @JsonKey(ignore: true)
  _$$GetKaryawanImplCopyWith<_$GetKaryawanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateUserState {
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get searchDokterfailOrSuccessResult => throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get searchKaryawanfailOrSuccessResult =>
          throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get registerFailureOrSuccess => throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get verifyrFailureOrSuccess => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingSearchDokter => throw _privateConstructorUsedError;
  bool get loadingSearchKaryawan => throw _privateConstructorUsedError;
  bool get pelayananLoading => throw _privateConstructorUsedError;
  List<KPelayananModel> get pelayanan => throw _privateConstructorUsedError;
  String get kodeModul => throw _privateConstructorUsedError;
  String get selectedValue => throw _privateConstructorUsedError;
  KaryawanModel get userModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUserStateCopyWith<CreateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserStateCopyWith<$Res> {
  factory $CreateUserStateCopyWith(
          CreateUserState value, $Res Function(CreateUserState) then) =
      _$CreateUserStateCopyWithImpl<$Res, CreateUserState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchDokterfailOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchKaryawanfailOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          registerFailureOrSuccess,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          verifyrFailureOrSuccess,
      bool loading,
      bool loadingSearchDokter,
      bool loadingSearchKaryawan,
      bool pelayananLoading,
      List<KPelayananModel> pelayanan,
      String kodeModul,
      String selectedValue,
      KaryawanModel userModel});
}

/// @nodoc
class _$CreateUserStateCopyWithImpl<$Res, $Val extends CreateUserState>
    implements $CreateUserStateCopyWith<$Res> {
  _$CreateUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failOrSuccessResult = null,
    Object? searchDokterfailOrSuccessResult = null,
    Object? searchKaryawanfailOrSuccessResult = null,
    Object? registerFailureOrSuccess = null,
    Object? verifyrFailureOrSuccess = null,
    Object? loading = null,
    Object? loadingSearchDokter = null,
    Object? loadingSearchKaryawan = null,
    Object? pelayananLoading = null,
    Object? pelayanan = null,
    Object? kodeModul = null,
    Object? selectedValue = null,
    Object? userModel = null,
  }) {
    return _then(_value.copyWith(
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      searchDokterfailOrSuccessResult: null == searchDokterfailOrSuccessResult
          ? _value.searchDokterfailOrSuccessResult
          : searchDokterfailOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      searchKaryawanfailOrSuccessResult: null ==
              searchKaryawanfailOrSuccessResult
          ? _value.searchKaryawanfailOrSuccessResult
          : searchKaryawanfailOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      registerFailureOrSuccess: null == registerFailureOrSuccess
          ? _value.registerFailureOrSuccess
          : registerFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      verifyrFailureOrSuccess: null == verifyrFailureOrSuccess
          ? _value.verifyrFailureOrSuccess
          : verifyrFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSearchDokter: null == loadingSearchDokter
          ? _value.loadingSearchDokter
          : loadingSearchDokter // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSearchKaryawan: null == loadingSearchKaryawan
          ? _value.loadingSearchKaryawan
          : loadingSearchKaryawan // ignore: cast_nullable_to_non_nullable
              as bool,
      pelayananLoading: null == pelayananLoading
          ? _value.pelayananLoading
          : pelayananLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pelayanan: null == pelayanan
          ? _value.pelayanan
          : pelayanan // ignore: cast_nullable_to_non_nullable
              as List<KPelayananModel>,
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
      selectedValue: null == selectedValue
          ? _value.selectedValue
          : selectedValue // ignore: cast_nullable_to_non_nullable
              as String,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as KaryawanModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserStateImplCopyWith<$Res>
    implements $CreateUserStateCopyWith<$Res> {
  factory _$$CreateUserStateImplCopyWith(_$CreateUserStateImpl value,
          $Res Function(_$CreateUserStateImpl) then) =
      __$$CreateUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchDokterfailOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchKaryawanfailOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          registerFailureOrSuccess,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          verifyrFailureOrSuccess,
      bool loading,
      bool loadingSearchDokter,
      bool loadingSearchKaryawan,
      bool pelayananLoading,
      List<KPelayananModel> pelayanan,
      String kodeModul,
      String selectedValue,
      KaryawanModel userModel});
}

/// @nodoc
class __$$CreateUserStateImplCopyWithImpl<$Res>
    extends _$CreateUserStateCopyWithImpl<$Res, _$CreateUserStateImpl>
    implements _$$CreateUserStateImplCopyWith<$Res> {
  __$$CreateUserStateImplCopyWithImpl(
      _$CreateUserStateImpl _value, $Res Function(_$CreateUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failOrSuccessResult = null,
    Object? searchDokterfailOrSuccessResult = null,
    Object? searchKaryawanfailOrSuccessResult = null,
    Object? registerFailureOrSuccess = null,
    Object? verifyrFailureOrSuccess = null,
    Object? loading = null,
    Object? loadingSearchDokter = null,
    Object? loadingSearchKaryawan = null,
    Object? pelayananLoading = null,
    Object? pelayanan = null,
    Object? kodeModul = null,
    Object? selectedValue = null,
    Object? userModel = null,
  }) {
    return _then(_$CreateUserStateImpl(
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      searchDokterfailOrSuccessResult: null == searchDokterfailOrSuccessResult
          ? _value.searchDokterfailOrSuccessResult
          : searchDokterfailOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      searchKaryawanfailOrSuccessResult: null ==
              searchKaryawanfailOrSuccessResult
          ? _value.searchKaryawanfailOrSuccessResult
          : searchKaryawanfailOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      registerFailureOrSuccess: null == registerFailureOrSuccess
          ? _value.registerFailureOrSuccess
          : registerFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      verifyrFailureOrSuccess: null == verifyrFailureOrSuccess
          ? _value.verifyrFailureOrSuccess
          : verifyrFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSearchDokter: null == loadingSearchDokter
          ? _value.loadingSearchDokter
          : loadingSearchDokter // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSearchKaryawan: null == loadingSearchKaryawan
          ? _value.loadingSearchKaryawan
          : loadingSearchKaryawan // ignore: cast_nullable_to_non_nullable
              as bool,
      pelayananLoading: null == pelayananLoading
          ? _value.pelayananLoading
          : pelayananLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pelayanan: null == pelayanan
          ? _value._pelayanan
          : pelayanan // ignore: cast_nullable_to_non_nullable
              as List<KPelayananModel>,
      kodeModul: null == kodeModul
          ? _value.kodeModul
          : kodeModul // ignore: cast_nullable_to_non_nullable
              as String,
      selectedValue: null == selectedValue
          ? _value.selectedValue
          : selectedValue // ignore: cast_nullable_to_non_nullable
              as String,
      userModel: null == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as KaryawanModel,
    ));
  }
}

/// @nodoc

class _$CreateUserStateImpl implements _CreateUserState {
  const _$CreateUserStateImpl(
      {required this.failOrSuccessResult,
      required this.searchDokterfailOrSuccessResult,
      required this.searchKaryawanfailOrSuccessResult,
      required this.registerFailureOrSuccess,
      required this.verifyrFailureOrSuccess,
      required this.loading,
      required this.loadingSearchDokter,
      required this.loadingSearchKaryawan,
      required this.pelayananLoading,
      required final List<KPelayananModel> pelayanan,
      required this.kodeModul,
      required this.selectedValue,
      required this.userModel})
      : _pelayanan = pelayanan;

  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      searchDokterfailOrSuccessResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      searchKaryawanfailOrSuccessResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      registerFailureOrSuccess;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      verifyrFailureOrSuccess;
  @override
  final bool loading;
  @override
  final bool loadingSearchDokter;
  @override
  final bool loadingSearchKaryawan;
  @override
  final bool pelayananLoading;
  final List<KPelayananModel> _pelayanan;
  @override
  List<KPelayananModel> get pelayanan {
    if (_pelayanan is EqualUnmodifiableListView) return _pelayanan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pelayanan);
  }

  @override
  final String kodeModul;
  @override
  final String selectedValue;
  @override
  final KaryawanModel userModel;

  @override
  String toString() {
    return 'CreateUserState(failOrSuccessResult: $failOrSuccessResult, searchDokterfailOrSuccessResult: $searchDokterfailOrSuccessResult, searchKaryawanfailOrSuccessResult: $searchKaryawanfailOrSuccessResult, registerFailureOrSuccess: $registerFailureOrSuccess, verifyrFailureOrSuccess: $verifyrFailureOrSuccess, loading: $loading, loadingSearchDokter: $loadingSearchDokter, loadingSearchKaryawan: $loadingSearchKaryawan, pelayananLoading: $pelayananLoading, pelayanan: $pelayanan, kodeModul: $kodeModul, selectedValue: $selectedValue, userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserStateImpl &&
            (identical(other.failOrSuccessResult, failOrSuccessResult) ||
                other.failOrSuccessResult == failOrSuccessResult) &&
            (identical(other.searchDokterfailOrSuccessResult,
                    searchDokterfailOrSuccessResult) ||
                other.searchDokterfailOrSuccessResult ==
                    searchDokterfailOrSuccessResult) &&
            (identical(other.searchKaryawanfailOrSuccessResult,
                    searchKaryawanfailOrSuccessResult) ||
                other.searchKaryawanfailOrSuccessResult ==
                    searchKaryawanfailOrSuccessResult) &&
            (identical(
                    other.registerFailureOrSuccess, registerFailureOrSuccess) ||
                other.registerFailureOrSuccess == registerFailureOrSuccess) &&
            (identical(other.verifyrFailureOrSuccess, verifyrFailureOrSuccess) ||
                other.verifyrFailureOrSuccess == verifyrFailureOrSuccess) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingSearchDokter, loadingSearchDokter) ||
                other.loadingSearchDokter == loadingSearchDokter) &&
            (identical(other.loadingSearchKaryawan, loadingSearchKaryawan) ||
                other.loadingSearchKaryawan == loadingSearchKaryawan) &&
            (identical(other.pelayananLoading, pelayananLoading) ||
                other.pelayananLoading == pelayananLoading) &&
            const DeepCollectionEquality()
                .equals(other._pelayanan, _pelayanan) &&
            (identical(other.kodeModul, kodeModul) ||
                other.kodeModul == kodeModul) &&
            (identical(other.selectedValue, selectedValue) ||
                other.selectedValue == selectedValue) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failOrSuccessResult,
      searchDokterfailOrSuccessResult,
      searchKaryawanfailOrSuccessResult,
      registerFailureOrSuccess,
      verifyrFailureOrSuccess,
      loading,
      loadingSearchDokter,
      loadingSearchKaryawan,
      pelayananLoading,
      const DeepCollectionEquality().hash(_pelayanan),
      kodeModul,
      selectedValue,
      userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserStateImplCopyWith<_$CreateUserStateImpl> get copyWith =>
      __$$CreateUserStateImplCopyWithImpl<_$CreateUserStateImpl>(
          this, _$identity);
}

abstract class _CreateUserState implements CreateUserState {
  const factory _CreateUserState(
      {required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchDokterfailOrSuccessResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          searchKaryawanfailOrSuccessResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          registerFailureOrSuccess,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          verifyrFailureOrSuccess,
      required final bool loading,
      required final bool loadingSearchDokter,
      required final bool loadingSearchKaryawan,
      required final bool pelayananLoading,
      required final List<KPelayananModel> pelayanan,
      required final String kodeModul,
      required final String selectedValue,
      required final KaryawanModel userModel}) = _$CreateUserStateImpl;

  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get searchDokterfailOrSuccessResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get searchKaryawanfailOrSuccessResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get registerFailureOrSuccess;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get verifyrFailureOrSuccess;
  @override
  bool get loading;
  @override
  bool get loadingSearchDokter;
  @override
  bool get loadingSearchKaryawan;
  @override
  bool get pelayananLoading;
  @override
  List<KPelayananModel> get pelayanan;
  @override
  String get kodeModul;
  @override
  String get selectedValue;
  @override
  KaryawanModel get userModel;
  @override
  @JsonKey(ignore: true)
  _$$CreateUserStateImplCopyWith<_$CreateUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
