// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RefreshToken {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_hash')
  String get tokenHash => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'revoked_at')
  DateTime? get revokedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenCopyWith<RefreshToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res, RefreshToken>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(includeFromJson: false, includeToJson: false) User? user,
      @JsonKey(name: 'token_hash') String tokenHash,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      @JsonKey(name: 'revoked_at') DateTime? revokedAt,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res, $Val extends RefreshToken>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? user = freezed,
    Object? tokenHash = null,
    Object? expiresAt = null,
    Object? revokedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      tokenHash: null == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenImplCopyWith<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  factory _$$RefreshTokenImplCopyWith(
          _$RefreshTokenImpl value, $Res Function(_$RefreshTokenImpl) then) =
      __$$RefreshTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(includeFromJson: false, includeToJson: false) User? user,
      @JsonKey(name: 'token_hash') String tokenHash,
      @JsonKey(name: 'expires_at') DateTime expiresAt,
      @JsonKey(name: 'revoked_at') DateTime? revokedAt,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RefreshTokenImplCopyWithImpl<$Res>
    extends _$RefreshTokenCopyWithImpl<$Res, _$RefreshTokenImpl>
    implements _$$RefreshTokenImplCopyWith<$Res> {
  __$$RefreshTokenImplCopyWithImpl(
      _$RefreshTokenImpl _value, $Res Function(_$RefreshTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? user = freezed,
    Object? tokenHash = null,
    Object? expiresAt = null,
    Object? revokedAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$RefreshTokenImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      tokenHash: null == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$RefreshTokenImpl extends _RefreshToken {
  const _$RefreshTokenImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(includeFromJson: false, includeToJson: false) this.user,
      @JsonKey(name: 'token_hash') required this.tokenHash,
      @JsonKey(name: 'expires_at') required this.expiresAt,
      @JsonKey(name: 'revoked_at') this.revokedAt,
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final User? user;
  @override
  @JsonKey(name: 'token_hash')
  final String tokenHash;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @override
  @JsonKey(name: 'revoked_at')
  final DateTime? revokedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'RefreshToken(id: $id, userId: $userId, user: $user, tokenHash: $tokenHash, expiresAt: $expiresAt, revokedAt: $revokedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tokenHash, tokenHash) ||
                other.tokenHash == tokenHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, user, tokenHash,
      expiresAt, revokedAt, createdAt);

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      __$$RefreshTokenImplCopyWithImpl<_$RefreshTokenImpl>(this, _$identity);
}

abstract class _RefreshToken extends RefreshToken {
  const factory _RefreshToken(
      {required final String id,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(includeFromJson: false, includeToJson: false) final User? user,
      @JsonKey(name: 'token_hash') required final String tokenHash,
      @JsonKey(name: 'expires_at') required final DateTime expiresAt,
      @JsonKey(name: 'revoked_at') final DateTime? revokedAt,
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$RefreshTokenImpl;
  const _RefreshToken._() : super._();

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  User? get user;
  @override
  @JsonKey(name: 'token_hash')
  String get tokenHash;
  @override
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  @JsonKey(name: 'revoked_at')
  DateTime? get revokedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of RefreshToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenImplCopyWith<_$RefreshTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateRefreshTokenInput {
  String get userId => throw _privateConstructorUsedError;
  String get tokenHash => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime? get revokedAt => throw _privateConstructorUsedError;
  RefreshTokenUserWriteInput? get user => throw _privateConstructorUsedError;

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRefreshTokenInputCopyWith<CreateRefreshTokenInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRefreshTokenInputCopyWith<$Res> {
  factory $CreateRefreshTokenInputCopyWith(CreateRefreshTokenInput value,
          $Res Function(CreateRefreshTokenInput) then) =
      _$CreateRefreshTokenInputCopyWithImpl<$Res, CreateRefreshTokenInput>;
  @useResult
  $Res call(
      {String userId,
      String tokenHash,
      DateTime expiresAt,
      DateTime? revokedAt,
      RefreshTokenUserWriteInput? user});

  $RefreshTokenUserWriteInputCopyWith<$Res>? get user;
}

/// @nodoc
class _$CreateRefreshTokenInputCopyWithImpl<$Res,
        $Val extends CreateRefreshTokenInput>
    implements $CreateRefreshTokenInputCopyWith<$Res> {
  _$CreateRefreshTokenInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tokenHash = null,
    Object? expiresAt = null,
    Object? revokedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenHash: null == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RefreshTokenUserWriteInput?,
    ) as $Val);
  }

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenUserWriteInputCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $RefreshTokenUserWriteInputCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateRefreshTokenInputImplCopyWith<$Res>
    implements $CreateRefreshTokenInputCopyWith<$Res> {
  factory _$$CreateRefreshTokenInputImplCopyWith(
          _$CreateRefreshTokenInputImpl value,
          $Res Function(_$CreateRefreshTokenInputImpl) then) =
      __$$CreateRefreshTokenInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String tokenHash,
      DateTime expiresAt,
      DateTime? revokedAt,
      RefreshTokenUserWriteInput? user});

  @override
  $RefreshTokenUserWriteInputCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CreateRefreshTokenInputImplCopyWithImpl<$Res>
    extends _$CreateRefreshTokenInputCopyWithImpl<$Res,
        _$CreateRefreshTokenInputImpl>
    implements _$$CreateRefreshTokenInputImplCopyWith<$Res> {
  __$$CreateRefreshTokenInputImplCopyWithImpl(
      _$CreateRefreshTokenInputImpl _value,
      $Res Function(_$CreateRefreshTokenInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? tokenHash = null,
    Object? expiresAt = null,
    Object? revokedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$CreateRefreshTokenInputImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenHash: null == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RefreshTokenUserWriteInput?,
    ));
  }
}

/// @nodoc

class _$CreateRefreshTokenInputImpl extends _CreateRefreshTokenInput {
  const _$CreateRefreshTokenInputImpl(
      {required this.userId,
      required this.tokenHash,
      required this.expiresAt,
      this.revokedAt,
      this.user})
      : super._();

  @override
  final String userId;
  @override
  final String tokenHash;
  @override
  final DateTime expiresAt;
  @override
  final DateTime? revokedAt;
  @override
  final RefreshTokenUserWriteInput? user;

  @override
  String toString() {
    return 'CreateRefreshTokenInput(userId: $userId, tokenHash: $tokenHash, expiresAt: $expiresAt, revokedAt: $revokedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRefreshTokenInputImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tokenHash, tokenHash) ||
                other.tokenHash == tokenHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, tokenHash, expiresAt, revokedAt, user);

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRefreshTokenInputImplCopyWith<_$CreateRefreshTokenInputImpl>
      get copyWith => __$$CreateRefreshTokenInputImplCopyWithImpl<
          _$CreateRefreshTokenInputImpl>(this, _$identity);
}

abstract class _CreateRefreshTokenInput extends CreateRefreshTokenInput {
  const factory _CreateRefreshTokenInput(
      {required final String userId,
      required final String tokenHash,
      required final DateTime expiresAt,
      final DateTime? revokedAt,
      final RefreshTokenUserWriteInput? user}) = _$CreateRefreshTokenInputImpl;
  const _CreateRefreshTokenInput._() : super._();

  @override
  String get userId;
  @override
  String get tokenHash;
  @override
  DateTime get expiresAt;
  @override
  DateTime? get revokedAt;
  @override
  RefreshTokenUserWriteInput? get user;

  /// Create a copy of CreateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRefreshTokenInputImplCopyWith<_$CreateRefreshTokenInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateRefreshTokenInput {
  String? get userId => throw _privateConstructorUsedError;
  String? get tokenHash => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get revokedAt => throw _privateConstructorUsedError;
  RefreshTokenUserWriteInput? get user => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRefreshTokenInputCopyWith<UpdateRefreshTokenInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRefreshTokenInputCopyWith<$Res> {
  factory $UpdateRefreshTokenInputCopyWith(UpdateRefreshTokenInput value,
          $Res Function(UpdateRefreshTokenInput) then) =
      _$UpdateRefreshTokenInputCopyWithImpl<$Res, UpdateRefreshTokenInput>;
  @useResult
  $Res call(
      {String? userId,
      String? tokenHash,
      DateTime? expiresAt,
      DateTime? revokedAt,
      RefreshTokenUserWriteInput? user});

  $RefreshTokenUserWriteInputCopyWith<$Res>? get user;
}

/// @nodoc
class _$UpdateRefreshTokenInputCopyWithImpl<$Res,
        $Val extends UpdateRefreshTokenInput>
    implements $UpdateRefreshTokenInputCopyWith<$Res> {
  _$UpdateRefreshTokenInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RefreshTokenUserWriteInput?,
    ) as $Val);
  }

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenUserWriteInputCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $RefreshTokenUserWriteInputCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateRefreshTokenInputImplCopyWith<$Res>
    implements $UpdateRefreshTokenInputCopyWith<$Res> {
  factory _$$UpdateRefreshTokenInputImplCopyWith(
          _$UpdateRefreshTokenInputImpl value,
          $Res Function(_$UpdateRefreshTokenInputImpl) then) =
      __$$UpdateRefreshTokenInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? tokenHash,
      DateTime? expiresAt,
      DateTime? revokedAt,
      RefreshTokenUserWriteInput? user});

  @override
  $RefreshTokenUserWriteInputCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UpdateRefreshTokenInputImplCopyWithImpl<$Res>
    extends _$UpdateRefreshTokenInputCopyWithImpl<$Res,
        _$UpdateRefreshTokenInputImpl>
    implements _$$UpdateRefreshTokenInputImplCopyWith<$Res> {
  __$$UpdateRefreshTokenInputImplCopyWithImpl(
      _$UpdateRefreshTokenInputImpl _value,
      $Res Function(_$UpdateRefreshTokenInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UpdateRefreshTokenInputImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RefreshTokenUserWriteInput?,
    ));
  }
}

/// @nodoc

class _$UpdateRefreshTokenInputImpl extends _UpdateRefreshTokenInput {
  const _$UpdateRefreshTokenInputImpl(
      {this.userId, this.tokenHash, this.expiresAt, this.revokedAt, this.user})
      : super._();

  @override
  final String? userId;
  @override
  final String? tokenHash;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? revokedAt;
  @override
  final RefreshTokenUserWriteInput? user;

  @override
  String toString() {
    return 'UpdateRefreshTokenInput(userId: $userId, tokenHash: $tokenHash, expiresAt: $expiresAt, revokedAt: $revokedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRefreshTokenInputImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tokenHash, tokenHash) ||
                other.tokenHash == tokenHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, tokenHash, expiresAt, revokedAt, user);

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRefreshTokenInputImplCopyWith<_$UpdateRefreshTokenInputImpl>
      get copyWith => __$$UpdateRefreshTokenInputImplCopyWithImpl<
          _$UpdateRefreshTokenInputImpl>(this, _$identity);
}

abstract class _UpdateRefreshTokenInput extends UpdateRefreshTokenInput {
  const factory _UpdateRefreshTokenInput(
      {final String? userId,
      final String? tokenHash,
      final DateTime? expiresAt,
      final DateTime? revokedAt,
      final RefreshTokenUserWriteInput? user}) = _$UpdateRefreshTokenInputImpl;
  const _UpdateRefreshTokenInput._() : super._();

  @override
  String? get userId;
  @override
  String? get tokenHash;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get revokedAt;
  @override
  RefreshTokenUserWriteInput? get user;

  /// Create a copy of UpdateRefreshTokenInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRefreshTokenInputImplCopyWith<_$UpdateRefreshTokenInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenWhereUniqueInput {
  String? get id => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenWhereUniqueInputCopyWith<RefreshTokenWhereUniqueInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenWhereUniqueInputCopyWith<$Res> {
  factory $RefreshTokenWhereUniqueInputCopyWith(
          RefreshTokenWhereUniqueInput value,
          $Res Function(RefreshTokenWhereUniqueInput) then) =
      _$RefreshTokenWhereUniqueInputCopyWithImpl<$Res,
          RefreshTokenWhereUniqueInput>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$RefreshTokenWhereUniqueInputCopyWithImpl<$Res,
        $Val extends RefreshTokenWhereUniqueInput>
    implements $RefreshTokenWhereUniqueInputCopyWith<$Res> {
  _$RefreshTokenWhereUniqueInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenWhereUniqueInput
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
abstract class _$$RefreshTokenWhereUniqueInputImplCopyWith<$Res>
    implements $RefreshTokenWhereUniqueInputCopyWith<$Res> {
  factory _$$RefreshTokenWhereUniqueInputImplCopyWith(
          _$RefreshTokenWhereUniqueInputImpl value,
          $Res Function(_$RefreshTokenWhereUniqueInputImpl) then) =
      __$$RefreshTokenWhereUniqueInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$RefreshTokenWhereUniqueInputImplCopyWithImpl<$Res>
    extends _$RefreshTokenWhereUniqueInputCopyWithImpl<$Res,
        _$RefreshTokenWhereUniqueInputImpl>
    implements _$$RefreshTokenWhereUniqueInputImplCopyWith<$Res> {
  __$$RefreshTokenWhereUniqueInputImplCopyWithImpl(
      _$RefreshTokenWhereUniqueInputImpl _value,
      $Res Function(_$RefreshTokenWhereUniqueInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$RefreshTokenWhereUniqueInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenWhereUniqueInputImpl extends _RefreshTokenWhereUniqueInput {
  const _$RefreshTokenWhereUniqueInputImpl({this.id}) : super._();

  @override
  final String? id;

  @override
  String toString() {
    return 'RefreshTokenWhereUniqueInput(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenWhereUniqueInputImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RefreshTokenWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenWhereUniqueInputImplCopyWith<
          _$RefreshTokenWhereUniqueInputImpl>
      get copyWith => __$$RefreshTokenWhereUniqueInputImplCopyWithImpl<
          _$RefreshTokenWhereUniqueInputImpl>(this, _$identity);
}

abstract class _RefreshTokenWhereUniqueInput
    extends RefreshTokenWhereUniqueInput {
  const factory _RefreshTokenWhereUniqueInput({final String? id}) =
      _$RefreshTokenWhereUniqueInputImpl;
  const _RefreshTokenWhereUniqueInput._() : super._();

  @override
  String? get id;

  /// Create a copy of RefreshTokenWhereUniqueInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenWhereUniqueInputImplCopyWith<
          _$RefreshTokenWhereUniqueInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenWhereInput {
  StringFilter? get id => throw _privateConstructorUsedError;
  StringFilter? get userId => throw _privateConstructorUsedError;
  UserRelationFilter? get user => throw _privateConstructorUsedError;
  StringFilter? get tokenHash => throw _privateConstructorUsedError;
  DateTimeFilter? get expiresAt => throw _privateConstructorUsedError;
  DateTimeFilter? get revokedAt => throw _privateConstructorUsedError;
  DateTimeFilter? get createdAt => throw _privateConstructorUsedError;
  List<RefreshTokenWhereInput>? get AND => throw _privateConstructorUsedError;
  List<RefreshTokenWhereInput>? get OR => throw _privateConstructorUsedError;
  RefreshTokenWhereInput? get NOT => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenWhereInputCopyWith<RefreshTokenWhereInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenWhereInputCopyWith<$Res> {
  factory $RefreshTokenWhereInputCopyWith(RefreshTokenWhereInput value,
          $Res Function(RefreshTokenWhereInput) then) =
      _$RefreshTokenWhereInputCopyWithImpl<$Res, RefreshTokenWhereInput>;
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? userId,
      UserRelationFilter? user,
      StringFilter? tokenHash,
      DateTimeFilter? expiresAt,
      DateTimeFilter? revokedAt,
      DateTimeFilter? createdAt,
      List<RefreshTokenWhereInput>? AND,
      List<RefreshTokenWhereInput>? OR,
      RefreshTokenWhereInput? NOT});

  $StringFilterCopyWith<$Res>? get id;
  $StringFilterCopyWith<$Res>? get userId;
  $UserRelationFilterCopyWith<$Res>? get user;
  $StringFilterCopyWith<$Res>? get tokenHash;
  $DateTimeFilterCopyWith<$Res>? get expiresAt;
  $DateTimeFilterCopyWith<$Res>? get revokedAt;
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  $RefreshTokenWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class _$RefreshTokenWhereInputCopyWithImpl<$Res,
        $Val extends RefreshTokenWhereInput>
    implements $RefreshTokenWhereInputCopyWith<$Res> {
  _$RefreshTokenWhereInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRelationFilter?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      AND: freezed == AND
          ? _value.AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereInput>?,
      OR: freezed == OR
          ? _value.OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ) as $Val);
  }

  /// Create a copy of RefreshTokenWhereInput
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

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get userId {
    if (_value.userId == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.userId!, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRelationFilterCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserRelationFilterCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StringFilterCopyWith<$Res>? get tokenHash {
    if (_value.tokenHash == null) {
      return null;
    }

    return $StringFilterCopyWith<$Res>(_value.tokenHash!, (value) {
      return _then(_value.copyWith(tokenHash: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateTimeFilterCopyWith<$Res>? get expiresAt {
    if (_value.expiresAt == null) {
      return null;
    }

    return $DateTimeFilterCopyWith<$Res>(_value.expiresAt!, (value) {
      return _then(_value.copyWith(expiresAt: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateTimeFilterCopyWith<$Res>? get revokedAt {
    if (_value.revokedAt == null) {
      return null;
    }

    return $DateTimeFilterCopyWith<$Res>(_value.revokedAt!, (value) {
      return _then(_value.copyWith(revokedAt: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenWhereInput
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

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get NOT {
    if (_value.NOT == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.NOT!, (value) {
      return _then(_value.copyWith(NOT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenWhereInputImplCopyWith<$Res>
    implements $RefreshTokenWhereInputCopyWith<$Res> {
  factory _$$RefreshTokenWhereInputImplCopyWith(
          _$RefreshTokenWhereInputImpl value,
          $Res Function(_$RefreshTokenWhereInputImpl) then) =
      __$$RefreshTokenWhereInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringFilter? id,
      StringFilter? userId,
      UserRelationFilter? user,
      StringFilter? tokenHash,
      DateTimeFilter? expiresAt,
      DateTimeFilter? revokedAt,
      DateTimeFilter? createdAt,
      List<RefreshTokenWhereInput>? AND,
      List<RefreshTokenWhereInput>? OR,
      RefreshTokenWhereInput? NOT});

  @override
  $StringFilterCopyWith<$Res>? get id;
  @override
  $StringFilterCopyWith<$Res>? get userId;
  @override
  $UserRelationFilterCopyWith<$Res>? get user;
  @override
  $StringFilterCopyWith<$Res>? get tokenHash;
  @override
  $DateTimeFilterCopyWith<$Res>? get expiresAt;
  @override
  $DateTimeFilterCopyWith<$Res>? get revokedAt;
  @override
  $DateTimeFilterCopyWith<$Res>? get createdAt;
  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get NOT;
}

/// @nodoc
class __$$RefreshTokenWhereInputImplCopyWithImpl<$Res>
    extends _$RefreshTokenWhereInputCopyWithImpl<$Res,
        _$RefreshTokenWhereInputImpl>
    implements _$$RefreshTokenWhereInputImplCopyWith<$Res> {
  __$$RefreshTokenWhereInputImplCopyWithImpl(
      _$RefreshTokenWhereInputImpl _value,
      $Res Function(_$RefreshTokenWhereInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
    Object? createdAt = freezed,
    Object? AND = freezed,
    Object? OR = freezed,
    Object? NOT = freezed,
  }) {
    return _then(_$RefreshTokenWhereInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRelationFilter?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as StringFilter?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeFilter?,
      AND: freezed == AND
          ? _value._AND
          : AND // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereInput>?,
      OR: freezed == OR
          ? _value._OR
          : OR // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenWhereInput>?,
      NOT: freezed == NOT
          ? _value.NOT
          : NOT // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenWhereInputImpl extends _RefreshTokenWhereInput {
  const _$RefreshTokenWhereInputImpl(
      {this.id,
      this.userId,
      this.user,
      this.tokenHash,
      this.expiresAt,
      this.revokedAt,
      this.createdAt,
      final List<RefreshTokenWhereInput>? AND,
      final List<RefreshTokenWhereInput>? OR,
      this.NOT})
      : _AND = AND,
        _OR = OR,
        super._();

  @override
  final StringFilter? id;
  @override
  final StringFilter? userId;
  @override
  final UserRelationFilter? user;
  @override
  final StringFilter? tokenHash;
  @override
  final DateTimeFilter? expiresAt;
  @override
  final DateTimeFilter? revokedAt;
  @override
  final DateTimeFilter? createdAt;
  final List<RefreshTokenWhereInput>? _AND;
  @override
  List<RefreshTokenWhereInput>? get AND {
    final value = _AND;
    if (value == null) return null;
    if (_AND is EqualUnmodifiableListView) return _AND;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RefreshTokenWhereInput>? _OR;
  @override
  List<RefreshTokenWhereInput>? get OR {
    final value = _OR;
    if (value == null) return null;
    if (_OR is EqualUnmodifiableListView) return _OR;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RefreshTokenWhereInput? NOT;

  @override
  String toString() {
    return 'RefreshTokenWhereInput(id: $id, userId: $userId, user: $user, tokenHash: $tokenHash, expiresAt: $expiresAt, revokedAt: $revokedAt, createdAt: $createdAt, AND: $AND, OR: $OR, NOT: $NOT)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenWhereInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tokenHash, tokenHash) ||
                other.tokenHash == tokenHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
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
      userId,
      user,
      tokenHash,
      expiresAt,
      revokedAt,
      createdAt,
      const DeepCollectionEquality().hash(_AND),
      const DeepCollectionEquality().hash(_OR),
      NOT);

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenWhereInputImplCopyWith<_$RefreshTokenWhereInputImpl>
      get copyWith => __$$RefreshTokenWhereInputImplCopyWithImpl<
          _$RefreshTokenWhereInputImpl>(this, _$identity);
}

abstract class _RefreshTokenWhereInput extends RefreshTokenWhereInput {
  const factory _RefreshTokenWhereInput(
      {final StringFilter? id,
      final StringFilter? userId,
      final UserRelationFilter? user,
      final StringFilter? tokenHash,
      final DateTimeFilter? expiresAt,
      final DateTimeFilter? revokedAt,
      final DateTimeFilter? createdAt,
      final List<RefreshTokenWhereInput>? AND,
      final List<RefreshTokenWhereInput>? OR,
      final RefreshTokenWhereInput? NOT}) = _$RefreshTokenWhereInputImpl;
  const _RefreshTokenWhereInput._() : super._();

  @override
  StringFilter? get id;
  @override
  StringFilter? get userId;
  @override
  UserRelationFilter? get user;
  @override
  StringFilter? get tokenHash;
  @override
  DateTimeFilter? get expiresAt;
  @override
  DateTimeFilter? get revokedAt;
  @override
  DateTimeFilter? get createdAt;
  @override
  List<RefreshTokenWhereInput>? get AND;
  @override
  List<RefreshTokenWhereInput>? get OR;
  @override
  RefreshTokenWhereInput? get NOT;

  /// Create a copy of RefreshTokenWhereInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenWhereInputImplCopyWith<_$RefreshTokenWhereInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenListRelationFilter {
  RefreshTokenWhereInput? get some => throw _privateConstructorUsedError;
  RefreshTokenWhereInput? get every => throw _privateConstructorUsedError;
  RefreshTokenWhereInput? get none => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenListRelationFilterCopyWith<RefreshTokenListRelationFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenListRelationFilterCopyWith<$Res> {
  factory $RefreshTokenListRelationFilterCopyWith(
          RefreshTokenListRelationFilter value,
          $Res Function(RefreshTokenListRelationFilter) then) =
      _$RefreshTokenListRelationFilterCopyWithImpl<$Res,
          RefreshTokenListRelationFilter>;
  @useResult
  $Res call(
      {RefreshTokenWhereInput? some,
      RefreshTokenWhereInput? every,
      RefreshTokenWhereInput? none});

  $RefreshTokenWhereInputCopyWith<$Res>? get some;
  $RefreshTokenWhereInputCopyWith<$Res>? get every;
  $RefreshTokenWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class _$RefreshTokenListRelationFilterCopyWithImpl<$Res,
        $Val extends RefreshTokenListRelationFilter>
    implements $RefreshTokenListRelationFilterCopyWith<$Res> {
  _$RefreshTokenListRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenListRelationFilter
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
              as RefreshTokenWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ) as $Val);
  }

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get some {
    if (_value.some == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.some!, (value) {
      return _then(_value.copyWith(some: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get every {
    if (_value.every == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.every!, (value) {
      return _then(_value.copyWith(every: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get none {
    if (_value.none == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.none!, (value) {
      return _then(_value.copyWith(none: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenListRelationFilterImplCopyWith<$Res>
    implements $RefreshTokenListRelationFilterCopyWith<$Res> {
  factory _$$RefreshTokenListRelationFilterImplCopyWith(
          _$RefreshTokenListRelationFilterImpl value,
          $Res Function(_$RefreshTokenListRelationFilterImpl) then) =
      __$$RefreshTokenListRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RefreshTokenWhereInput? some,
      RefreshTokenWhereInput? every,
      RefreshTokenWhereInput? none});

  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get some;
  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get every;
  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get none;
}

/// @nodoc
class __$$RefreshTokenListRelationFilterImplCopyWithImpl<$Res>
    extends _$RefreshTokenListRelationFilterCopyWithImpl<$Res,
        _$RefreshTokenListRelationFilterImpl>
    implements _$$RefreshTokenListRelationFilterImplCopyWith<$Res> {
  __$$RefreshTokenListRelationFilterImplCopyWithImpl(
      _$RefreshTokenListRelationFilterImpl _value,
      $Res Function(_$RefreshTokenListRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? some = freezed,
    Object? every = freezed,
    Object? none = freezed,
  }) {
    return _then(_$RefreshTokenListRelationFilterImpl(
      some: freezed == some
          ? _value.some
          : some // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
      every: freezed == every
          ? _value.every
          : every // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
      none: freezed == none
          ? _value.none
          : none // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenListRelationFilterImpl
    extends _RefreshTokenListRelationFilter {
  const _$RefreshTokenListRelationFilterImpl({this.some, this.every, this.none})
      : super._();

  @override
  final RefreshTokenWhereInput? some;
  @override
  final RefreshTokenWhereInput? every;
  @override
  final RefreshTokenWhereInput? none;

  @override
  String toString() {
    return 'RefreshTokenListRelationFilter(some: $some, every: $every, none: $none)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenListRelationFilterImpl &&
            (identical(other.some, some) || other.some == some) &&
            (identical(other.every, every) || other.every == every) &&
            (identical(other.none, none) || other.none == none));
  }

  @override
  int get hashCode => Object.hash(runtimeType, some, every, none);

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenListRelationFilterImplCopyWith<
          _$RefreshTokenListRelationFilterImpl>
      get copyWith => __$$RefreshTokenListRelationFilterImplCopyWithImpl<
          _$RefreshTokenListRelationFilterImpl>(this, _$identity);
}

abstract class _RefreshTokenListRelationFilter
    extends RefreshTokenListRelationFilter {
  const factory _RefreshTokenListRelationFilter(
          {final RefreshTokenWhereInput? some,
          final RefreshTokenWhereInput? every,
          final RefreshTokenWhereInput? none}) =
      _$RefreshTokenListRelationFilterImpl;
  const _RefreshTokenListRelationFilter._() : super._();

  @override
  RefreshTokenWhereInput? get some;
  @override
  RefreshTokenWhereInput? get every;
  @override
  RefreshTokenWhereInput? get none;

  /// Create a copy of RefreshTokenListRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenListRelationFilterImplCopyWith<
          _$RefreshTokenListRelationFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenRelationFilter {
  @JsonKey(name: 'is')
  RefreshTokenWhereInput? get is_ => throw _privateConstructorUsedError;
  RefreshTokenWhereInput? get isNot => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenRelationFilterCopyWith<RefreshTokenRelationFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRelationFilterCopyWith<$Res> {
  factory $RefreshTokenRelationFilterCopyWith(RefreshTokenRelationFilter value,
          $Res Function(RefreshTokenRelationFilter) then) =
      _$RefreshTokenRelationFilterCopyWithImpl<$Res,
          RefreshTokenRelationFilter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is') RefreshTokenWhereInput? is_,
      RefreshTokenWhereInput? isNot});

  $RefreshTokenWhereInputCopyWith<$Res>? get is_;
  $RefreshTokenWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class _$RefreshTokenRelationFilterCopyWithImpl<$Res,
        $Val extends RefreshTokenRelationFilter>
    implements $RefreshTokenRelationFilterCopyWith<$Res> {
  _$RefreshTokenRelationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenRelationFilter
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
              as RefreshTokenWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ) as $Val);
  }

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get is_ {
    if (_value.is_ == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.is_!, (value) {
      return _then(_value.copyWith(is_: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenWhereInputCopyWith<$Res>? get isNot {
    if (_value.isNot == null) {
      return null;
    }

    return $RefreshTokenWhereInputCopyWith<$Res>(_value.isNot!, (value) {
      return _then(_value.copyWith(isNot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenRelationFilterImplCopyWith<$Res>
    implements $RefreshTokenRelationFilterCopyWith<$Res> {
  factory _$$RefreshTokenRelationFilterImplCopyWith(
          _$RefreshTokenRelationFilterImpl value,
          $Res Function(_$RefreshTokenRelationFilterImpl) then) =
      __$$RefreshTokenRelationFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is') RefreshTokenWhereInput? is_,
      RefreshTokenWhereInput? isNot});

  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get is_;
  @override
  $RefreshTokenWhereInputCopyWith<$Res>? get isNot;
}

/// @nodoc
class __$$RefreshTokenRelationFilterImplCopyWithImpl<$Res>
    extends _$RefreshTokenRelationFilterCopyWithImpl<$Res,
        _$RefreshTokenRelationFilterImpl>
    implements _$$RefreshTokenRelationFilterImplCopyWith<$Res> {
  __$$RefreshTokenRelationFilterImplCopyWithImpl(
      _$RefreshTokenRelationFilterImpl _value,
      $Res Function(_$RefreshTokenRelationFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_ = freezed,
    Object? isNot = freezed,
  }) {
    return _then(_$RefreshTokenRelationFilterImpl(
      is_: freezed == is_
          ? _value.is_
          : is_ // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
      isNot: freezed == isNot
          ? _value.isNot
          : isNot // ignore: cast_nullable_to_non_nullable
              as RefreshTokenWhereInput?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenRelationFilterImpl extends _RefreshTokenRelationFilter {
  const _$RefreshTokenRelationFilterImpl(
      {@JsonKey(name: 'is') this.is_, this.isNot})
      : super._();

  @override
  @JsonKey(name: 'is')
  final RefreshTokenWhereInput? is_;
  @override
  final RefreshTokenWhereInput? isNot;

  @override
  String toString() {
    return 'RefreshTokenRelationFilter(is_: $is_, isNot: $isNot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRelationFilterImpl &&
            (identical(other.is_, is_) || other.is_ == is_) &&
            (identical(other.isNot, isNot) || other.isNot == isNot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, is_, isNot);

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRelationFilterImplCopyWith<_$RefreshTokenRelationFilterImpl>
      get copyWith => __$$RefreshTokenRelationFilterImplCopyWithImpl<
          _$RefreshTokenRelationFilterImpl>(this, _$identity);
}

abstract class _RefreshTokenRelationFilter extends RefreshTokenRelationFilter {
  const factory _RefreshTokenRelationFilter(
      {@JsonKey(name: 'is') final RefreshTokenWhereInput? is_,
      final RefreshTokenWhereInput? isNot}) = _$RefreshTokenRelationFilterImpl;
  const _RefreshTokenRelationFilter._() : super._();

  @override
  @JsonKey(name: 'is')
  RefreshTokenWhereInput? get is_;
  @override
  RefreshTokenWhereInput? get isNot;

  /// Create a copy of RefreshTokenRelationFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenRelationFilterImplCopyWith<_$RefreshTokenRelationFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenOrderByInput {
  SortOrder? get id => throw _privateConstructorUsedError;
  SortOrder? get userId => throw _privateConstructorUsedError;
  SortOrder? get tokenHash => throw _privateConstructorUsedError;
  SortOrder? get expiresAt => throw _privateConstructorUsedError;
  SortOrder? get revokedAt => throw _privateConstructorUsedError;
  SortOrder? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenOrderByInputCopyWith<RefreshTokenOrderByInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenOrderByInputCopyWith<$Res> {
  factory $RefreshTokenOrderByInputCopyWith(RefreshTokenOrderByInput value,
          $Res Function(RefreshTokenOrderByInput) then) =
      _$RefreshTokenOrderByInputCopyWithImpl<$Res, RefreshTokenOrderByInput>;
  @useResult
  $Res call(
      {SortOrder? id,
      SortOrder? userId,
      SortOrder? tokenHash,
      SortOrder? expiresAt,
      SortOrder? revokedAt,
      SortOrder? createdAt});
}

/// @nodoc
class _$RefreshTokenOrderByInputCopyWithImpl<$Res,
        $Val extends RefreshTokenOrderByInput>
    implements $RefreshTokenOrderByInputCopyWith<$Res> {
  _$RefreshTokenOrderByInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenOrderByInputImplCopyWith<$Res>
    implements $RefreshTokenOrderByInputCopyWith<$Res> {
  factory _$$RefreshTokenOrderByInputImplCopyWith(
          _$RefreshTokenOrderByInputImpl value,
          $Res Function(_$RefreshTokenOrderByInputImpl) then) =
      __$$RefreshTokenOrderByInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SortOrder? id,
      SortOrder? userId,
      SortOrder? tokenHash,
      SortOrder? expiresAt,
      SortOrder? revokedAt,
      SortOrder? createdAt});
}

/// @nodoc
class __$$RefreshTokenOrderByInputImplCopyWithImpl<$Res>
    extends _$RefreshTokenOrderByInputCopyWithImpl<$Res,
        _$RefreshTokenOrderByInputImpl>
    implements _$$RefreshTokenOrderByInputImplCopyWith<$Res> {
  __$$RefreshTokenOrderByInputImplCopyWithImpl(
      _$RefreshTokenOrderByInputImpl _value,
      $Res Function(_$RefreshTokenOrderByInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? tokenHash = freezed,
    Object? expiresAt = freezed,
    Object? revokedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$RefreshTokenOrderByInputImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      tokenHash: freezed == tokenHash
          ? _value.tokenHash
          : tokenHash // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenOrderByInputImpl extends _RefreshTokenOrderByInput {
  const _$RefreshTokenOrderByInputImpl(
      {this.id,
      this.userId,
      this.tokenHash,
      this.expiresAt,
      this.revokedAt,
      this.createdAt})
      : super._();

  @override
  final SortOrder? id;
  @override
  final SortOrder? userId;
  @override
  final SortOrder? tokenHash;
  @override
  final SortOrder? expiresAt;
  @override
  final SortOrder? revokedAt;
  @override
  final SortOrder? createdAt;

  @override
  String toString() {
    return 'RefreshTokenOrderByInput(id: $id, userId: $userId, tokenHash: $tokenHash, expiresAt: $expiresAt, revokedAt: $revokedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenOrderByInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tokenHash, tokenHash) ||
                other.tokenHash == tokenHash) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, tokenHash, expiresAt, revokedAt, createdAt);

  /// Create a copy of RefreshTokenOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenOrderByInputImplCopyWith<_$RefreshTokenOrderByInputImpl>
      get copyWith => __$$RefreshTokenOrderByInputImplCopyWithImpl<
          _$RefreshTokenOrderByInputImpl>(this, _$identity);
}

abstract class _RefreshTokenOrderByInput extends RefreshTokenOrderByInput {
  const factory _RefreshTokenOrderByInput(
      {final SortOrder? id,
      final SortOrder? userId,
      final SortOrder? tokenHash,
      final SortOrder? expiresAt,
      final SortOrder? revokedAt,
      final SortOrder? createdAt}) = _$RefreshTokenOrderByInputImpl;
  const _RefreshTokenOrderByInput._() : super._();

  @override
  SortOrder? get id;
  @override
  SortOrder? get userId;
  @override
  SortOrder? get tokenHash;
  @override
  SortOrder? get expiresAt;
  @override
  SortOrder? get revokedAt;
  @override
  SortOrder? get createdAt;

  /// Create a copy of RefreshTokenOrderByInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenOrderByInputImplCopyWith<_$RefreshTokenOrderByInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenInclude {
  List<RefreshTokenScalarField>? get select =>
      throw _privateConstructorUsedError;
  UserInclude? get user => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenIncludeCopyWith<RefreshTokenInclude> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenIncludeCopyWith<$Res> {
  factory $RefreshTokenIncludeCopyWith(
          RefreshTokenInclude value, $Res Function(RefreshTokenInclude) then) =
      _$RefreshTokenIncludeCopyWithImpl<$Res, RefreshTokenInclude>;
  @useResult
  $Res call({List<RefreshTokenScalarField>? select, UserInclude? user});

  $UserIncludeCopyWith<$Res>? get user;
}

/// @nodoc
class _$RefreshTokenIncludeCopyWithImpl<$Res, $Val extends RefreshTokenInclude>
    implements $RefreshTokenIncludeCopyWith<$Res> {
  _$RefreshTokenIncludeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenScalarField>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInclude?,
    ) as $Val);
  }

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIncludeCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserIncludeCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenIncludeImplCopyWith<$Res>
    implements $RefreshTokenIncludeCopyWith<$Res> {
  factory _$$RefreshTokenIncludeImplCopyWith(_$RefreshTokenIncludeImpl value,
          $Res Function(_$RefreshTokenIncludeImpl) then) =
      __$$RefreshTokenIncludeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RefreshTokenScalarField>? select, UserInclude? user});

  @override
  $UserIncludeCopyWith<$Res>? get user;
}

/// @nodoc
class __$$RefreshTokenIncludeImplCopyWithImpl<$Res>
    extends _$RefreshTokenIncludeCopyWithImpl<$Res, _$RefreshTokenIncludeImpl>
    implements _$$RefreshTokenIncludeImplCopyWith<$Res> {
  __$$RefreshTokenIncludeImplCopyWithImpl(_$RefreshTokenIncludeImpl _value,
      $Res Function(_$RefreshTokenIncludeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? select = freezed,
    Object? user = freezed,
  }) {
    return _then(_$RefreshTokenIncludeImpl(
      select: freezed == select
          ? _value._select
          : select // ignore: cast_nullable_to_non_nullable
              as List<RefreshTokenScalarField>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInclude?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenIncludeImpl extends _RefreshTokenInclude {
  const _$RefreshTokenIncludeImpl(
      {final List<RefreshTokenScalarField>? select, this.user})
      : _select = select,
        super._();

  final List<RefreshTokenScalarField>? _select;
  @override
  List<RefreshTokenScalarField>? get select {
    final value = _select;
    if (value == null) return null;
    if (_select is EqualUnmodifiableListView) return _select;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserInclude? user;

  @override
  String toString() {
    return 'RefreshTokenInclude(select: $select, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenIncludeImpl &&
            const DeepCollectionEquality().equals(other._select, _select) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_select), user);

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenIncludeImplCopyWith<_$RefreshTokenIncludeImpl> get copyWith =>
      __$$RefreshTokenIncludeImplCopyWithImpl<_$RefreshTokenIncludeImpl>(
          this, _$identity);
}

abstract class _RefreshTokenInclude extends RefreshTokenInclude {
  const factory _RefreshTokenInclude(
      {final List<RefreshTokenScalarField>? select,
      final UserInclude? user}) = _$RefreshTokenIncludeImpl;
  const _RefreshTokenInclude._() : super._();

  @override
  List<RefreshTokenScalarField>? get select;
  @override
  UserInclude? get user;

  /// Create a copy of RefreshTokenInclude
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenIncludeImplCopyWith<_$RefreshTokenIncludeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RefreshTokenUserWriteInput {
  UserWhereUniqueInput? get connect => throw _privateConstructorUsedError;
  CreateUserInput? get create => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenUserWriteInputCopyWith<RefreshTokenUserWriteInput>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenUserWriteInputCopyWith<$Res> {
  factory $RefreshTokenUserWriteInputCopyWith(RefreshTokenUserWriteInput value,
          $Res Function(RefreshTokenUserWriteInput) then) =
      _$RefreshTokenUserWriteInputCopyWithImpl<$Res,
          RefreshTokenUserWriteInput>;
  @useResult
  $Res call({UserWhereUniqueInput? connect, CreateUserInput? create});

  $UserWhereUniqueInputCopyWith<$Res>? get connect;
  $CreateUserInputCopyWith<$Res>? get create;
}

/// @nodoc
class _$RefreshTokenUserWriteInputCopyWithImpl<$Res,
        $Val extends RefreshTokenUserWriteInput>
    implements $RefreshTokenUserWriteInputCopyWith<$Res> {
  _$RefreshTokenUserWriteInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connect = freezed,
    Object? create = freezed,
  }) {
    return _then(_value.copyWith(
      connect: freezed == connect
          ? _value.connect
          : connect // ignore: cast_nullable_to_non_nullable
              as UserWhereUniqueInput?,
      create: freezed == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as CreateUserInput?,
    ) as $Val);
  }

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserWhereUniqueInputCopyWith<$Res>? get connect {
    if (_value.connect == null) {
      return null;
    }

    return $UserWhereUniqueInputCopyWith<$Res>(_value.connect!, (value) {
      return _then(_value.copyWith(connect: value) as $Val);
    });
  }

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateUserInputCopyWith<$Res>? get create {
    if (_value.create == null) {
      return null;
    }

    return $CreateUserInputCopyWith<$Res>(_value.create!, (value) {
      return _then(_value.copyWith(create: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenUserWriteInputImplCopyWith<$Res>
    implements $RefreshTokenUserWriteInputCopyWith<$Res> {
  factory _$$RefreshTokenUserWriteInputImplCopyWith(
          _$RefreshTokenUserWriteInputImpl value,
          $Res Function(_$RefreshTokenUserWriteInputImpl) then) =
      __$$RefreshTokenUserWriteInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserWhereUniqueInput? connect, CreateUserInput? create});

  @override
  $UserWhereUniqueInputCopyWith<$Res>? get connect;
  @override
  $CreateUserInputCopyWith<$Res>? get create;
}

/// @nodoc
class __$$RefreshTokenUserWriteInputImplCopyWithImpl<$Res>
    extends _$RefreshTokenUserWriteInputCopyWithImpl<$Res,
        _$RefreshTokenUserWriteInputImpl>
    implements _$$RefreshTokenUserWriteInputImplCopyWith<$Res> {
  __$$RefreshTokenUserWriteInputImplCopyWithImpl(
      _$RefreshTokenUserWriteInputImpl _value,
      $Res Function(_$RefreshTokenUserWriteInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connect = freezed,
    Object? create = freezed,
  }) {
    return _then(_$RefreshTokenUserWriteInputImpl(
      connect: freezed == connect
          ? _value.connect
          : connect // ignore: cast_nullable_to_non_nullable
              as UserWhereUniqueInput?,
      create: freezed == create
          ? _value.create
          : create // ignore: cast_nullable_to_non_nullable
              as CreateUserInput?,
    ));
  }
}

/// @nodoc

class _$RefreshTokenUserWriteInputImpl extends _RefreshTokenUserWriteInput {
  const _$RefreshTokenUserWriteInputImpl({this.connect, this.create})
      : super._();

  @override
  final UserWhereUniqueInput? connect;
  @override
  final CreateUserInput? create;

  @override
  String toString() {
    return 'RefreshTokenUserWriteInput(connect: $connect, create: $create)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenUserWriteInputImpl &&
            (identical(other.connect, connect) || other.connect == connect) &&
            (identical(other.create, create) || other.create == create));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connect, create);

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenUserWriteInputImplCopyWith<_$RefreshTokenUserWriteInputImpl>
      get copyWith => __$$RefreshTokenUserWriteInputImplCopyWithImpl<
          _$RefreshTokenUserWriteInputImpl>(this, _$identity);
}

abstract class _RefreshTokenUserWriteInput extends RefreshTokenUserWriteInput {
  const factory _RefreshTokenUserWriteInput(
      {final UserWhereUniqueInput? connect,
      final CreateUserInput? create}) = _$RefreshTokenUserWriteInputImpl;
  const _RefreshTokenUserWriteInput._() : super._();

  @override
  UserWhereUniqueInput? get connect;
  @override
  CreateUserInput? get create;

  /// Create a copy of RefreshTokenUserWriteInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenUserWriteInputImplCopyWith<_$RefreshTokenUserWriteInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}
