// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../filters.dart';
import 'refresh_token.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required String email,
    @JsonKey(name: 'password_hash') required String passwordHash,
    String? name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<RefreshToken>? refreshTokens,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      passwordHash: json['password_hash'] as String,
      name: (json['name'] as String?),
      createdAt: json['created_at'] is DateTime
          ? json['created_at'] as DateTime
          : DateTime.parse(json['created_at'] as String),
      refreshTokens:
          (json['refreshTokens'] as List?)
              ?.map((e) => RefreshToken.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password_hash': passwordHash,
      'name': name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

/// Input for creating a new User
@freezed
class CreateUserInput with _$CreateUserInput {
  const CreateUserInput._();

  const factory CreateUserInput({
    required String email,
    required String passwordHash,
    String? name,
    UserRefreshTokensWriteInput? refreshTokens,
  }) = _CreateUserInput;

  factory CreateUserInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('CreateUserInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'passwordHash': passwordHash,
      if (name != null) 'name': name,
      if (refreshTokens != null) 'refreshTokens': refreshTokens!.toJson(),
    };
  }
}

/// Input for updating an existing User
@freezed
class UpdateUserInput with _$UpdateUserInput {
  const UpdateUserInput._();

  const factory UpdateUserInput({
    String? email,
    String? passwordHash,
    String? name,
    UserRefreshTokensWriteInput? refreshTokens,
  }) = _UpdateUserInput;

  factory UpdateUserInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UpdateUserInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (email != null) 'email': email,
      if (passwordHash != null) 'passwordHash': passwordHash,
      if (name != null) 'name': name,
      if (refreshTokens != null) 'refreshTokens': refreshTokens!.toJson(),
    };
  }
}

@freezed
class UserWhereUniqueInput with _$UserWhereUniqueInput {
  const UserWhereUniqueInput._();

  const factory UserWhereUniqueInput({String? id, String? email}) =
      _UserWhereUniqueInput;

  factory UserWhereUniqueInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserWhereUniqueInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id,
      if (email != null) 'email': email,
    };
  }
}

@freezed
class UserWhereInput with _$UserWhereInput {
  const UserWhereInput._();

  const factory UserWhereInput({
    StringFilter? id,
    StringFilter? email,
    StringFilter? passwordHash,
    StringFilter? name,
    DateTimeFilter? createdAt,
    RefreshTokenListRelationFilter? refreshTokens,
    List<UserWhereInput>? AND,
    List<UserWhereInput>? OR,
    UserWhereInput? NOT,
  }) = _UserWhereInput;

  factory UserWhereInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserWhereInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.toJson(),
      if (email != null) 'email': email!.toJson(),
      if (passwordHash != null) 'passwordHash': passwordHash!.toJson(),
      if (name != null) 'name': name!.toJson(),
      if (createdAt != null) 'createdAt': createdAt!.toJson(),
      if (refreshTokens != null) 'refreshTokens': refreshTokens!.toJson(),
      if (AND != null) 'AND': AND!.map((e) => e.toJson()).toList(),
      if (OR != null) 'OR': OR!.map((e) => e.toJson()).toList(),
      if (NOT != null) 'NOT': NOT!.toJson(),
    };
  }
}

@freezed
class UserListRelationFilter with _$UserListRelationFilter {
  const UserListRelationFilter._();

  const factory UserListRelationFilter({
    UserWhereInput? some,
    UserWhereInput? every,
    UserWhereInput? none,
  }) = _UserListRelationFilter;

  factory UserListRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserListRelationFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (some != null) 'some': some!.toJson(),
      if (every != null) 'every': every!.toJson(),
      if (none != null) 'none': none!.toJson(),
    };
  }
}

@freezed
class UserRelationFilter with _$UserRelationFilter {
  const UserRelationFilter._();

  const factory UserRelationFilter({
    @JsonKey(name: 'is') UserWhereInput? is_,
    UserWhereInput? isNot,
  }) = _UserRelationFilter;

  factory UserRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserRelationFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (is_ != null) 'is': is_!.toJson(),
      if (isNot != null) 'isNot': isNot!.toJson(),
    };
  }
}

@freezed
class UserOrderByInput with _$UserOrderByInput {
  const UserOrderByInput._();

  const factory UserOrderByInput({
    SortOrder? id,
    SortOrder? email,
    SortOrder? passwordHash,
    SortOrder? name,
    SortOrder? createdAt,
  }) = _UserOrderByInput;

  factory UserOrderByInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserOrderByInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.name,
      if (email != null) 'email': email!.name,
      if (passwordHash != null) 'passwordHash': passwordHash!.name,
      if (name != null) 'name': name!.name,
      if (createdAt != null) 'createdAt': createdAt!.name,
    };
  }
}

/// Scalar fields of User for typed projection.
enum UserScalarField {
  id('id'),
  email('email'),
  passwordHash('passwordHash'),
  name('name'),
  createdAt('createdAt');

  const UserScalarField(this.fieldName);

  /// The Dart field name (the compiler resolves @map columns via the registry).
  final String fieldName;
}

/// Typed include for User relations
@freezed
class UserInclude with _$UserInclude {
  const UserInclude._();

  const factory UserInclude({
    List<UserScalarField>? select,
    RefreshTokenInclude? refreshTokens,
  }) = _UserInclude;

  factory UserInclude.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserInclude.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (refreshTokens != null) {
      final n = refreshTokens!.toJson();
      final s = refreshTokens!.selectMap();
      map['refreshTokens'] = (n.isEmpty && s == null)
          ? true
          : <String, dynamic>{
              if (n.isNotEmpty) 'include': n,
              if (s != null) 'select': s,
            };
    }
    return map;
  }

  /// Scalar projection for this include when nested under a parent include; null = all fields.
  Map<String, dynamic>? selectMap() {
    if (select == null || select!.isEmpty) return null;
    return <String, dynamic>{for (final f in select!) f.fieldName: true};
  }
}

/// Nested write for User.refreshTokens
@freezed
class UserRefreshTokensWriteInput with _$UserRefreshTokensWriteInput {
  const UserRefreshTokensWriteInput._();

  const factory UserRefreshTokensWriteInput({
    List<RefreshTokenWhereUniqueInput>? connect,
    List<RefreshTokenWhereUniqueInput>? disconnect,
    List<RefreshTokenWhereUniqueInput>? set,
    List<CreateRefreshTokenInput>? create,
  }) = _UserRefreshTokensWriteInput;

  factory UserRefreshTokensWriteInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UserRefreshTokensWriteInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (connect != null) 'connect': connect!.map((e) => e.toJson()).toList(),
      if (disconnect != null)
        'disconnect': disconnect!.map((e) => e.toJson()).toList(),
      if (set != null) 'set': set!.map((e) => e.toJson()).toList(),
      if (create != null) 'create': create!.map((e) => e.toJson()).toList(),
    };
  }
}
