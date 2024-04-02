// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String content) changeContent,
    required TResult Function(Menu menu) changeMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String content)? changeContent,
    TResult? Function(Menu menu)? changeMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String content)? changeContent,
    TResult Function(Menu menu)? changeMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeContent value) changeContent,
    required TResult Function(_ChangeMenu value) changeMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeContent value)? changeContent,
    TResult? Function(_ChangeMenu value)? changeMenu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeContent value)? changeContent,
    TResult Function(_ChangeMenu value)? changeMenu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentManagerEventCopyWith<$Res> {
  factory $ContentManagerEventCopyWith(
          ContentManagerEvent value, $Res Function(ContentManagerEvent) then) =
      _$ContentManagerEventCopyWithImpl<$Res, ContentManagerEvent>;
}

/// @nodoc
class _$ContentManagerEventCopyWithImpl<$Res, $Val extends ContentManagerEvent>
    implements $ContentManagerEventCopyWith<$Res> {
  _$ContentManagerEventCopyWithImpl(this._value, this._then);

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
    extends _$ContentManagerEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'ContentManagerEvent.started()';
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
    required TResult Function(String content) changeContent,
    required TResult Function(Menu menu) changeMenu,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String content)? changeContent,
    TResult? Function(Menu menu)? changeMenu,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String content)? changeContent,
    TResult Function(Menu menu)? changeMenu,
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
    required TResult Function(_ChangeContent value) changeContent,
    required TResult Function(_ChangeMenu value) changeMenu,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeContent value)? changeContent,
    TResult? Function(_ChangeMenu value)? changeMenu,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeContent value)? changeContent,
    TResult Function(_ChangeMenu value)? changeMenu,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ContentManagerEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ChangeContentImplCopyWith<$Res> {
  factory _$$ChangeContentImplCopyWith(
          _$ChangeContentImpl value, $Res Function(_$ChangeContentImpl) then) =
      __$$ChangeContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$ChangeContentImplCopyWithImpl<$Res>
    extends _$ContentManagerEventCopyWithImpl<$Res, _$ChangeContentImpl>
    implements _$$ChangeContentImplCopyWith<$Res> {
  __$$ChangeContentImplCopyWithImpl(
      _$ChangeContentImpl _value, $Res Function(_$ChangeContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$ChangeContentImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeContentImpl implements _ChangeContent {
  const _$ChangeContentImpl({required this.content});

  @override
  final String content;

  @override
  String toString() {
    return 'ContentManagerEvent.changeContent(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeContentImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeContentImplCopyWith<_$ChangeContentImpl> get copyWith =>
      __$$ChangeContentImplCopyWithImpl<_$ChangeContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String content) changeContent,
    required TResult Function(Menu menu) changeMenu,
  }) {
    return changeContent(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String content)? changeContent,
    TResult? Function(Menu menu)? changeMenu,
  }) {
    return changeContent?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String content)? changeContent,
    TResult Function(Menu menu)? changeMenu,
    required TResult orElse(),
  }) {
    if (changeContent != null) {
      return changeContent(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeContent value) changeContent,
    required TResult Function(_ChangeMenu value) changeMenu,
  }) {
    return changeContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeContent value)? changeContent,
    TResult? Function(_ChangeMenu value)? changeMenu,
  }) {
    return changeContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeContent value)? changeContent,
    TResult Function(_ChangeMenu value)? changeMenu,
    required TResult orElse(),
  }) {
    if (changeContent != null) {
      return changeContent(this);
    }
    return orElse();
  }
}

abstract class _ChangeContent implements ContentManagerEvent {
  const factory _ChangeContent({required final String content}) =
      _$ChangeContentImpl;

  String get content;
  @JsonKey(ignore: true)
  _$$ChangeContentImplCopyWith<_$ChangeContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeMenuImplCopyWith<$Res> {
  factory _$$ChangeMenuImplCopyWith(
          _$ChangeMenuImpl value, $Res Function(_$ChangeMenuImpl) then) =
      __$$ChangeMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Menu menu});
}

/// @nodoc
class __$$ChangeMenuImplCopyWithImpl<$Res>
    extends _$ContentManagerEventCopyWithImpl<$Res, _$ChangeMenuImpl>
    implements _$$ChangeMenuImplCopyWith<$Res> {
  __$$ChangeMenuImplCopyWithImpl(
      _$ChangeMenuImpl _value, $Res Function(_$ChangeMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
  }) {
    return _then(_$ChangeMenuImpl(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
    ));
  }
}

/// @nodoc

class _$ChangeMenuImpl implements _ChangeMenu {
  const _$ChangeMenuImpl({required this.menu});

  @override
  final Menu menu;

  @override
  String toString() {
    return 'ContentManagerEvent.changeMenu(menu: $menu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeMenuImpl &&
            (identical(other.menu, menu) || other.menu == menu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeMenuImplCopyWith<_$ChangeMenuImpl> get copyWith =>
      __$$ChangeMenuImplCopyWithImpl<_$ChangeMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String content) changeContent,
    required TResult Function(Menu menu) changeMenu,
  }) {
    return changeMenu(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String content)? changeContent,
    TResult? Function(Menu menu)? changeMenu,
  }) {
    return changeMenu?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String content)? changeContent,
    TResult Function(Menu menu)? changeMenu,
    required TResult orElse(),
  }) {
    if (changeMenu != null) {
      return changeMenu(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeContent value) changeContent,
    required TResult Function(_ChangeMenu value) changeMenu,
  }) {
    return changeMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ChangeContent value)? changeContent,
    TResult? Function(_ChangeMenu value)? changeMenu,
  }) {
    return changeMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeContent value)? changeContent,
    TResult Function(_ChangeMenu value)? changeMenu,
    required TResult orElse(),
  }) {
    if (changeMenu != null) {
      return changeMenu(this);
    }
    return orElse();
  }
}

abstract class _ChangeMenu implements ContentManagerEvent {
  const factory _ChangeMenu({required final Menu menu}) = _$ChangeMenuImpl;

  Menu get menu;
  @JsonKey(ignore: true)
  _$$ChangeMenuImplCopyWith<_$ChangeMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContentManagerState {
  Menu get menu => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentManagerStateCopyWith<ContentManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentManagerStateCopyWith<$Res> {
  factory $ContentManagerStateCopyWith(
          ContentManagerState value, $Res Function(ContentManagerState) then) =
      _$ContentManagerStateCopyWithImpl<$Res, ContentManagerState>;
  @useResult
  $Res call({Menu menu, String content});
}

/// @nodoc
class _$ContentManagerStateCopyWithImpl<$Res, $Val extends ContentManagerState>
    implements $ContentManagerStateCopyWith<$Res> {
  _$ContentManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentManagerStateImplCopyWith<$Res>
    implements $ContentManagerStateCopyWith<$Res> {
  factory _$$ContentManagerStateImplCopyWith(_$ContentManagerStateImpl value,
          $Res Function(_$ContentManagerStateImpl) then) =
      __$$ContentManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Menu menu, String content});
}

/// @nodoc
class __$$ContentManagerStateImplCopyWithImpl<$Res>
    extends _$ContentManagerStateCopyWithImpl<$Res, _$ContentManagerStateImpl>
    implements _$$ContentManagerStateImplCopyWith<$Res> {
  __$$ContentManagerStateImplCopyWithImpl(_$ContentManagerStateImpl _value,
      $Res Function(_$ContentManagerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? content = null,
  }) {
    return _then(_$ContentManagerStateImpl(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentManagerStateImpl implements _ContentManagerState {
  const _$ContentManagerStateImpl({required this.menu, required this.content});

  @override
  final Menu menu;
  @override
  final String content;

  @override
  String toString() {
    return 'ContentManagerState(menu: $menu, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentManagerStateImpl &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentManagerStateImplCopyWith<_$ContentManagerStateImpl> get copyWith =>
      __$$ContentManagerStateImplCopyWithImpl<_$ContentManagerStateImpl>(
          this, _$identity);
}

abstract class _ContentManagerState implements ContentManagerState {
  const factory _ContentManagerState(
      {required final Menu menu,
      required final String content}) = _$ContentManagerStateImpl;

  @override
  Menu get menu;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ContentManagerStateImplCopyWith<_$ContentManagerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
