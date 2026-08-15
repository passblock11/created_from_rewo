// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ItemImpl extends _Item {
  const _$ItemImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, createdAt);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);
}

abstract class _Item extends Item {
  const factory _Item(
          {required final String id,
          required final String title,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ItemImpl;
  const _Item._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateItemInput {
  String get title => throw _privateConstructorUsedError;

  /// Create a copy of CreateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateItemInputCopyWith<CreateItemInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateItemInputCopyWith<$Res> {
  factory $CreateItemInputCopyWith(
          CreateItemInput value, $Res Function(CreateItemInput) then) =
      _$CreateItemInputCopyWithImpl<$Res, CreateItemInput>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$CreateItemInputCopyWithImpl<$Res, $Val extends CreateItemInput>
    implements $CreateItemInputCopyWith<$Res> {
  _$CreateItemInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateItemInputImplCopyWith<$Res>
    implements $CreateItemInputCopyWith<$Res> {
  factory _$$CreateItemInputImplCopyWith(_$CreateItemInputImpl value,
          $Res Function(_$CreateItemInputImpl) then) =
      __$$CreateItemInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$CreateItemInputImplCopyWithImpl<$Res>
    extends _$CreateItemInputCopyWithImpl<$Res, _$CreateItemInputImpl>
    implements _$$CreateItemInputImplCopyWith<$Res> {
  __$$CreateItemInputImplCopyWithImpl(
      _$CreateItemInputImpl _value, $Res Function(_$CreateItemInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$CreateItemInputImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateItemInputImpl extends _CreateItemInput {
  const _$CreateItemInputImpl({required this.title}) : super._();

  @override
  final String title;

  @override
  String toString() {
    return 'CreateItemInput(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateItemInputImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of CreateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateItemInputImplCopyWith<_$CreateItemInputImpl> get copyWith =>
      __$$CreateItemInputImplCopyWithImpl<_$CreateItemInputImpl>(
          this, _$identity);
}

abstract class _CreateItemInput extends CreateItemInput {
  const factory _CreateItemInput({required final String title}) =
      _$CreateItemInputImpl;
  const _CreateItemInput._() : super._();

  @override
  String get title;

  /// Create a copy of CreateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateItemInputImplCopyWith<_$CreateItemInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateItemInput {
  String? get title => throw _privateConstructorUsedError;

  /// Create a copy of UpdateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateItemInputCopyWith<UpdateItemInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateItemInputCopyWith<$Res> {
  factory $UpdateItemInputCopyWith(
          UpdateItemInput value, $Res Function(UpdateItemInput) then) =
      _$UpdateItemInputCopyWithImpl<$Res, UpdateItemInput>;
  @useResult
  $Res call({String? title});
}

/// @nodoc
class _$UpdateItemInputCopyWithImpl<$Res, $Val extends UpdateItemInput>
    implements $UpdateItemInputCopyWith<$Res> {
  _$UpdateItemInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateItemInputImplCopyWith<$Res>
    implements $UpdateItemInputCopyWith<$Res> {
  factory _$$UpdateItemInputImplCopyWith(_$UpdateItemInputImpl value,
          $Res Function(_$UpdateItemInputImpl) then) =
      __$$UpdateItemInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title});
}

/// @nodoc
class __$$UpdateItemInputImplCopyWithImpl<$Res>
    extends _$UpdateItemInputCopyWithImpl<$Res, _$UpdateItemInputImpl>
    implements _$$UpdateItemInputImplCopyWith<$Res> {
  __$$UpdateItemInputImplCopyWithImpl(
      _$UpdateItemInputImpl _value, $Res Function(_$UpdateItemInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_$UpdateItemInputImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateItemInputImpl extends _UpdateItemInput {
  const _$UpdateItemInputImpl({this.title}) : super._();

  @override
  final String? title;

  @override
  String toString() {
    return 'UpdateItemInput(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemInputImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of UpdateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemInputImplCopyWith<_$UpdateItemInputImpl> get copyWith =>
      __$$UpdateItemInputImplCopyWithImpl<_$UpdateItemInputImpl>(
          this, _$identity);
}

abstract class _UpdateItemInput extends UpdateItemInput {
  const factory _UpdateItemInput({final String? title}) = _$UpdateItemInputImpl;
  const _UpdateItemInput._() : super._();

  @override
  String? get title;

  /// Create a copy of UpdateItemInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemInputImplCopyWith<_$UpdateItemInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemWhereUniqueInput {
  String? get id => throw _privateConstructorUsedError;

  /// Create a copy of ItemWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemWhereUniqueInputCopyWith<ItemWhereUniqueInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemWhereUniqueInputCopyWith<$Res> {
  factory $ItemWhereUniqueInputCopyWith(ItemWhereUniqueInput value,
          $Res Function(ItemWhereUniqueInput) then) =
      _$ItemWhereUniqueInputCopyWithImpl<$Res, ItemWhereUniqueInput>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$ItemWhereUniqueInputCopyWithImpl<$Res,
        $Val extends ItemWhereUniqueInput>
    implements $ItemWhereUniqueInputCopyWith<$Res> {
  _$ItemWhereUniqueInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemWhereUniqueInputImplCopyWith<$Res>
    implements $ItemWhereUniqueInputCopyWith<$Res> {
  factory _$$ItemWhereUniqueInputImplCopyWith(_$ItemWhereUniqueInputImpl value,
          $Res Function(_$ItemWhereUniqueInputImpl) then) =
      __$$ItemWhereUniqueInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$ItemWhereUniqueInputImplCopyWithImpl<$Res>
    extends _$ItemWhereUniqueInputCopyWithImpl<$Res, _$ItemWhereUniqueInputImpl>
    implements _$$ItemWhereUniqueInputImplCopyWith<$Res> {
  __$$ItemWhereUniqueInputImplCopyWithImpl(_$ItemWhereUniqueInputImpl _value,
      $Res Function(_$ItemWhereUniqueInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ItemWhereUniqueInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ItemWhereUniqueInputImpl extends _ItemWhereUniqueInput {
  const _$ItemWhereUniqueInputImpl({this.id}) : super._();

  @override
  final String? id;

  @override
  String toString() {
    return 'ItemWhereUniqueInput(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemWhereUniqueInputImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ItemWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemWhereUniqueInputImplCopyWith<_$ItemWhereUniqueInputImpl>
      get copyWith =>
          __$$ItemWhereUniqueInputImplCopyWithImpl<_$ItemWhereUniqueInputImpl>(
              this, _$identity);
}

abstract class _ItemWhereUniqueInput extends ItemWhereUniqueInput {
  const factory _ItemWhereUniqueInput({final String? id}) =
      _$ItemWhereUniqueInputImpl;
  const _ItemWhereUniqueInput._() : super._();

  @override
  String? get id;

  /// Create a copy of ItemWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemWhereUniqueInputImplCopyWith<_$ItemWhereUniqueInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemWhereInput {
  StringFilter? get id => throw _privateConstructorUsedError;
  StringFilter? get title => throw _privateConstructorUsedError;
  DateTimeFilter? get createdAt => throw _privateConstructorUsedError;
  List<ItemWhereInput>? get AND => throw _privateConstructorUsedError;
  List<ItemWhereInput>? get OR => throw _privateConstructorUsedError;
  ItemWhereInput? get NOT => throw _privateConstructorUsedError;

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemWhereInputCopyWith<ItemWhereInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemWhereInputCopyWith<$Res> {
  factory $ItemWhereInputCopyWith(
          ItemWhereInput value, $Res Function(ItemWhereInput) then) =
      _$ItemWhereInputCopyWithImpl<$Res, ItemWhereInput>;
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? title,
      DateTimeFilter? createdAt,
      List<ItemWhereInput>? AND,
      List<ItemWhereInput>? OR,
      ItemWhereInput? NOT});

  $StringFilterCopyWith<$Res>? get id;
  $StringFilterCopyWith<$Res>? get title;
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  $ItemWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class _$ItemWhereInputCopyWithImpl<$Res, $Val extends ItemWhereInput>
    implements $ItemWhereInputCopyWith<$Res> {
  _$ItemWhereInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? AND = freezed,
    Object? OR = freezed,
    Object? NOT = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      AND: freezed == AND
          ? _value.AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<ItemWhereInput>?,
      OR: freezed == OR
          ? _value.OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<ItemWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ) as $Val);
  }

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateTimeFilterCopyWith<$Res>? get createdAt {
    if (_value.createdAt == null) {
      return null;
    }

    return $DateTimeFilterCopyWith<$Res>(_value.createdAt!, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get NOT {
    if (_value.NOT == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.NOT!, (value) {
      return _then(_value.copyWith(NOT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemWhereInputImplCopyWith<$Res>
    implements $ItemWhereInputCopyWith<$Res> {
  factory _$$ItemWhereInputImplCopyWith(_$ItemWhereInputImpl value,
          $Res Function(_$ItemWhereInputImpl) then) =
      __$$ItemWhereInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? title,
      DateTimeFilter? createdAt,
      List<ItemWhereInput>? AND,
      List<ItemWhereInput>? OR,
      ItemWhereInput? NOT});

  @override
  $StringFilterCopyWith<$Res>? get id;
  @override
  $StringFilterCopyWith<$Res>? get title;
  @override
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  @override
  $ItemWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class __$$ItemWhereInputImplCopyWithImpl<$Res>
    extends _$ItemWhereInputCopyWithImpl<$Res, _$ItemWhereInputImpl>
    implements _$$ItemWhereInputImplCopyWith<$Res> {
  __$$ItemWhereInputImplCopyWithImpl(
      _$ItemWhereInputImpl _value, $Res Function(_$ItemWhereInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? AND = freezed,
    Object? OR = freezed,
    Object? NOT = freezed,
  }) {
    return _then(_$ItemWhereInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      AND: freezed == AND
          ? _value._AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<ItemWhereInput>?,
      OR: freezed == OR
          ? _value._OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<ItemWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ));
  }
}

/// @nodoc

class _$ItemWhereInputImpl extends _ItemWhereInput {
  const _$ItemWhereInputImpl(
      {this.id,
      this.title,
      this.createdAt,
      final List<ItemWhereInput>? AND,
      final List<ItemWhereInput>? OR,
      this.NOT})
      : _AND = AND,
        _OR = OR,
        super._();

  @override
  final StringFilter? id;
  @override
  final StringFilter? title;
  @override
  final DateTimeFilter? createdAt;
  final List<ItemWhereInput>? _AND;
  @override
  List<ItemWhereInput>? get AND {
    final value = _AND;
    if (value == null) return null;
    if (_AND is EqualUnmodifiableListView) return _AND;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ItemWhereInput>? _OR;
  @override
  List<ItemWhereInput>? get OR {
    final value = _OR;
    if (value == null) return null;
    if (_OR is EqualUnmodifiableListView) return _OR;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ItemWhereInput? NOT;

  @override
  String toString() {
    return 'ItemWhereInput(id: $id, title: $title, createdAt: $createdAt, AND: $AND, OR: $OR, NOT: $NOT)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemWhereInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._AND, _AND) &&
            const DeepCollectionEquality().equals(other._OR, _OR) &&
            (identical(other.NOT, NOT) || other.NOT == NOT));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      createdAt,
      const DeepCollectionEquality().hash(_AND),
      const DeepCollectionEquality().hash(_OR),
      NOT);

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemWhereInputImplCopyWith<_$ItemWhereInputImpl> get copyWith =>
      __$$ItemWhereInputImplCopyWithImpl<_$ItemWhereInputImpl>(
          this, _$identity);
}

abstract class _ItemWhereInput extends ItemWhereInput {
  const factory _ItemWhereInput(
      {final StringFilter? id,
      final StringFilter? title,
      final DateTimeFilter? createdAt,
      final List<ItemWhereInput>? AND,
      final List<ItemWhereInput>? OR,
      final ItemWhereInput? NOT}) = _$ItemWhereInputImpl;
  const _ItemWhereInput._() : super._();

  @override
  StringFilter? get id;
  @override
  StringFilter? get title;
  @override
  DateTimeFilter? get createdAt;
  @override
  List<ItemWhereInput>? get AND;
  @override
  List<ItemWhereInput>? get OR;
  @override
  ItemWhereInput? get NOT;

  /// Create a copy of ItemWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemWhereInputImplCopyWith<_$ItemWhereInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemListRelationFilter {
  ItemWhereInput? get some => throw _privateConstructorUsedError;
  ItemWhereInput? get every => throw _privateConstructorUsedError;
  ItemWhereInput? get none => throw _privateConstructorUsedError;

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemListRelationFilterCopyWith<ItemListRelationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListRelationFilterCopyWith<$Res> {
  factory $ItemListRelationFilterCopyWith(ItemListRelationFilter value,
          $Res Function(ItemListRelationFilter) then) =
      _$ItemListRelationFilterCopyWithImpl<$Res, ItemListRelationFilter>;
  @useResult
  $Res call(
      {ItemWhereInput? some, ItemWhereInput? every, ItemWhereInput? none});

  $ItemWhereInputCopyWith<$Res>? get some;
  $ItemWhereInputCopyWith<$Res>? get every;
  $ItemWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class _$ItemListRelationFilterCopyWithImpl<$Res,
        $Val extends ItemListRelationFilter>
    implements $ItemListRelationFilterCopyWith<$Res> {
  _$ItemListRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? some = freezed,
    Object? every = freezed,
    Object? none = freezed,
  }) {
    return _then(_value.copyWith(
      some: freezed == some
          ? _value.some
          : some // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ) as $Val);
  }

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get some {
    if (_value.some == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.some!, (value) {
      return _then(_value.copyWith(some: value) as $Val);
    });
  }

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get every {
    if (_value.every == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.every!, (value) {
      return _then(_value.copyWith(every: value) as $Val);
    });
  }

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get none {
    if (_value.none == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.none!, (value) {
      return _then(_value.copyWith(none: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemListRelationFilterImplCopyWith<$Res>
    implements $ItemListRelationFilterCopyWith<$Res> {
  factory _$$ItemListRelationFilterImplCopyWith(
          _$ItemListRelationFilterImpl value,
          $Res Function(_$ItemListRelationFilterImpl) then) =
      __$$ItemListRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ItemWhereInput? some, ItemWhereInput? every, ItemWhereInput? none});

  @override
  $ItemWhereInputCopyWith<$Res>? get some;
  @override
  $ItemWhereInputCopyWith<$Res>? get every;
  @override
  $ItemWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class __$$ItemListRelationFilterImplCopyWithImpl<$Res>
    extends _$ItemListRelationFilterCopyWithImpl<$Res,
        _$ItemListRelationFilterImpl>
    implements _$$ItemListRelationFilterImplCopyWith<$Res> {
  __$$ItemListRelationFilterImplCopyWithImpl(
      _$ItemListRelationFilterImpl _value,
      $Res Function(_$ItemListRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? some = freezed,
    Object? every = freezed,
    Object? none = freezed,
  }) {
    return _then(_$ItemListRelationFilterImpl(
      some: freezed == some
          ? _value.some
          : some // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ));
  }
}

/// @nodoc

class _$ItemListRelationFilterImpl extends _ItemListRelationFilter {
  const _$ItemListRelationFilterImpl({this.some, this.every, this.none})
      : super._();

  @override
  final ItemWhereInput? some;
  @override
  final ItemWhereInput? every;
  @override
  final ItemWhereInput? none;

  @override
  String toString() {
    return 'ItemListRelationFilter(some: $some, every: $every, none: $none)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemListRelationFilterImpl &&
            (identical(other.some, some) || other.some == some) &&
            (identical(other.every, every) || other.every == every) &&
            (identical(other.none, none) || other.none == none));
  }

  @override
  int get hashCode => Object.hash(runtimeType, some, every, none);

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListRelationFilterImplCopyWith<_$ItemListRelationFilterImpl>
      get copyWith => __$$ItemListRelationFilterImplCopyWithImpl<
          _$ItemListRelationFilterImpl>(this, _$identity);
}

abstract class _ItemListRelationFilter extends ItemListRelationFilter {
  const factory _ItemListRelationFilter(
      {final ItemWhereInput? some,
      final ItemWhereInput? every,
      final ItemWhereInput? none}) = _$ItemListRelationFilterImpl;
  const _ItemListRelationFilter._() : super._();

  @override
  ItemWhereInput? get some;
  @override
  ItemWhereInput? get every;
  @override
  ItemWhereInput? get none;

  /// Create a copy of ItemListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemListRelationFilterImplCopyWith<_$ItemListRelationFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemRelationFilter {
  @JsonKey(name: 'is')
  ItemWhereInput? get is_ => throw _privateConstructorUsedError;
  ItemWhereInput? get isNot => throw _privateConstructorUsedError;

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemRelationFilterCopyWith<ItemRelationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemRelationFilterCopyWith<$Res> {
  factory $ItemRelationFilterCopyWith(
          ItemRelationFilter value, $Res Function(ItemRelationFilter) then) =
      _$ItemRelationFilterCopyWithImpl<$Res, ItemRelationFilter>;
  @useResult
  $Res call({@JsonKey(name: 'is') ItemWhereInput? is_, ItemWhereInput? isNot});

  $ItemWhereInputCopyWith<$Res>? get is_;
  $ItemWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class _$ItemRelationFilterCopyWithImpl<$Res, $Val extends ItemRelationFilter>
    implements $ItemRelationFilterCopyWith<$Res> {
  _$ItemRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_ = freezed,
    Object? isNot = freezed,
  }) {
    return _then(_value.copyWith(
      is_: freezed == is_
          ? _value.is_
          : is_ // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ) as $Val);
  }

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get is_ {
    if (_value.is_ == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.is_!, (value) {
      return _then(_value.copyWith(is_: value) as $Val);
    });
  }

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemWhereInputCopyWith<$Res>? get isNot {
    if (_value.isNot == null) {
      return null;
    }

    return $ItemWhereInputCopyWith<$Res>(_value.isNot!, (value) {
      return _then(_value.copyWith(isNot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemRelationFilterImplCopyWith<$Res>
    implements $ItemRelationFilterCopyWith<$Res> {
  factory _$$ItemRelationFilterImplCopyWith(_$ItemRelationFilterImpl value,
          $Res Function(_$ItemRelationFilterImpl) then) =
      __$$ItemRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'is') ItemWhereInput? is_, ItemWhereInput? isNot});

  @override
  $ItemWhereInputCopyWith<$Res>? get is_;
  @override
  $ItemWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class __$$ItemRelationFilterImplCopyWithImpl<$Res>
    extends _$ItemRelationFilterCopyWithImpl<$Res, _$ItemRelationFilterImpl>
    implements _$$ItemRelationFilterImplCopyWith<$Res> {
  __$$ItemRelationFilterImplCopyWithImpl(_$ItemRelationFilterImpl _value,
      $Res Function(_$ItemRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_ = freezed,
    Object? isNot = freezed,
  }) {
    return _then(_$ItemRelationFilterImpl(
      is_: freezed == is_
          ? _value.is_
          : is_ // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as ItemWhereInput?,
    ));
  }
}

/// @nodoc

class _$ItemRelationFilterImpl extends _ItemRelationFilter {
  const _$ItemRelationFilterImpl({@JsonKey(name: 'is') this.is_, this.isNot})
      : super._();

  @override
  @JsonKey(name: 'is')
  final ItemWhereInput? is_;
  @override
  final ItemWhereInput? isNot;

  @override
  String toString() {
    return 'ItemRelationFilter(is_: $is_, isNot: $isNot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemRelationFilterImpl &&
            (identical(other.is_, is_) || other.is_ == is_) &&
            (identical(other.isNot, isNot) || other.isNot == isNot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, is_, isNot);

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemRelationFilterImplCopyWith<_$ItemRelationFilterImpl> get copyWith =>
      __$$ItemRelationFilterImplCopyWithImpl<_$ItemRelationFilterImpl>(
          this, _$identity);
}

abstract class _ItemRelationFilter extends ItemRelationFilter {
  const factory _ItemRelationFilter(
      {@JsonKey(name: 'is') final ItemWhereInput? is_,
      final ItemWhereInput? isNot}) = _$ItemRelationFilterImpl;
  const _ItemRelationFilter._() : super._();

  @override
  @JsonKey(name: 'is')
  ItemWhereInput? get is_;
  @override
  ItemWhereInput? get isNot;

  /// Create a copy of ItemRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemRelationFilterImplCopyWith<_$ItemRelationFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemOrderByInput {
  SortOrder? get id => throw _privateConstructorUsedError;
  SortOrder? get title => throw _privateConstructorUsedError;
  SortOrder? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ItemOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemOrderByInputCopyWith<ItemOrderByInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemOrderByInputCopyWith<$Res> {
  factory $ItemOrderByInputCopyWith(
          ItemOrderByInput value, $Res Function(ItemOrderByInput) then) =
      _$ItemOrderByInputCopyWithImpl<$Res, ItemOrderByInput>;
  @useResult
  $Res call({SortOrder? id, SortOrder? title, SortOrder? createdAt});
}

/// @nodoc
class _$ItemOrderByInputCopyWithImpl<$Res, $Val extends ItemOrderByInput>
    implements $ItemOrderByInputCopyWith<$Res> {
  _$ItemOrderByInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemOrderByInputImplCopyWith<$Res>
    implements $ItemOrderByInputCopyWith<$Res> {
  factory _$$ItemOrderByInputImplCopyWith(_$ItemOrderByInputImpl value,
          $Res Function(_$ItemOrderByInputImpl) then) =
      __$$ItemOrderByInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SortOrder? id, SortOrder? title, SortOrder? createdAt});
}

/// @nodoc
class __$$ItemOrderByInputImplCopyWithImpl<$Res>
    extends _$ItemOrderByInputCopyWithImpl<$Res, _$ItemOrderByInputImpl>
    implements _$$ItemOrderByInputImplCopyWith<$Res> {
  __$$ItemOrderByInputImplCopyWithImpl(_$ItemOrderByInputImpl _value,
      $Res Function(_$ItemOrderByInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ItemOrderByInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ));
  }
}

/// @nodoc

class _$ItemOrderByInputImpl extends _ItemOrderByInput {
  const _$ItemOrderByInputImpl({this.id, this.title, this.createdAt})
      : super._();

  @override
  final SortOrder? id;
  @override
  final SortOrder? title;
  @override
  final SortOrder? createdAt;

  @override
  String toString() {
    return 'ItemOrderByInput(id: $id, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemOrderByInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, createdAt);

  /// Create a copy of ItemOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemOrderByInputImplCopyWith<_$ItemOrderByInputImpl> get copyWith =>
      __$$ItemOrderByInputImplCopyWithImpl<_$ItemOrderByInputImpl>(
          this, _$identity);
}

abstract class _ItemOrderByInput extends ItemOrderByInput {
  const factory _ItemOrderByInput(
      {final SortOrder? id,
      final SortOrder? title,
      final SortOrder? createdAt}) = _$ItemOrderByInputImpl;
  const _ItemOrderByInput._() : super._();

  @override
  SortOrder? get id;
  @override
  SortOrder? get title;
  @override
  SortOrder? get createdAt;

  /// Create a copy of ItemOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemOrderByInputImplCopyWith<_$ItemOrderByInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemInclude {
  List<ItemScalarField>? get select => throw _privateConstructorUsedError;

  /// Create a copy of ItemInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemIncludeCopyWith<ItemInclude> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemIncludeCopyWith<$Res> {
  factory $ItemIncludeCopyWith(
          ItemInclude value, $Res Function(ItemInclude) then) =
      _$ItemIncludeCopyWithImpl<$Res, ItemInclude>;
  @useResult
  $Res call({List<ItemScalarField>? select});
}

/// @nodoc
class _$ItemIncludeCopyWithImpl<$Res, $Val extends ItemInclude>
    implements $ItemIncludeCopyWith<$Res> {
  _$ItemIncludeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
  }) {
    return _then(_value.copyWith(
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as List<ItemScalarField>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemIncludeImplCopyWith<$Res>
    implements $ItemIncludeCopyWith<$Res> {
  factory _$$ItemIncludeImplCopyWith(
          _$ItemIncludeImpl value, $Res Function(_$ItemIncludeImpl) then) =
      __$$ItemIncludeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ItemScalarField>? select});
}

/// @nodoc
class __$$ItemIncludeImplCopyWithImpl<$Res>
    extends _$ItemIncludeCopyWithImpl<$Res, _$ItemIncludeImpl>
    implements _$$ItemIncludeImplCopyWith<$Res> {
  __$$ItemIncludeImplCopyWithImpl(
      _$ItemIncludeImpl _value, $Res Function(_$ItemIncludeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
  }) {
    return _then(_$ItemIncludeImpl(
      select: freezed == select
          ? _value._select
          : select // ignore: cast_nullable_to_non_nullable
              as List<ItemScalarField>?,
    ));
  }
}

/// @nodoc

class _$ItemIncludeImpl extends _ItemInclude {
  const _$ItemIncludeImpl({final List<ItemScalarField>? select})
      : _select = select,
        super._();

  final List<ItemScalarField>? _select;
  @override
  List<ItemScalarField>? get select {
    final value = _select;
    if (value == null) return null;
    if (_select is EqualUnmodifiableListView) return _select;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemInclude(select: $select)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemIncludeImpl &&
            const DeepCollectionEquality().equals(other._select, _select));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_select));

  /// Create a copy of ItemInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemIncludeImplCopyWith<_$ItemIncludeImpl> get copyWith =>
      __$$ItemIncludeImplCopyWithImpl<_$ItemIncludeImpl>(this, _$identity);
}

abstract class _ItemInclude extends ItemInclude {
  const factory _ItemInclude({final List<ItemScalarField>? select}) =
      _$ItemIncludeImpl;
  const _ItemInclude._() : super._();

  @override
  List<ItemScalarField>? get select;

  /// Create a copy of ItemInclude
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemIncludeImplCopyWith<_$ItemIncludeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
