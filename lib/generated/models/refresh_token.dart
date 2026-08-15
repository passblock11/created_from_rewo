// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../filters.dart';
import 'user.dart';
part 'refresh_token.freezed.dart';

@freezed
class RefreshToken with _$RefreshToken {
  const RefreshToken._();

  const factory RefreshToken({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(includeFromJson: false, includeToJson: false) User? user,
    @JsonKey(name: 'token_hash') required String tokenHash,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
    @JsonKey(name: 'revoked_at') DateTime? revokedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) {
    return RefreshToken(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      tokenHash: json['token_hash'] as String,
      expiresAt: json['expires_at'] is DateTime
          ? json['expires_at'] as DateTime
          : DateTime.parse(json['expires_at'] as String),
      revokedAt: json['revoked_at'] != null
          ? (json['revoked_at'] is DateTime
                ? json['revoked_at'] as DateTime
                : DateTime.parse(json['revoked_at'] as String))
          : null,
      createdAt: json['created_at'] is DateTime
          ? json['created_at'] as DateTime
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'token_hash': tokenHash,
      'expires_at': expiresAt.toIso8601String(),
      'revoked_at': revokedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}

/// Input for creating a new RefreshToken
@freezed
class CreateRefreshTokenInput with _$CreateRefreshTokenInput {
  const CreateRefreshTokenInput._();

  const factory CreateRefreshTokenInput({
    required String userId,
    required String tokenHash,
    required DateTime expiresAt,
    DateTime? revokedAt,
    RefreshTokenUserWriteInput? user,
  }) = _CreateRefreshTokenInput;

  factory CreateRefreshTokenInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('CreateRefreshTokenInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'tokenHash': tokenHash,
      'expiresAt': expiresAt.toIso8601String(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toIso8601String(),
      if (user != null) 'user': user!.toJson(),
    };
  }
}

/// Input for updating an existing RefreshToken
@freezed
class UpdateRefreshTokenInput with _$UpdateRefreshTokenInput {
  const UpdateRefreshTokenInput._();

  const factory UpdateRefreshTokenInput({
    String? userId,
    String? tokenHash,
    DateTime? expiresAt,
    DateTime? revokedAt,
    RefreshTokenUserWriteInput? user,
  }) = _UpdateRefreshTokenInput;

  factory UpdateRefreshTokenInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UpdateRefreshTokenInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (userId != null) 'userId': userId,
      if (tokenHash != null) 'tokenHash': tokenHash,
      if (expiresAt != null) 'expiresAt': expiresAt?.toIso8601String(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toIso8601String(),
      if (user != null) 'user': user!.toJson(),
    };
  }
}

@freezed
class RefreshTokenWhereUniqueInput with _$RefreshTokenWhereUniqueInput {
  const RefreshTokenWhereUniqueInput._();

  const factory RefreshTokenWhereUniqueInput({String? id}) =
      _RefreshTokenWhereUniqueInput;

  factory RefreshTokenWhereUniqueInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
      'RefreshTokenWhereUniqueInput.fromJson not needed',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{if (id != null) 'id': id};
  }
}

@freezed
class RefreshTokenWhereInput with _$RefreshTokenWhereInput {
  const RefreshTokenWhereInput._();

  const factory RefreshTokenWhereInput({
    StringFilter? id,
    StringFilter? userId,
    UserRelationFilter? user,
    StringFilter? tokenHash,
    DateTimeFilter? expiresAt,
    DateTimeFilter? revokedAt,
    DateTimeFilter? createdAt,
    List<RefreshTokenWhereInput>? AND,
    List<RefreshTokenWhereInput>? OR,
    RefreshTokenWhereInput? NOT,
  }) = _RefreshTokenWhereInput;

  factory RefreshTokenWhereInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('RefreshTokenWhereInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.toJson(),
      if (userId != null) 'userId': userId!.toJson(),
      if (user != null) 'user': user!.toJson(),
      if (tokenHash != null) 'tokenHash': tokenHash!.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt!.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt!.toJson(),
      if (createdAt != null) 'createdAt': createdAt!.toJson(),
      if (AND != null) 'AND': AND!.map((e) => e.toJson()).toList(),
      if (OR != null) 'OR': OR!.map((e) => e.toJson()).toList(),
      if (NOT != null) 'NOT': NOT!.toJson(),
    };
  }
}

@freezed
class RefreshTokenListRelationFilter with _$RefreshTokenListRelationFilter {
  const RefreshTokenListRelationFilter._();

  const factory RefreshTokenListRelationFilter({
    RefreshTokenWhereInput? some,
    RefreshTokenWhereInput? every,
    RefreshTokenWhereInput? none,
  }) = _RefreshTokenListRelationFilter;

  factory RefreshTokenListRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
      'RefreshTokenListRelationFilter.fromJson not needed',
    );
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
class RefreshTokenRelationFilter with _$RefreshTokenRelationFilter {
  const RefreshTokenRelationFilter._();

  const factory RefreshTokenRelationFilter({
    @JsonKey(name: 'is') RefreshTokenWhereInput? is_,
    RefreshTokenWhereInput? isNot,
  }) = _RefreshTokenRelationFilter;

  factory RefreshTokenRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('RefreshTokenRelationFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (is_ != null) 'is': is_!.toJson(),
      if (isNot != null) 'isNot': isNot!.toJson(),
    };
  }
}

@freezed
class RefreshTokenOrderByInput with _$RefreshTokenOrderByInput {
  const RefreshTokenOrderByInput._();

  const factory RefreshTokenOrderByInput({
    SortOrder? id,
    SortOrder? userId,
    SortOrder? tokenHash,
    SortOrder? expiresAt,
    SortOrder? revokedAt,
    SortOrder? createdAt,
  }) = _RefreshTokenOrderByInput;

  factory RefreshTokenOrderByInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('RefreshTokenOrderByInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.name,
      if (userId != null) 'userId': userId!.name,
      if (tokenHash != null) 'tokenHash': tokenHash!.name,
      if (expiresAt != null) 'expiresAt': expiresAt!.name,
      if (revokedAt != null) 'revokedAt': revokedAt!.name,
      if (createdAt != null) 'createdAt': createdAt!.name,
    };
  }
}

/// Scalar fields of RefreshToken for typed projection.
enum RefreshTokenScalarField {
  id('id'),
  userId('userId'),
  tokenHash('tokenHash'),
  expiresAt('expiresAt'),
  revokedAt('revokedAt'),
  createdAt('createdAt');

  const RefreshTokenScalarField(this.fieldName);

  /// The Dart field name (the compiler resolves @map columns via the registry).
  final String fieldName;
}

/// Typed include for RefreshToken relations
@freezed
class RefreshTokenInclude with _$RefreshTokenInclude {
  const RefreshTokenInclude._();

  const factory RefreshTokenInclude({
    List<RefreshTokenScalarField>? select,
    UserInclude? user,
  }) = _RefreshTokenInclude;

  factory RefreshTokenInclude.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('RefreshTokenInclude.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      final n = user!.toJson();
      final s = user!.selectMap();
      map['user'] = (n.isEmpty && s == null)
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

/// Nested write for RefreshToken.user
@freezed
class RefreshTokenUserWriteInput with _$RefreshTokenUserWriteInput {
  const RefreshTokenUserWriteInput._();

  const factory RefreshTokenUserWriteInput({
    UserWhereUniqueInput? connect,
    CreateUserInput? create,
  }) = _RefreshTokenUserWriteInput;

  factory RefreshTokenUserWriteInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('RefreshTokenUserWriteInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (connect != null) 'connect': connect!.toJson(),
      if (create != null) 'create': create!.toJson(),
    };
  }
}
