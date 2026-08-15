// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_hash')
  String get passwordHash => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<RefreshToken>? get refreshTokens => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      @JsonKey(name: 'password_hash') String passwordHash,
      String? name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<RefreshToken>? refreshTokens});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? passwordHash = null,
    Object? name = freezed,
    Object? createdAt = null,
    Object? refreshTokens = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as List<RefreshToken>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      @JsonKey(name: 'password_hash') String passwordHash,
      String? name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<RefreshToken>? refreshTokens});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? passwordHash = null,
    Object? name = freezed,
    Object? createdAt = null,
    Object? refreshTokens = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refreshTokens: freezed == refreshTokens
          ? _value._refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as List<RefreshToken>?,
    ));
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      @JsonKey(name: 'password_hash') required this.passwordHash,
      this.name,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<RefreshToken>? refreshTokens})
      : _refreshTokens = refreshTokens,
        super._();

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey(name: 'password_hash')
  final String passwordHash;
  @override
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<RefreshToken>? _refreshTokens;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<RefreshToken>? get refreshTokens {
    final value = _refreshTokens;
    if (value == null) return null;
    if (_refreshTokens is EqualUnmodifiableListView) return _refreshTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, passwordHash: $passwordHash, name: $name, createdAt: $createdAt, refreshTokens: $refreshTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._refreshTokens, _refreshTokens));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email, passwordHash, name,
      createdAt, const DeepCollectionEquality().hash(_refreshTokens));

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String email,
      @JsonKey(name: 'password_hash') required final String passwordHash,
      final String? name,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<RefreshToken>? refreshTokens}) = _$UserImpl;
  const _User._() : super._();

  @override
  String get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'password_hash')
  String get passwordHash;
  @override
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<RefreshToken>? get refreshTokens;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateUserInput {
  String get email => throw _privateConstructorUsedError;
  String get passwordHash => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  UserRefreshTokensWriteInput? get refreshTokens =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserInputCopyWith<CreateUserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserInputCopyWith<$Res> {
  factory $CreateUserInputCopyWith(
          CreateUserInput value, $Res Function(CreateUserInput) then) =
      _$CreateUserInputCopyWithImpl<$Res, CreateUserInput>;
  @useResult
  $Res call(
      {String email,
      String passwordHash,
      String? name,
      UserRefreshTokensWriteInput? refreshTokens});

  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class _$CreateUserInputCopyWithImpl<$Res, $Val extends CreateUserInput>
    implements $CreateUserInputCopyWith<$Res> {
  _$CreateUserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? passwordHash = null,
    Object? name = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as UserRefreshTokensWriteInput?,
    ) as $Val);
  }

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens {
    if (_value.refreshTokens == null) {
      return null;
    }

    return $UserRefreshTokensWriteInputCopyWith<$Res>(_value.refreshTokens!,
        (value) {
      return _then(_value.copyWith(refreshTokens: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateUserInputImplCopyWith<$Res>
    implements $CreateUserInputCopyWith<$Res> {
  factory _$$CreateUserInputImplCopyWith(_$CreateUserInputImpl value,
          $Res Function(_$CreateUserInputImpl) then) =
      __$$CreateUserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String passwordHash,
      String? name,
      UserRefreshTokensWriteInput? refreshTokens});

  @override
  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class __$$CreateUserInputImplCopyWithImpl<$Res>
    extends _$CreateUserInputCopyWithImpl<$Res, _$CreateUserInputImpl>
    implements _$$CreateUserInputImplCopyWith<$Res> {
  __$$CreateUserInputImplCopyWithImpl(
      _$CreateUserInputImpl _value, $Res Function(_$CreateUserInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? passwordHash = null,
    Object? name = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_$CreateUserInputImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      passwordHash: null == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as UserRefreshTokensWriteInput?,
    ));
  }
}

/// @nodoc

class _$CreateUserInputImpl extends _CreateUserInput {
  const _$CreateUserInputImpl(
      {required this.email,
      required this.passwordHash,
      this.name,
      this.refreshTokens})
      : super._();

  @override
  final String email;
  @override
  final String passwordHash;
  @override
  final String? name;
  @override
  final UserRefreshTokensWriteInput? refreshTokens;

  @override
  String toString() {
    return 'CreateUserInput(email: $email, passwordHash: $passwordHash, name: $name, refreshTokens: $refreshTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserInputImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.refreshTokens, refreshTokens) ||
                other.refreshTokens == refreshTokens));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, passwordHash, name, refreshTokens);

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserInputImplCopyWith<_$CreateUserInputImpl> get copyWith =>
      __$$CreateUserInputImplCopyWithImpl<_$CreateUserInputImpl>(
          this, _$identity);
}

abstract class _CreateUserInput extends CreateUserInput {
  const factory _CreateUserInput(
          {required final String email,
          required final String passwordHash,
          final String? name,
          final UserRefreshTokensWriteInput? refreshTokens}) =
      _$CreateUserInputImpl;
  const _CreateUserInput._() : super._();

  @override
  String get email;
  @override
  String get passwordHash;
  @override
  String? get name;
  @override
  UserRefreshTokensWriteInput? get refreshTokens;

  /// Create a copy of CreateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserInputImplCopyWith<_$CreateUserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserInput {
  String? get email => throw _privateConstructorUsedError;
  String? get passwordHash => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  UserRefreshTokensWriteInput? get refreshTokens =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserInputCopyWith<UpdateUserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserInputCopyWith<$Res> {
  factory $UpdateUserInputCopyWith(
          UpdateUserInput value, $Res Function(UpdateUserInput) then) =
      _$UpdateUserInputCopyWithImpl<$Res, UpdateUserInput>;
  @useResult
  $Res call(
      {String? email,
      String? passwordHash,
      String? name,
      UserRefreshTokensWriteInput? refreshTokens});

  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class _$UpdateUserInputCopyWithImpl<$Res, $Val extends UpdateUserInput>
    implements $UpdateUserInputCopyWith<$Res> {
  _$UpdateUserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as UserRefreshTokensWriteInput?,
    ) as $Val);
  }

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens {
    if (_value.refreshTokens == null) {
      return null;
    }

    return $UserRefreshTokensWriteInputCopyWith<$Res>(_value.refreshTokens!,
        (value) {
      return _then(_value.copyWith(refreshTokens: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateUserInputImplCopyWith<$Res>
    implements $UpdateUserInputCopyWith<$Res> {
  factory _$$UpdateUserInputImplCopyWith(_$UpdateUserInputImpl value,
          $Res Function(_$UpdateUserInputImpl) then) =
      __$$UpdateUserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? passwordHash,
      String? name,
      UserRefreshTokensWriteInput? refreshTokens});

  @override
  $UserRefreshTokensWriteInputCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class __$$UpdateUserInputImplCopyWithImpl<$Res>
    extends _$UpdateUserInputCopyWithImpl<$Res, _$UpdateUserInputImpl>
    implements _$$UpdateUserInputImplCopyWith<$Res> {
  __$$UpdateUserInputImplCopyWithImpl(
      _$UpdateUserInputImpl _value, $Res Function(_$UpdateUserInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_$UpdateUserInputImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as UserRefreshTokensWriteInput?,
    ));
  }
}

/// @nodoc

class _$UpdateUserInputImpl extends _UpdateUserInput {
  const _$UpdateUserInputImpl(
      {this.email, this.passwordHash, this.name, this.refreshTokens})
      : super._();

  @override
  final String? email;
  @override
  final String? passwordHash;
  @override
  final String? name;
  @override
  final UserRefreshTokensWriteInput? refreshTokens;

  @override
  String toString() {
    return 'UpdateUserInput(email: $email, passwordHash: $passwordHash, name: $name, refreshTokens: $refreshTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserInputImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.refreshTokens, refreshTokens) ||
                other.refreshTokens == refreshTokens));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, passwordHash, name, refreshTokens);

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserInputImplCopyWith<_$UpdateUserInputImpl> get copyWith =>
      __$$UpdateUserInputImplCopyWithImpl<_$UpdateUserInputImpl>(
          this, _$identity);
}

abstract class _UpdateUserInput extends UpdateUserInput {
  const factory _UpdateUserInput(
          {final String? email,
          final String? passwordHash,
          final String? name,
          final UserRefreshTokensWriteInput? refreshTokens}) =
      _$UpdateUserInputImpl;
  const _UpdateUserInput._() : super._();

  @override
  String? get email;
  @override
  String? get passwordHash;
  @override
  String? get name;
  @override
  UserRefreshTokensWriteInput? get refreshTokens;

  /// Create a copy of UpdateUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserInputImplCopyWith<_$UpdateUserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserWhereUniqueInput {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Create a copy of UserWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWhereUniqueInputCopyWith<UserWhereUniqueInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWhereUniqueInputCopyWith<$Res> {
  factory $UserWhereUniqueInputCopyWith(UserWhereUniqueInput value,
          $Res Function(UserWhereUniqueInput) then) =
      _$UserWhereUniqueInputCopyWithImpl<$Res, UserWhereUniqueInput>;
  @useResult
  $Res call({String? id, String? email});
}

/// @nodoc
class _$UserWhereUniqueInputCopyWithImpl<$Res,
        $Val extends UserWhereUniqueInput>
    implements $UserWhereUniqueInputCopyWith<$Res> {
  _$UserWhereUniqueInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserWhereUniqueInputImplCopyWith<$Res>
    implements $UserWhereUniqueInputCopyWith<$Res> {
  factory _$$UserWhereUniqueInputImplCopyWith(_$UserWhereUniqueInputImpl value,
          $Res Function(_$UserWhereUniqueInputImpl) then) =
      __$$UserWhereUniqueInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? email});
}

/// @nodoc
class __$$UserWhereUniqueInputImplCopyWithImpl<$Res>
    extends _$UserWhereUniqueInputCopyWithImpl<$Res, _$UserWhereUniqueInputImpl>
    implements _$$UserWhereUniqueInputImplCopyWith<$Res> {
  __$$UserWhereUniqueInputImplCopyWithImpl(_$UserWhereUniqueInputImpl _value,
      $Res Function(_$UserWhereUniqueInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserWhereUniqueInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserWhereUniqueInputImpl extends _UserWhereUniqueInput {
  const _$UserWhereUniqueInputImpl({this.id, this.email}) : super._();

  @override
  final String? id;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserWhereUniqueInput(id: $id, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWhereUniqueInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email);

  /// Create a copy of UserWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWhereUniqueInputImplCopyWith<_$UserWhereUniqueInputImpl>
      get copyWith =>
          __$$UserWhereUniqueInputImplCopyWithImpl<_$UserWhereUniqueInputImpl>(
              this, _$identity);
}

abstract class _UserWhereUniqueInput extends UserWhereUniqueInput {
  const factory _UserWhereUniqueInput({final String? id, final String? email}) =
      _$UserWhereUniqueInputImpl;
  const _UserWhereUniqueInput._() : super._();

  @override
  String? get id;
  @override
  String? get email;

  /// Create a copy of UserWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWhereUniqueInputImplCopyWith<_$UserWhereUniqueInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserWhereInput {
  StringFilter? get id => throw _privateConstructorUsedError;
  StringFilter? get email => throw _privateConstructorUsedError;
  StringFilter? get passwordHash => throw _privateConstructorUsedError;
  StringFilter? get name => throw _privateConstructorUsedError;
  DateTimeFilter? get createdAt => throw _privateConstructorUsedError;
  RefreshTokenListRelationFilter? get refreshTokens =>
      throw _privateConstructorUsedError;
  List<UserWhereInput>? get AND => throw _privateConstructorUsedError;
  List<UserWhereInput>? get OR => throw _privateConstructorUsedError;
  UserWhereInput? get NOT => throw _privateConstructorUsedError;

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWhereInputCopyWith<UserWhereInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWhereInputCopyWith<$Res> {
  factory $UserWhereInputCopyWith(
          UserWhereInput value, $Res Function(UserWhereInput) then) =
      _$UserWhereInputCopyWithImpl<$Res, UserWhereInput>;
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? email,
      StringFilter? passwordHash,
      StringFilter? name,
      DateTimeFilter? createdAt,
      RefreshTokenListRelationFilter? refreshTokens,
      List<UserWhereInput>? AND,
      List<UserWhereInput>? OR,
      UserWhereInput? NOT});

  $StringFilterCopyWith<$Res>? get id;
  $StringFilterCopyWith<$Res>? get email;
  $StringFilterCopyWith<$Res>? get passwordHash;
  $StringFilterCopyWith<$Res>? get name;
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  $RefreshTokenListRelationFilterCopyWith<$Res>? get refreshTokens;
  $UserWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class _$UserWhereInputCopyWithImpl<$Res, $Val extends UserWhereInput>
    implements $UserWhereInputCopyWith<$Res> {
  _$UserWhereInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? refreshTokens = freezed,
    Object? AND = freezed,
    Object? OR = freezed,
    Object? NOT = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as RefreshTokenListRelationFilter?,
      AND: freezed == AND
          ? _value.AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<UserWhereInput>?,
      OR: freezed == OR
          ? _value.OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<UserWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ) as $Val);
  }

  /// Create a copy of UserWhereInput
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

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get email {
    if (_value.email == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.email!, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get passwordHash {
    if (_value.passwordHash == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.passwordHash!, (value) {
      return _then(_value.copyWith(passwordHash: value) as $Val);
    });
  }

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of UserWhereInput
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

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenListRelationFilterCopyWith<$Res>? get refreshTokens {
    if (_value.refreshTokens == null) {
      return null;
    }

    return $RefreshTokenListRelationFilterCopyWith<$Res>(_value.refreshTokens!,
        (value) {
      return _then(_value.copyWith(refreshTokens: value) as $Val);
    });
  }

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get NOT {
    if (_value.NOT == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.NOT!, (value) {
      return _then(_value.copyWith(NOT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWhereInputImplCopyWith<$Res>
    implements $UserWhereInputCopyWith<$Res> {
  factory _$$UserWhereInputImplCopyWith(_$UserWhereInputImpl value,
          $Res Function(_$UserWhereInputImpl) then) =
      __$$UserWhereInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? email,
      StringFilter? passwordHash,
      StringFilter? name,
      DateTimeFilter? createdAt,
      RefreshTokenListRelationFilter? refreshTokens,
      List<UserWhereInput>? AND,
      List<UserWhereInput>? OR,
      UserWhereInput? NOT});

  @override
  $StringFilterCopyWith<$Res>? get id;
  @override
  $StringFilterCopyWith<$Res>? get email;
  @override
  $StringFilterCopyWith<$Res>? get passwordHash;
  @override
  $StringFilterCopyWith<$Res>? get name;
  @override
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  @override
  $RefreshTokenListRelationFilterCopyWith<$Res>? get refreshTokens;
  @override
  $UserWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class __$$UserWhereInputImplCopyWithImpl<$Res>
    extends _$UserWhereInputCopyWithImpl<$Res, _$UserWhereInputImpl>
    implements _$$UserWhereInputImplCopyWith<$Res> {
  __$$UserWhereInputImplCopyWithImpl(
      _$UserWhereInputImpl _value, $Res Function(_$UserWhereInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? refreshTokens = freezed,
    Object? AND = freezed,
    Object? OR = freezed,
    Object? NOT = freezed,
  }) {
    return _then(_$UserWhereInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as RefreshTokenListRelationFilter?,
      AND: freezed == AND
          ? _value._AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<UserWhereInput>?,
      OR: freezed == OR
          ? _value._OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<UserWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ));
  }
}

/// @nodoc

class _$UserWhereInputImpl extends _UserWhereInput {
  const _$UserWhereInputImpl(
      {this.id,
      this.email,
      this.passwordHash,
      this.name,
      this.createdAt,
      this.refreshTokens,
      final List<UserWhereInput>? AND,
      final List<UserWhereInput>? OR,
      this.NOT})
      : _AND = AND,
        _OR = OR,
        super._();

  @override
  final StringFilter? id;
  @override
  final StringFilter? email;
  @override
  final StringFilter? passwordHash;
  @override
  final StringFilter? name;
  @override
  final DateTimeFilter? createdAt;
  @override
  final RefreshTokenListRelationFilter? refreshTokens;
  final List<UserWhereInput>? _AND;
  @override
  List<UserWhereInput>? get AND {
    final value = _AND;
    if (value == null) return null;
    if (_AND is EqualUnmodifiableListView) return _AND;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserWhereInput>? _OR;
  @override
  List<UserWhereInput>? get OR {
    final value = _OR;
    if (value == null) return null;
    if (_OR is EqualUnmodifiableListView) return _OR;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserWhereInput? NOT;

  @override
  String toString() {
    return 'UserWhereInput(id: $id, email: $email, passwordHash: $passwordHash, name: $name, createdAt: $createdAt, refreshTokens: $refreshTokens, AND: $AND, OR: $OR, NOT: $NOT)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWhereInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.refreshTokens, refreshTokens) ||
                other.refreshTokens == refreshTokens) &&
            const DeepCollectionEquality().equals(other._AND, _AND) &&
            const DeepCollectionEquality().equals(other._OR, _OR) &&
            (identical(other.NOT, NOT) || other.NOT == NOT));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      passwordHash,
      name,
      createdAt,
      refreshTokens,
      const DeepCollectionEquality().hash(_AND),
      const DeepCollectionEquality().hash(_OR),
      NOT);

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWhereInputImplCopyWith<_$UserWhereInputImpl> get copyWith =>
      __$$UserWhereInputImplCopyWithImpl<_$UserWhereInputImpl>(
          this, _$identity);
}

abstract class _UserWhereInput extends UserWhereInput {
  const factory _UserWhereInput(
      {final StringFilter? id,
      final StringFilter? email,
      final StringFilter? passwordHash,
      final StringFilter? name,
      final DateTimeFilter? createdAt,
      final RefreshTokenListRelationFilter? refreshTokens,
      final List<UserWhereInput>? AND,
      final List<UserWhereInput>? OR,
      final UserWhereInput? NOT}) = _$UserWhereInputImpl;
  const _UserWhereInput._() : super._();

  @override
  StringFilter? get id;
  @override
  StringFilter? get email;
  @override
  StringFilter? get passwordHash;
  @override
  StringFilter? get name;
  @override
  DateTimeFilter? get createdAt;
  @override
  RefreshTokenListRelationFilter? get refreshTokens;
  @override
  List<UserWhereInput>? get AND;
  @override
  List<UserWhereInput>? get OR;
  @override
  UserWhereInput? get NOT;

  /// Create a copy of UserWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWhereInputImplCopyWith<_$UserWhereInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserListRelationFilter {
  UserWhereInput? get some => throw _privateConstructorUsedError;
  UserWhereInput? get every => throw _privateConstructorUsedError;
  UserWhereInput? get none => throw _privateConstructorUsedError;

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserListRelationFilterCopyWith<UserListRelationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListRelationFilterCopyWith<$Res> {
  factory $UserListRelationFilterCopyWith(UserListRelationFilter value,
          $Res Function(UserListRelationFilter) then) =
      _$UserListRelationFilterCopyWithImpl<$Res, UserListRelationFilter>;
  @useResult
  $Res call(
      {UserWhereInput? some, UserWhereInput? every, UserWhereInput? none});

  $UserWhereInputCopyWith<$Res>? get some;
  $UserWhereInputCopyWith<$Res>? get every;
  $UserWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class _$UserListRelationFilterCopyWithImpl<$Res,
        $Val extends UserListRelationFilter>
    implements $UserListRelationFilterCopyWith<$Res> {
  _$UserListRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserListRelationFilter
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
              as UserWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ) as $Val);
  }

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get some {
    if (_value.some == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.some!, (value) {
      return _then(_value.copyWith(some: value) as $Val);
    });
  }

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get every {
    if (_value.every == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.every!, (value) {
      return _then(_value.copyWith(every: value) as $Val);
    });
  }

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get none {
    if (_value.none == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.none!, (value) {
      return _then(_value.copyWith(none: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserListRelationFilterImplCopyWith<$Res>
    implements $UserListRelationFilterCopyWith<$Res> {
  factory _$$UserListRelationFilterImplCopyWith(
          _$UserListRelationFilterImpl value,
          $Res Function(_$UserListRelationFilterImpl) then) =
      __$$UserListRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserWhereInput? some, UserWhereInput? every, UserWhereInput? none});

  @override
  $UserWhereInputCopyWith<$Res>? get some;
  @override
  $UserWhereInputCopyWith<$Res>? get every;
  @override
  $UserWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class __$$UserListRelationFilterImplCopyWithImpl<$Res>
    extends _$UserListRelationFilterCopyWithImpl<$Res,
        _$UserListRelationFilterImpl>
    implements _$$UserListRelationFilterImplCopyWith<$Res> {
  __$$UserListRelationFilterImplCopyWithImpl(
      _$UserListRelationFilterImpl _value,
      $Res Function(_$UserListRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? some = freezed,
    Object? every = freezed,
    Object? none = freezed,
  }) {
    return _then(_$UserListRelationFilterImpl(
      some: freezed == some
          ? _value.some
          : some // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ));
  }
}

/// @nodoc

class _$UserListRelationFilterImpl extends _UserListRelationFilter {
  const _$UserListRelationFilterImpl({this.some, this.every, this.none})
      : super._();

  @override
  final UserWhereInput? some;
  @override
  final UserWhereInput? every;
  @override
  final UserWhereInput? none;

  @override
  String toString() {
    return 'UserListRelationFilter(some: $some, every: $every, none: $none)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListRelationFilterImpl &&
            (identical(other.some, some) || other.some == some) &&
            (identical(other.every, every) || other.every == every) &&
            (identical(other.none, none) || other.none == none));
  }

  @override
  int get hashCode => Object.hash(runtimeType, some, every, none);

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListRelationFilterImplCopyWith<_$UserListRelationFilterImpl>
      get copyWith => __$$UserListRelationFilterImplCopyWithImpl<
          _$UserListRelationFilterImpl>(this, _$identity);
}

abstract class _UserListRelationFilter extends UserListRelationFilter {
  const factory _UserListRelationFilter(
      {final UserWhereInput? some,
      final UserWhereInput? every,
      final UserWhereInput? none}) = _$UserListRelationFilterImpl;
  const _UserListRelationFilter._() : super._();

  @override
  UserWhereInput? get some;
  @override
  UserWhereInput? get every;
  @override
  UserWhereInput? get none;

  /// Create a copy of UserListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserListRelationFilterImplCopyWith<_$UserListRelationFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserRelationFilter {
  @JsonKey(name: 'is')
  UserWhereInput? get is_ => throw _privateConstructorUsedError;
  UserWhereInput? get isNot => throw _privateConstructorUsedError;

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRelationFilterCopyWith<UserRelationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRelationFilterCopyWith<$Res> {
  factory $UserRelationFilterCopyWith(
          UserRelationFilter value, $Res Function(UserRelationFilter) then) =
      _$UserRelationFilterCopyWithImpl<$Res, UserRelationFilter>;
  @useResult
  $Res call({@JsonKey(name: 'is') UserWhereInput? is_, UserWhereInput? isNot});

  $UserWhereInputCopyWith<$Res>? get is_;
  $UserWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class _$UserRelationFilterCopyWithImpl<$Res, $Val extends UserRelationFilter>
    implements $UserRelationFilterCopyWith<$Res> {
  _$UserRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRelationFilter
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
              as UserWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ) as $Val);
  }

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get is_ {
    if (_value.is_ == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.is_!, (value) {
      return _then(_value.copyWith(is_: value) as $Val);
    });
  }

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereInputCopyWith<$Res>? get isNot {
    if (_value.isNot == null) {
      return null;
    }

    return $UserWhereInputCopyWith<$Res>(_value.isNot!, (value) {
      return _then(_value.copyWith(isNot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRelationFilterImplCopyWith<$Res>
    implements $UserRelationFilterCopyWith<$Res> {
  factory _$$UserRelationFilterImplCopyWith(_$UserRelationFilterImpl value,
          $Res Function(_$UserRelationFilterImpl) then) =
      __$$UserRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'is') UserWhereInput? is_, UserWhereInput? isNot});

  @override
  $UserWhereInputCopyWith<$Res>? get is_;
  @override
  $UserWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class __$$UserRelationFilterImplCopyWithImpl<$Res>
    extends _$UserRelationFilterCopyWithImpl<$Res, _$UserRelationFilterImpl>
    implements _$$UserRelationFilterImplCopyWith<$Res> {
  __$$UserRelationFilterImplCopyWithImpl(_$UserRelationFilterImpl _value,
      $Res Function(_$UserRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_ = freezed,
    Object? isNot = freezed,
  }) {
    return _then(_$UserRelationFilterImpl(
      is_: freezed == is_
          ? _value.is_
          : is_ // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as UserWhereInput?,
    ));
  }
}

/// @nodoc

class _$UserRelationFilterImpl extends _UserRelationFilter {
  const _$UserRelationFilterImpl({@JsonKey(name: 'is') this.is_, this.isNot})
      : super._();

  @override
  @JsonKey(name: 'is')
  final UserWhereInput? is_;
  @override
  final UserWhereInput? isNot;

  @override
  String toString() {
    return 'UserRelationFilter(is_: $is_, isNot: $isNot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRelationFilterImpl &&
            (identical(other.is_, is_) || other.is_ == is_) &&
            (identical(other.isNot, isNot) || other.isNot == isNot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, is_, isNot);

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRelationFilterImplCopyWith<_$UserRelationFilterImpl> get copyWith =>
      __$$UserRelationFilterImplCopyWithImpl<_$UserRelationFilterImpl>(
          this, _$identity);
}

abstract class _UserRelationFilter extends UserRelationFilter {
  const factory _UserRelationFilter(
      {@JsonKey(name: 'is') final UserWhereInput? is_,
      final UserWhereInput? isNot}) = _$UserRelationFilterImpl;
  const _UserRelationFilter._() : super._();

  @override
  @JsonKey(name: 'is')
  UserWhereInput? get is_;
  @override
  UserWhereInput? get isNot;

  /// Create a copy of UserRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRelationFilterImplCopyWith<_$UserRelationFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserOrderByInput {
  SortOrder? get id => throw _privateConstructorUsedError;
  SortOrder? get email => throw _privateConstructorUsedError;
  SortOrder? get passwordHash => throw _privateConstructorUsedError;
  SortOrder? get name => throw _privateConstructorUsedError;
  SortOrder? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of UserOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserOrderByInputCopyWith<UserOrderByInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOrderByInputCopyWith<$Res> {
  factory $UserOrderByInputCopyWith(
          UserOrderByInput value, $Res Function(UserOrderByInput) then) =
      _$UserOrderByInputCopyWithImpl<$Res, UserOrderByInput>;
  @useResult
  $Res call(
      {SortOrder? id,
      SortOrder? email,
      SortOrder? passwordHash,
      SortOrder? name,
      SortOrder? createdAt});
}

/// @nodoc
class _$UserOrderByInputCopyWithImpl<$Res, $Val extends UserOrderByInput>
    implements $UserOrderByInputCopyWith<$Res> {
  _$UserOrderByInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserOrderByInputImplCopyWith<$Res>
    implements $UserOrderByInputCopyWith<$Res> {
  factory _$$UserOrderByInputImplCopyWith(_$UserOrderByInputImpl value,
          $Res Function(_$UserOrderByInputImpl) then) =
      __$$UserOrderByInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SortOrder? id,
      SortOrder? email,
      SortOrder? passwordHash,
      SortOrder? name,
      SortOrder? createdAt});
}

/// @nodoc
class __$$UserOrderByInputImplCopyWithImpl<$Res>
    extends _$UserOrderByInputCopyWithImpl<$Res, _$UserOrderByInputImpl>
    implements _$$UserOrderByInputImplCopyWith<$Res> {
  __$$UserOrderByInputImplCopyWithImpl(_$UserOrderByInputImpl _value,
      $Res Function(_$UserOrderByInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? passwordHash = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserOrderByInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ));
  }
}

/// @nodoc

class _$UserOrderByInputImpl extends _UserOrderByInput {
  const _$UserOrderByInputImpl(
      {this.id, this.email, this.passwordHash, this.name, this.createdAt})
      : super._();

  @override
  final SortOrder? id;
  @override
  final SortOrder? email;
  @override
  final SortOrder? passwordHash;
  @override
  final SortOrder? name;
  @override
  final SortOrder? createdAt;

  @override
  String toString() {
    return 'UserOrderByInput(id: $id, email: $email, passwordHash: $passwordHash, name: $name, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserOrderByInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, passwordHash, name, createdAt);

  /// Create a copy of UserOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserOrderByInputImplCopyWith<_$UserOrderByInputImpl> get copyWith =>
      __$$UserOrderByInputImplCopyWithImpl<_$UserOrderByInputImpl>(
          this, _$identity);
}

abstract class _UserOrderByInput extends UserOrderByInput {
  const factory _UserOrderByInput(
      {final SortOrder? id,
      final SortOrder? email,
      final SortOrder? passwordHash,
      final SortOrder? name,
      final SortOrder? createdAt}) = _$UserOrderByInputImpl;
  const _UserOrderByInput._() : super._();

  @override
  SortOrder? get id;
  @override
  SortOrder? get email;
  @override
  SortOrder? get passwordHash;
  @override
  SortOrder? get name;
  @override
  SortOrder? get createdAt;

  /// Create a copy of UserOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserOrderByInputImplCopyWith<_$UserOrderByInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserInclude {
  List<UserScalarField>? get select => throw _privateConstructorUsedError;
  RefreshTokenInclude? get refreshTokens => throw _privateConstructorUsedError;

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserIncludeCopyWith<UserInclude> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIncludeCopyWith<$Res> {
  factory $UserIncludeCopyWith(
          UserInclude value, $Res Function(UserInclude) then) =
      _$UserIncludeCopyWithImpl<$Res, UserInclude>;
  @useResult
  $Res call(
      {List<UserScalarField>? select, RefreshTokenInclude? refreshTokens});

  $RefreshTokenIncludeCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class _$UserIncludeCopyWithImpl<$Res, $Val extends UserInclude>
    implements $UserIncludeCopyWith<$Res> {
  _$UserIncludeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_value.copyWith(
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as List<UserScalarField>?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as RefreshTokenInclude?,
    ) as $Val);
  }

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenIncludeCopyWith<$Res>? get refreshTokens {
    if (_value.refreshTokens == null) {
      return null;
    }

    return $RefreshTokenIncludeCopyWith<$Res>(_value.refreshTokens!, (value) {
      return _then(_value.copyWith(refreshTokens: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserIncludeImplCopyWith<$Res>
    implements $UserIncludeCopyWith<$Res> {
  factory _$$UserIncludeImplCopyWith(
          _$UserIncludeImpl value, $Res Function(_$UserIncludeImpl) then) =
      __$$UserIncludeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserScalarField>? select, RefreshTokenInclude? refreshTokens});

  @override
  $RefreshTokenIncludeCopyWith<$Res>? get refreshTokens;
}

/// @nodoc
class __$$UserIncludeImplCopyWithImpl<$Res>
    extends _$UserIncludeCopyWithImpl<$Res, _$UserIncludeImpl>
    implements _$$UserIncludeImplCopyWith<$Res> {
  __$$UserIncludeImplCopyWithImpl(
      _$UserIncludeImpl _value, $Res Function(_$UserIncludeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
    Object? refreshTokens = freezed,
  }) {
    return _then(_$UserIncludeImpl(
      select: freezed == select
          ? _value._select
          : select // ignore: cast_nullable_to_non_nullable
              as List<UserScalarField>?,
      refreshTokens: freezed == refreshTokens
          ? _value.refreshTokens
          : refreshTokens // ignore: cast_nullable_to_non_nullable
              as RefreshTokenInclude?,
    ));
  }
}

/// @nodoc

class _$UserIncludeImpl extends _UserInclude {
  const _$UserIncludeImpl(
      {final List<UserScalarField>? select, this.refreshTokens})
      : _select = select,
        super._();

  final List<UserScalarField>? _select;
  @override
  List<UserScalarField>? get select {
    final value = _select;
    if (value == null) return null;
    if (_select is EqualUnmodifiableListView) return _select;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RefreshTokenInclude? refreshTokens;

  @override
  String toString() {
    return 'UserInclude(select: $select, refreshTokens: $refreshTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserIncludeImpl &&
            const DeepCollectionEquality().equals(other._select, _select) &&
            (identical(other.refreshTokens, refreshTokens) ||
                other.refreshTokens == refreshTokens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_select), refreshTokens);

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserIncludeImplCopyWith<_$UserIncludeImpl> get copyWith =>
      __$$UserIncludeImplCopyWithImpl<_$UserIncludeImpl>(this, _$identity);
}

abstract class _UserInclude extends UserInclude {
  const factory _UserInclude(
      {final List<UserScalarField>? select,
      final RefreshTokenInclude? refreshTokens}) = _$UserIncludeImpl;
  const _UserInclude._() : super._();

  @override
  List<UserScalarField>? get select;
  @override
  RefreshTokenInclude? get refreshTokens;

  /// Create a copy of UserInclude
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserIncludeImplCopyWith<_$UserIncludeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserRefreshTokensWriteInput {
  List<RefreshTokenWhereUniqueInput>? get connect =>
      throw _privateConstructorUsedError;
  List<RefreshTokenWhereUniqueInput>? get disconnect =>
      throw _privateConstructorUsedError;
  List<RefreshTokenWhereUniqueInput>? get set =>
      throw _privateConstructorUsedError;
  List<CreateRefreshTokenInput>? get create =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserRefreshTokensWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRefreshTokensWriteInputCopyWith<UserRefreshTokensWriteInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRefreshTokensWriteInputCopyWith<$Res> {
  factory $UserRefreshTokensWriteInputCopyWith(
          UserRefreshTokensWriteInput value,
          $Res Function(UserRefreshTokensWriteInput) then) =
      _$UserRefreshTokensWriteInputCopyWithImpl<$Res,
          UserRefreshTokensWriteInput>;
  @useResult
  $Res call(
      {List<RefreshTokenWhereUniqueInput>? connect,
      List<RefreshTokenWhereUniqueInput>? disconnect,
      List<RefreshTokenWhereUniqueInput>? set,
      List<CreateRefreshTokenInput>? create});
}

/// @nodoc
class _$UserRefreshTokensWriteInputCopyWithImpl<$Res,
        $Val extends UserRefreshTokensWriteInput>
    implements $UserRefreshTokensWriteInputCopyWith<$Res> {
  _$UserRefreshTokensWriteInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRefreshTokensWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connect = freezed,
    Object? disconnect = freezed,
    Object? set = freezed,
    Object? create = freezed,
  }) {
    return _then(_value.copyWith(
      connect: freezed == connect
          ? _value.connect
          : connect // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      disconnect: freezed == disconnect
          ? _value.disconnect
          : disconnect // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      set: freezed == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      create: freezed == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as List<CreateRefreshTokenInput>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRefreshTokensWriteInputImplCopyWith<$Res>
    implements $UserRefreshTokensWriteInputCopyWith<$Res> {
  factory _$$UserRefreshTokensWriteInputImplCopyWith(
          _$UserRefreshTokensWriteInputImpl value,
          $Res Function(_$UserRefreshTokensWriteInputImpl) then) =
      __$$UserRefreshTokensWriteInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RefreshTokenWhereUniqueInput>? connect,
      List<RefreshTokenWhereUniqueInput>? disconnect,
      List<RefreshTokenWhereUniqueInput>? set,
      List<CreateRefreshTokenInput>? create});
}

/// @nodoc
class __$$UserRefreshTokensWriteInputImplCopyWithImpl<$Res>
    extends _$UserRefreshTokensWriteInputCopyWithImpl<$Res,
        _$UserRefreshTokensWriteInputImpl>
    implements _$$UserRefreshTokensWriteInputImplCopyWith<$Res> {
  __$$UserRefreshTokensWriteInputImplCopyWithImpl(
      _$UserRefreshTokensWriteInputImpl _value,
      $Res Function(_$UserRefreshTokensWriteInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRefreshTokensWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connect = freezed,
    Object? disconnect = freezed,
    Object? set = freezed,
    Object? create = freezed,
  }) {
    return _then(_$UserRefreshTokensWriteInputImpl(
      connect: freezed == connect
          ? _value._connect
          : connect // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      disconnect: freezed == disconnect
          ? _value._disconnect
          : disconnect // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      set: freezed == set
          ? _value._set
          : set // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereUniqueInput>?,
      create: freezed == create
          ? _value._create
          : create // ignore: cast_nullable_to_non_nullable
              as List<CreateRefreshTokenInput>?,
    ));
  }
}

/// @nodoc

class _$UserRefreshTokensWriteInputImpl extends _UserRefreshTokensWriteInput {
  const _$UserRefreshTokensWriteInputImpl(
      {final List<RefreshTokenWhereUniqueInput>? connect,
      final List<RefreshTokenWhereUniqueInput>? disconnect,
      final List<RefreshTokenWhereUniqueInput>? set,
      final List<CreateRefreshTokenInput>? create})
      : _connect = connect,
        _disconnect = disconnect,
        _set = set,
        _create = create,
        super._();

  final List<RefreshTokenWhereUniqueInput>? _connect;
  @override
  List<RefreshTokenWhereUniqueInput>? get connect {
    final value = _connect;
    if (value == null) return null;
    if (_connect is EqualUnmodifiableListView) return _connect;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RefreshTokenWhereUniqueInput>? _disconnect;
  @override
  List<RefreshTokenWhereUniqueInput>? get disconnect {
    final value = _disconnect;
    if (value == null) return null;
    if (_disconnect is EqualUnmodifiableListView) return _disconnect;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RefreshTokenWhereUniqueInput>? _set;
  @override
  List<RefreshTokenWhereUniqueInput>? get set {
    final value = _set;
    if (value == null) return null;
    if (_set is EqualUnmodifiableListView) return _set;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CreateRefreshTokenInput>? _create;
  @override
  List<CreateRefreshTokenInput>? get create {
    final value = _create;
    if (value == null) return null;
    if (_create is EqualUnmodifiableListView) return _create;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserRefreshTokensWriteInput(connect: $connect, disconnect: $disconnect, set: $set, create: $create)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRefreshTokensWriteInputImpl &&
            const DeepCollectionEquality().equals(other._connect, _connect) &&
            const DeepCollectionEquality()
                .equals(other._disconnect, _disconnect) &&
            const DeepCollectionEquality().equals(other._set, _set) &&
            const DeepCollectionEquality().equals(other._create, _create));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_connect),
      const DeepCollectionEquality().hash(_disconnect),
      const DeepCollectionEquality().hash(_set),
      const DeepCollectionEquality().hash(_create));

  /// Create a copy of UserRefreshTokensWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRefreshTokensWriteInputImplCopyWith<_$UserRefreshTokensWriteInputImpl>
      get copyWith => __$$UserRefreshTokensWriteInputImplCopyWithImpl<
          _$UserRefreshTokensWriteInputImpl>(this, _$identity);
}

abstract class _UserRefreshTokensWriteInput
    extends UserRefreshTokensWriteInput {
  const factory _UserRefreshTokensWriteInput(
          {final List<RefreshTokenWhereUniqueInput>? connect,
          final List<RefreshTokenWhereUniqueInput>? disconnect,
          final List<RefreshTokenWhereUniqueInput>? set,
          final List<CreateRefreshTokenInput>? create}) =
      _$UserRefreshTokensWriteInputImpl;
  const _UserRefreshTokensWriteInput._() : super._();

  @override
  List<RefreshTokenWhereUniqueInput>? get connect;
  @override
  List<RefreshTokenWhereUniqueInput>? get disconnect;
  @override
  List<RefreshTokenWhereUniqueInput>? get set;
  @override
  List<CreateRefreshTokenInput>? get create;

  /// Create a copy of UserRefreshTokensWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRefreshTokensWriteInputImplCopyWith<_$UserRefreshTokensWriteInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
