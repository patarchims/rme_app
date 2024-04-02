// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_diagnosa_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InputDiagnosaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputDiagnosaEventCopyWith<$Res> {
  factory $InputDiagnosaEventCopyWith(
          InputDiagnosaEvent value, $Res Function(InputDiagnosaEvent) then) =
      _$InputDiagnosaEventCopyWithImpl<$Res, InputDiagnosaEvent>;
}

/// @nodoc
class _$InputDiagnosaEventCopyWithImpl<$Res, $Val extends InputDiagnosaEvent>
    implements $InputDiagnosaEventCopyWith<$Res> {
  _$InputDiagnosaEventCopyWithImpl(this._value, this._then);

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
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'InputDiagnosaEvent.started()';
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
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
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
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InputDiagnosaEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddDiagnosaImplCopyWith<$Res> {
  factory _$$AddDiagnosaImplCopyWith(
          _$AddDiagnosaImpl value, $Res Function(_$AddDiagnosaImpl) then) =
      __$$AddDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagnosaModel diagnosaModel});
}

/// @nodoc
class __$$AddDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$AddDiagnosaImpl>
    implements _$$AddDiagnosaImplCopyWith<$Res> {
  __$$AddDiagnosaImplCopyWithImpl(
      _$AddDiagnosaImpl _value, $Res Function(_$AddDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnosaModel = null,
  }) {
    return _then(_$AddDiagnosaImpl(
      diagnosaModel: null == diagnosaModel
          ? _value.diagnosaModel
          : diagnosaModel // ignore: cast_nullable_to_non_nullable
              as DiagnosaModel,
    ));
  }
}

/// @nodoc

class _$AddDiagnosaImpl implements _AddDiagnosa {
  const _$AddDiagnosaImpl({required this.diagnosaModel});

  @override
  final DiagnosaModel diagnosaModel;

  @override
  String toString() {
    return 'InputDiagnosaEvent.addDiagnosa(diagnosaModel: $diagnosaModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDiagnosaImpl &&
            (identical(other.diagnosaModel, diagnosaModel) ||
                other.diagnosaModel == diagnosaModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diagnosaModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDiagnosaImplCopyWith<_$AddDiagnosaImpl> get copyWith =>
      __$$AddDiagnosaImplCopyWithImpl<_$AddDiagnosaImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return addDiagnosa(diagnosaModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return addDiagnosa?.call(diagnosaModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addDiagnosa != null) {
      return addDiagnosa(diagnosaModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return addDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return addDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addDiagnosa != null) {
      return addDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _AddDiagnosa implements InputDiagnosaEvent {
  const factory _AddDiagnosa({required final DiagnosaModel diagnosaModel}) =
      _$AddDiagnosaImpl;

  DiagnosaModel get diagnosaModel;
  @JsonKey(ignore: true)
  _$$AddDiagnosaImplCopyWith<_$AddDiagnosaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDiagnosaImplCopyWith<$Res> {
  factory _$$GetDiagnosaImplCopyWith(
          _$GetDiagnosaImpl value, $Res Function(_$GetDiagnosaImpl) then) =
      __$$GetDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noreg});
}

/// @nodoc
class __$$GetDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$GetDiagnosaImpl>
    implements _$$GetDiagnosaImplCopyWith<$Res> {
  __$$GetDiagnosaImplCopyWithImpl(
      _$GetDiagnosaImpl _value, $Res Function(_$GetDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noreg = null,
  }) {
    return _then(_$GetDiagnosaImpl(
      noreg: null == noreg
          ? _value.noreg
          : noreg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDiagnosaImpl implements _GetDiagnosa {
  const _$GetDiagnosaImpl({required this.noreg});

  @override
  final String noreg;

  @override
  String toString() {
    return 'InputDiagnosaEvent.getDiagnosa(noreg: $noreg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDiagnosaImpl &&
            (identical(other.noreg, noreg) || other.noreg == noreg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noreg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDiagnosaImplCopyWith<_$GetDiagnosaImpl> get copyWith =>
      __$$GetDiagnosaImplCopyWithImpl<_$GetDiagnosaImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return getDiagnosa(noreg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return getDiagnosa?.call(noreg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (getDiagnosa != null) {
      return getDiagnosa(noreg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return getDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return getDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (getDiagnosa != null) {
      return getDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _GetDiagnosa implements InputDiagnosaEvent {
  const factory _GetDiagnosa({required final String noreg}) = _$GetDiagnosaImpl;

  String get noreg;
  @JsonKey(ignore: true)
  _$$GetDiagnosaImplCopyWith<_$GetDiagnosaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveDiagnosaImplCopyWith<$Res> {
  factory _$$SaveDiagnosaImplCopyWith(
          _$SaveDiagnosaImpl value, $Res Function(_$SaveDiagnosaImpl) then) =
      __$$SaveDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String noreg,
      String code,
      String type,
      String table,
      String person,
      String userID,
      String deviceID,
      String pelayanan});
}

/// @nodoc
class __$$SaveDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$SaveDiagnosaImpl>
    implements _$$SaveDiagnosaImplCopyWith<$Res> {
  __$$SaveDiagnosaImplCopyWithImpl(
      _$SaveDiagnosaImpl _value, $Res Function(_$SaveDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noreg = null,
    Object? code = null,
    Object? type = null,
    Object? table = null,
    Object? person = null,
    Object? userID = null,
    Object? deviceID = null,
    Object? pelayanan = null,
  }) {
    return _then(_$SaveDiagnosaImpl(
      noreg: null == noreg
          ? _value.noreg
          : noreg // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      deviceID: null == deviceID
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String,
      pelayanan: null == pelayanan
          ? _value.pelayanan
          : pelayanan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveDiagnosaImpl implements _SaveDiagnosa {
  const _$SaveDiagnosaImpl(
      {required this.noreg,
      required this.code,
      required this.type,
      required this.table,
      required this.person,
      required this.userID,
      required this.deviceID,
      required this.pelayanan});

  @override
  final String noreg;
  @override
  final String code;
  @override
  final String type;
  @override
  final String table;
  @override
  final String person;
  @override
  final String userID;
  @override
  final String deviceID;
  @override
  final String pelayanan;

  @override
  String toString() {
    return 'InputDiagnosaEvent.saveDiagnosa(noreg: $noreg, code: $code, type: $type, table: $table, person: $person, userID: $userID, deviceID: $deviceID, pelayanan: $pelayanan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveDiagnosaImpl &&
            (identical(other.noreg, noreg) || other.noreg == noreg) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.deviceID, deviceID) ||
                other.deviceID == deviceID) &&
            (identical(other.pelayanan, pelayanan) ||
                other.pelayanan == pelayanan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noreg, code, type, table, person,
      userID, deviceID, pelayanan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveDiagnosaImplCopyWith<_$SaveDiagnosaImpl> get copyWith =>
      __$$SaveDiagnosaImplCopyWithImpl<_$SaveDiagnosaImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return saveDiagnosa(
        noreg, code, type, table, person, userID, deviceID, pelayanan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return saveDiagnosa?.call(
        noreg, code, type, table, person, userID, deviceID, pelayanan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (saveDiagnosa != null) {
      return saveDiagnosa(
          noreg, code, type, table, person, userID, deviceID, pelayanan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return saveDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return saveDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (saveDiagnosa != null) {
      return saveDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _SaveDiagnosa implements InputDiagnosaEvent {
  const factory _SaveDiagnosa(
      {required final String noreg,
      required final String code,
      required final String type,
      required final String table,
      required final String person,
      required final String userID,
      required final String deviceID,
      required final String pelayanan}) = _$SaveDiagnosaImpl;

  String get noreg;
  String get code;
  String get type;
  String get table;
  String get person;
  String get userID;
  String get deviceID;
  String get pelayanan;
  @JsonKey(ignore: true)
  _$$SaveDiagnosaImplCopyWith<_$SaveDiagnosaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPrimaryDiagnosaImplCopyWith<$Res> {
  factory _$$AddPrimaryDiagnosaImplCopyWith(_$AddPrimaryDiagnosaImpl value,
          $Res Function(_$AddPrimaryDiagnosaImpl) then) =
      __$$AddPrimaryDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagnosaIcdModel diagnosaIcdModel});
}

/// @nodoc
class __$$AddPrimaryDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$AddPrimaryDiagnosaImpl>
    implements _$$AddPrimaryDiagnosaImplCopyWith<$Res> {
  __$$AddPrimaryDiagnosaImplCopyWithImpl(_$AddPrimaryDiagnosaImpl _value,
      $Res Function(_$AddPrimaryDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnosaIcdModel = null,
  }) {
    return _then(_$AddPrimaryDiagnosaImpl(
      diagnosaIcdModel: null == diagnosaIcdModel
          ? _value.diagnosaIcdModel
          : diagnosaIcdModel // ignore: cast_nullable_to_non_nullable
              as DiagnosaIcdModel,
    ));
  }
}

/// @nodoc

class _$AddPrimaryDiagnosaImpl implements _AddPrimaryDiagnosa {
  const _$AddPrimaryDiagnosaImpl({required this.diagnosaIcdModel});

  @override
  final DiagnosaIcdModel diagnosaIcdModel;

  @override
  String toString() {
    return 'InputDiagnosaEvent.addPrimaryDiagnosa(diagnosaIcdModel: $diagnosaIcdModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPrimaryDiagnosaImpl &&
            (identical(other.diagnosaIcdModel, diagnosaIcdModel) ||
                other.diagnosaIcdModel == diagnosaIcdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diagnosaIcdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPrimaryDiagnosaImplCopyWith<_$AddPrimaryDiagnosaImpl> get copyWith =>
      __$$AddPrimaryDiagnosaImplCopyWithImpl<_$AddPrimaryDiagnosaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return addPrimaryDiagnosa(diagnosaIcdModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return addPrimaryDiagnosa?.call(diagnosaIcdModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addPrimaryDiagnosa != null) {
      return addPrimaryDiagnosa(diagnosaIcdModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return addPrimaryDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return addPrimaryDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addPrimaryDiagnosa != null) {
      return addPrimaryDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _AddPrimaryDiagnosa implements InputDiagnosaEvent {
  const factory _AddPrimaryDiagnosa(
          {required final DiagnosaIcdModel diagnosaIcdModel}) =
      _$AddPrimaryDiagnosaImpl;

  DiagnosaIcdModel get diagnosaIcdModel;
  @JsonKey(ignore: true)
  _$$AddPrimaryDiagnosaImplCopyWith<_$AddPrimaryDiagnosaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSecondaryDiagnosaImplCopyWith<$Res> {
  factory _$$AddSecondaryDiagnosaImplCopyWith(_$AddSecondaryDiagnosaImpl value,
          $Res Function(_$AddSecondaryDiagnosaImpl) then) =
      __$$AddSecondaryDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagnosaIcdModel diagnosaIcdModel});
}

/// @nodoc
class __$$AddSecondaryDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$AddSecondaryDiagnosaImpl>
    implements _$$AddSecondaryDiagnosaImplCopyWith<$Res> {
  __$$AddSecondaryDiagnosaImplCopyWithImpl(_$AddSecondaryDiagnosaImpl _value,
      $Res Function(_$AddSecondaryDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnosaIcdModel = null,
  }) {
    return _then(_$AddSecondaryDiagnosaImpl(
      diagnosaIcdModel: null == diagnosaIcdModel
          ? _value.diagnosaIcdModel
          : diagnosaIcdModel // ignore: cast_nullable_to_non_nullable
              as DiagnosaIcdModel,
    ));
  }
}

/// @nodoc

class _$AddSecondaryDiagnosaImpl implements _AddSecondaryDiagnosa {
  const _$AddSecondaryDiagnosaImpl({required this.diagnosaIcdModel});

  @override
  final DiagnosaIcdModel diagnosaIcdModel;

  @override
  String toString() {
    return 'InputDiagnosaEvent.addSecondaryDiagnosa(diagnosaIcdModel: $diagnosaIcdModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSecondaryDiagnosaImpl &&
            (identical(other.diagnosaIcdModel, diagnosaIcdModel) ||
                other.diagnosaIcdModel == diagnosaIcdModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diagnosaIcdModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSecondaryDiagnosaImplCopyWith<_$AddSecondaryDiagnosaImpl>
      get copyWith =>
          __$$AddSecondaryDiagnosaImplCopyWithImpl<_$AddSecondaryDiagnosaImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return addSecondaryDiagnosa(diagnosaIcdModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return addSecondaryDiagnosa?.call(diagnosaIcdModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addSecondaryDiagnosa != null) {
      return addSecondaryDiagnosa(diagnosaIcdModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return addSecondaryDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return addSecondaryDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addSecondaryDiagnosa != null) {
      return addSecondaryDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _AddSecondaryDiagnosa implements InputDiagnosaEvent {
  const factory _AddSecondaryDiagnosa(
          {required final DiagnosaIcdModel diagnosaIcdModel}) =
      _$AddSecondaryDiagnosaImpl;

  DiagnosaIcdModel get diagnosaIcdModel;
  @JsonKey(ignore: true)
  _$$AddSecondaryDiagnosaImplCopyWith<_$AddSecondaryDiagnosaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnGetDiagnosaImplCopyWith<$Res> {
  factory _$$OnGetDiagnosaImplCopyWith(
          _$OnGetDiagnosaImpl value, $Res Function(_$OnGetDiagnosaImpl) then) =
      __$$OnGetDiagnosaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGetDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$OnGetDiagnosaImpl>
    implements _$$OnGetDiagnosaImplCopyWith<$Res> {
  __$$OnGetDiagnosaImplCopyWithImpl(
      _$OnGetDiagnosaImpl _value, $Res Function(_$OnGetDiagnosaImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnGetDiagnosaImpl implements _OnGetDiagnosa {
  const _$OnGetDiagnosaImpl();

  @override
  String toString() {
    return 'InputDiagnosaEvent.onGetDiagnosa()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGetDiagnosaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return onGetDiagnosa();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return onGetDiagnosa?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (onGetDiagnosa != null) {
      return onGetDiagnosa();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return onGetDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return onGetDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (onGetDiagnosa != null) {
      return onGetDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _OnGetDiagnosa implements InputDiagnosaEvent {
  const factory _OnGetDiagnosa() = _$OnGetDiagnosaImpl;
}

/// @nodoc
abstract class _$$EnableButtonImplCopyWith<$Res> {
  factory _$$EnableButtonImplCopyWith(
          _$EnableButtonImpl value, $Res Function(_$EnableButtonImpl) then) =
      __$$EnableButtonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$EnableButtonImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$EnableButtonImpl>
    implements _$$EnableButtonImplCopyWith<$Res> {
  __$$EnableButtonImplCopyWithImpl(
      _$EnableButtonImpl _value, $Res Function(_$EnableButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$EnableButtonImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EnableButtonImpl implements _EnableButton {
  const _$EnableButtonImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'InputDiagnosaEvent.enableButton(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableButtonImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnableButtonImplCopyWith<_$EnableButtonImpl> get copyWith =>
      __$$EnableButtonImplCopyWithImpl<_$EnableButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return enableButton(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return enableButton?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (enableButton != null) {
      return enableButton(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return enableButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return enableButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (enableButton != null) {
      return enableButton(this);
    }
    return orElse();
  }
}

abstract class _EnableButton implements InputDiagnosaEvent {
  const factory _EnableButton({required final int index}) = _$EnableButtonImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$EnableButtonImplCopyWith<_$EnableButtonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteButtonImplCopyWith<$Res> {
  factory _$$DeleteButtonImplCopyWith(
          _$DeleteButtonImpl value, $Res Function(_$DeleteButtonImpl) then) =
      __$$DeleteButtonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeleteButtonImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$DeleteButtonImpl>
    implements _$$DeleteButtonImplCopyWith<$Res> {
  __$$DeleteButtonImplCopyWithImpl(
      _$DeleteButtonImpl _value, $Res Function(_$DeleteButtonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeleteButtonImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteButtonImpl implements _DeleteButton {
  const _$DeleteButtonImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'InputDiagnosaEvent.deleteButton(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteButtonImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteButtonImplCopyWith<_$DeleteButtonImpl> get copyWith =>
      __$$DeleteButtonImplCopyWithImpl<_$DeleteButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return deleteButton(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return deleteButton?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (deleteButton != null) {
      return deleteButton(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return deleteButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return deleteButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (deleteButton != null) {
      return deleteButton(this);
    }
    return orElse();
  }
}

abstract class _DeleteButton implements InputDiagnosaEvent {
  const factory _DeleteButton({required final int index}) = _$DeleteButtonImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeleteButtonImplCopyWith<_$DeleteButtonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteItemImplCopyWith<$Res> {
  factory _$$DeleteItemImplCopyWith(
          _$DeleteItemImpl value, $Res Function(_$DeleteItemImpl) then) =
      __$$DeleteItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg, String table});
}

/// @nodoc
class __$$DeleteItemImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$DeleteItemImpl>
    implements _$$DeleteItemImplCopyWith<$Res> {
  __$$DeleteItemImplCopyWithImpl(
      _$DeleteItemImpl _value, $Res Function(_$DeleteItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
    Object? table = null,
  }) {
    return _then(_$DeleteItemImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteItemImpl implements _DeleteItem {
  const _$DeleteItemImpl({required this.noReg, required this.table});

  @override
  final String noReg;
  @override
  final String table;

  @override
  String toString() {
    return 'InputDiagnosaEvent.deleteItem(noReg: $noReg, table: $table)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteItemImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.table, table) || other.table == table));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg, table);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      __$$DeleteItemImplCopyWithImpl<_$DeleteItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return deleteItem(noReg, table);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return deleteItem?.call(noReg, table);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(noReg, table);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteItem implements InputDiagnosaEvent {
  const factory _DeleteItem(
      {required final String noReg,
      required final String table}) = _$DeleteItemImpl;

  String get noReg;
  String get table;
  @JsonKey(ignore: true)
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddListDiagnosaImplCopyWith<$Res> {
  factory _$$AddListDiagnosaImplCopyWith(_$AddListDiagnosaImpl value,
          $Res Function(_$AddListDiagnosaImpl) then) =
      __$$AddListDiagnosaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$AddListDiagnosaImplCopyWithImpl<$Res>
    extends _$InputDiagnosaEventCopyWithImpl<$Res, _$AddListDiagnosaImpl>
    implements _$$AddListDiagnosaImplCopyWith<$Res> {
  __$$AddListDiagnosaImplCopyWithImpl(
      _$AddListDiagnosaImpl _value, $Res Function(_$AddListDiagnosaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$AddListDiagnosaImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddListDiagnosaImpl implements _AddListDiagnosa {
  const _$AddListDiagnosaImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'InputDiagnosaEvent.addListDiagnosa(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddListDiagnosaImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddListDiagnosaImplCopyWith<_$AddListDiagnosaImpl> get copyWith =>
      __$$AddListDiagnosaImplCopyWithImpl<_$AddListDiagnosaImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DiagnosaModel diagnosaModel) addDiagnosa,
    required TResult Function(String noreg) getDiagnosa,
    required TResult Function(
            String noreg,
            String code,
            String type,
            String table,
            String person,
            String userID,
            String deviceID,
            String pelayanan)
        saveDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addPrimaryDiagnosa,
    required TResult Function(DiagnosaIcdModel diagnosaIcdModel)
        addSecondaryDiagnosa,
    required TResult Function() onGetDiagnosa,
    required TResult Function(int index) enableButton,
    required TResult Function(int index) deleteButton,
    required TResult Function(String noReg, String table) deleteItem,
    required TResult Function(int index) addListDiagnosa,
  }) {
    return addListDiagnosa(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult? Function(String noreg)? getDiagnosa,
    TResult? Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult? Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult? Function()? onGetDiagnosa,
    TResult? Function(int index)? enableButton,
    TResult? Function(int index)? deleteButton,
    TResult? Function(String noReg, String table)? deleteItem,
    TResult? Function(int index)? addListDiagnosa,
  }) {
    return addListDiagnosa?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DiagnosaModel diagnosaModel)? addDiagnosa,
    TResult Function(String noreg)? getDiagnosa,
    TResult Function(String noreg, String code, String type, String table,
            String person, String userID, String deviceID, String pelayanan)?
        saveDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addPrimaryDiagnosa,
    TResult Function(DiagnosaIcdModel diagnosaIcdModel)? addSecondaryDiagnosa,
    TResult Function()? onGetDiagnosa,
    TResult Function(int index)? enableButton,
    TResult Function(int index)? deleteButton,
    TResult Function(String noReg, String table)? deleteItem,
    TResult Function(int index)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addListDiagnosa != null) {
      return addListDiagnosa(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddDiagnosa value) addDiagnosa,
    required TResult Function(_GetDiagnosa value) getDiagnosa,
    required TResult Function(_SaveDiagnosa value) saveDiagnosa,
    required TResult Function(_AddPrimaryDiagnosa value) addPrimaryDiagnosa,
    required TResult Function(_AddSecondaryDiagnosa value) addSecondaryDiagnosa,
    required TResult Function(_OnGetDiagnosa value) onGetDiagnosa,
    required TResult Function(_EnableButton value) enableButton,
    required TResult Function(_DeleteButton value) deleteButton,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_AddListDiagnosa value) addListDiagnosa,
  }) {
    return addListDiagnosa(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddDiagnosa value)? addDiagnosa,
    TResult? Function(_GetDiagnosa value)? getDiagnosa,
    TResult? Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult? Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult? Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult? Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult? Function(_EnableButton value)? enableButton,
    TResult? Function(_DeleteButton value)? deleteButton,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_AddListDiagnosa value)? addListDiagnosa,
  }) {
    return addListDiagnosa?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddDiagnosa value)? addDiagnosa,
    TResult Function(_GetDiagnosa value)? getDiagnosa,
    TResult Function(_SaveDiagnosa value)? saveDiagnosa,
    TResult Function(_AddPrimaryDiagnosa value)? addPrimaryDiagnosa,
    TResult Function(_AddSecondaryDiagnosa value)? addSecondaryDiagnosa,
    TResult Function(_OnGetDiagnosa value)? onGetDiagnosa,
    TResult Function(_EnableButton value)? enableButton,
    TResult Function(_DeleteButton value)? deleteButton,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_AddListDiagnosa value)? addListDiagnosa,
    required TResult orElse(),
  }) {
    if (addListDiagnosa != null) {
      return addListDiagnosa(this);
    }
    return orElse();
  }
}

abstract class _AddListDiagnosa implements InputDiagnosaEvent {
  const factory _AddListDiagnosa({required final int index}) =
      _$AddListDiagnosaImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$AddListDiagnosaImplCopyWith<_$AddListDiagnosaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InputDiagnosaState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAdd => throw _privateConstructorUsedError;
  bool get isGet => throw _privateConstructorUsedError;
  bool get isDelete => throw _privateConstructorUsedError;
  bool get isSave => throw _privateConstructorUsedError;
  bool get isErrorSaveData => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  DiagnosaModel? get diagnosaModel => throw _privateConstructorUsedError;
  List<DiagnosaIcdModel> get diagnosaICD => throw _privateConstructorUsedError;
  List<DiagnosaIcdModel> get diagnosaSecondary =>
      throw _privateConstructorUsedError;
  List<DiagnosaModel> get diagnosa => throw _privateConstructorUsedError;
  int get enableDelete => throw _privateConstructorUsedError;
  int get enableAdd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputDiagnosaStateCopyWith<InputDiagnosaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputDiagnosaStateCopyWith<$Res> {
  factory $InputDiagnosaStateCopyWith(
          InputDiagnosaState value, $Res Function(InputDiagnosaState) then) =
      _$InputDiagnosaStateCopyWithImpl<$Res, InputDiagnosaState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdd,
      bool isGet,
      bool isDelete,
      bool isSave,
      bool isErrorSaveData,
      String errorMessage,
      DiagnosaModel? diagnosaModel,
      List<DiagnosaIcdModel> diagnosaICD,
      List<DiagnosaIcdModel> diagnosaSecondary,
      List<DiagnosaModel> diagnosa,
      int enableDelete,
      int enableAdd});
}

/// @nodoc
class _$InputDiagnosaStateCopyWithImpl<$Res, $Val extends InputDiagnosaState>
    implements $InputDiagnosaStateCopyWith<$Res> {
  _$InputDiagnosaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAdd = null,
    Object? isGet = null,
    Object? isDelete = null,
    Object? isSave = null,
    Object? isErrorSaveData = null,
    Object? errorMessage = null,
    Object? diagnosaModel = freezed,
    Object? diagnosaICD = null,
    Object? diagnosaSecondary = null,
    Object? diagnosa = null,
    Object? enableDelete = null,
    Object? enableAdd = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdd: null == isAdd
          ? _value.isAdd
          : isAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      isGet: null == isGet
          ? _value.isGet
          : isGet // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isErrorSaveData: null == isErrorSaveData
          ? _value.isErrorSaveData
          : isErrorSaveData // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosaModel: freezed == diagnosaModel
          ? _value.diagnosaModel
          : diagnosaModel // ignore: cast_nullable_to_non_nullable
              as DiagnosaModel?,
      diagnosaICD: null == diagnosaICD
          ? _value.diagnosaICD
          : diagnosaICD // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaIcdModel>,
      diagnosaSecondary: null == diagnosaSecondary
          ? _value.diagnosaSecondary
          : diagnosaSecondary // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaIcdModel>,
      diagnosa: null == diagnosa
          ? _value.diagnosa
          : diagnosa // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaModel>,
      enableDelete: null == enableDelete
          ? _value.enableDelete
          : enableDelete // ignore: cast_nullable_to_non_nullable
              as int,
      enableAdd: null == enableAdd
          ? _value.enableAdd
          : enableAdd // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputDiagnosaStateImplCopyWith<$Res>
    implements $InputDiagnosaStateCopyWith<$Res> {
  factory _$$InputDiagnosaStateImplCopyWith(_$InputDiagnosaStateImpl value,
          $Res Function(_$InputDiagnosaStateImpl) then) =
      __$$InputDiagnosaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isAdd,
      bool isGet,
      bool isDelete,
      bool isSave,
      bool isErrorSaveData,
      String errorMessage,
      DiagnosaModel? diagnosaModel,
      List<DiagnosaIcdModel> diagnosaICD,
      List<DiagnosaIcdModel> diagnosaSecondary,
      List<DiagnosaModel> diagnosa,
      int enableDelete,
      int enableAdd});
}

/// @nodoc
class __$$InputDiagnosaStateImplCopyWithImpl<$Res>
    extends _$InputDiagnosaStateCopyWithImpl<$Res, _$InputDiagnosaStateImpl>
    implements _$$InputDiagnosaStateImplCopyWith<$Res> {
  __$$InputDiagnosaStateImplCopyWithImpl(_$InputDiagnosaStateImpl _value,
      $Res Function(_$InputDiagnosaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isAdd = null,
    Object? isGet = null,
    Object? isDelete = null,
    Object? isSave = null,
    Object? isErrorSaveData = null,
    Object? errorMessage = null,
    Object? diagnosaModel = freezed,
    Object? diagnosaICD = null,
    Object? diagnosaSecondary = null,
    Object? diagnosa = null,
    Object? enableDelete = null,
    Object? enableAdd = null,
  }) {
    return _then(_$InputDiagnosaStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdd: null == isAdd
          ? _value.isAdd
          : isAdd // ignore: cast_nullable_to_non_nullable
              as bool,
      isGet: null == isGet
          ? _value.isGet
          : isGet // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isErrorSaveData: null == isErrorSaveData
          ? _value.isErrorSaveData
          : isErrorSaveData // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosaModel: freezed == diagnosaModel
          ? _value.diagnosaModel
          : diagnosaModel // ignore: cast_nullable_to_non_nullable
              as DiagnosaModel?,
      diagnosaICD: null == diagnosaICD
          ? _value._diagnosaICD
          : diagnosaICD // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaIcdModel>,
      diagnosaSecondary: null == diagnosaSecondary
          ? _value._diagnosaSecondary
          : diagnosaSecondary // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaIcdModel>,
      diagnosa: null == diagnosa
          ? _value._diagnosa
          : diagnosa // ignore: cast_nullable_to_non_nullable
              as List<DiagnosaModel>,
      enableDelete: null == enableDelete
          ? _value.enableDelete
          : enableDelete // ignore: cast_nullable_to_non_nullable
              as int,
      enableAdd: null == enableAdd
          ? _value.enableAdd
          : enableAdd // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InputDiagnosaStateImpl implements _InputDiagnosaState {
  _$InputDiagnosaStateImpl(
      {this.isLoading = false,
      this.isAdd = false,
      this.isGet = false,
      this.isDelete = false,
      this.isSave = false,
      this.isErrorSaveData = false,
      this.errorMessage = "",
      this.diagnosaModel = null,
      final List<DiagnosaIcdModel> diagnosaICD = const [],
      final List<DiagnosaIcdModel> diagnosaSecondary = const [],
      final List<DiagnosaModel> diagnosa = const [],
      this.enableDelete = 0,
      this.enableAdd = 0})
      : _diagnosaICD = diagnosaICD,
        _diagnosaSecondary = diagnosaSecondary,
        _diagnosa = diagnosa;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAdd;
  @override
  @JsonKey()
  final bool isGet;
  @override
  @JsonKey()
  final bool isDelete;
  @override
  @JsonKey()
  final bool isSave;
  @override
  @JsonKey()
  final bool isErrorSaveData;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final DiagnosaModel? diagnosaModel;
  final List<DiagnosaIcdModel> _diagnosaICD;
  @override
  @JsonKey()
  List<DiagnosaIcdModel> get diagnosaICD {
    if (_diagnosaICD is EqualUnmodifiableListView) return _diagnosaICD;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnosaICD);
  }

  final List<DiagnosaIcdModel> _diagnosaSecondary;
  @override
  @JsonKey()
  List<DiagnosaIcdModel> get diagnosaSecondary {
    if (_diagnosaSecondary is EqualUnmodifiableListView)
      return _diagnosaSecondary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnosaSecondary);
  }

  final List<DiagnosaModel> _diagnosa;
  @override
  @JsonKey()
  List<DiagnosaModel> get diagnosa {
    if (_diagnosa is EqualUnmodifiableListView) return _diagnosa;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnosa);
  }

  @override
  @JsonKey()
  final int enableDelete;
  @override
  @JsonKey()
  final int enableAdd;

  @override
  String toString() {
    return 'InputDiagnosaState(isLoading: $isLoading, isAdd: $isAdd, isGet: $isGet, isDelete: $isDelete, isSave: $isSave, isErrorSaveData: $isErrorSaveData, errorMessage: $errorMessage, diagnosaModel: $diagnosaModel, diagnosaICD: $diagnosaICD, diagnosaSecondary: $diagnosaSecondary, diagnosa: $diagnosa, enableDelete: $enableDelete, enableAdd: $enableAdd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputDiagnosaStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdd, isAdd) || other.isAdd == isAdd) &&
            (identical(other.isGet, isGet) || other.isGet == isGet) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.isSave, isSave) || other.isSave == isSave) &&
            (identical(other.isErrorSaveData, isErrorSaveData) ||
                other.isErrorSaveData == isErrorSaveData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.diagnosaModel, diagnosaModel) ||
                other.diagnosaModel == diagnosaModel) &&
            const DeepCollectionEquality()
                .equals(other._diagnosaICD, _diagnosaICD) &&
            const DeepCollectionEquality()
                .equals(other._diagnosaSecondary, _diagnosaSecondary) &&
            const DeepCollectionEquality().equals(other._diagnosa, _diagnosa) &&
            (identical(other.enableDelete, enableDelete) ||
                other.enableDelete == enableDelete) &&
            (identical(other.enableAdd, enableAdd) ||
                other.enableAdd == enableAdd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isAdd,
      isGet,
      isDelete,
      isSave,
      isErrorSaveData,
      errorMessage,
      diagnosaModel,
      const DeepCollectionEquality().hash(_diagnosaICD),
      const DeepCollectionEquality().hash(_diagnosaSecondary),
      const DeepCollectionEquality().hash(_diagnosa),
      enableDelete,
      enableAdd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputDiagnosaStateImplCopyWith<_$InputDiagnosaStateImpl> get copyWith =>
      __$$InputDiagnosaStateImplCopyWithImpl<_$InputDiagnosaStateImpl>(
          this, _$identity);
}

abstract class _InputDiagnosaState implements InputDiagnosaState {
  factory _InputDiagnosaState(
      {final bool isLoading,
      final bool isAdd,
      final bool isGet,
      final bool isDelete,
      final bool isSave,
      final bool isErrorSaveData,
      final String errorMessage,
      final DiagnosaModel? diagnosaModel,
      final List<DiagnosaIcdModel> diagnosaICD,
      final List<DiagnosaIcdModel> diagnosaSecondary,
      final List<DiagnosaModel> diagnosa,
      final int enableDelete,
      final int enableAdd}) = _$InputDiagnosaStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isAdd;
  @override
  bool get isGet;
  @override
  bool get isDelete;
  @override
  bool get isSave;
  @override
  bool get isErrorSaveData;
  @override
  String get errorMessage;
  @override
  DiagnosaModel? get diagnosaModel;
  @override
  List<DiagnosaIcdModel> get diagnosaICD;
  @override
  List<DiagnosaIcdModel> get diagnosaSecondary;
  @override
  List<DiagnosaModel> get diagnosa;
  @override
  int get enableDelete;
  @override
  int get enableAdd;
  @override
  @JsonKey(ignore: true)
  _$$InputDiagnosaStateImplCopyWith<_$InputDiagnosaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
