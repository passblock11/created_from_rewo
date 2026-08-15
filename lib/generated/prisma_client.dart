// /// Generated Prisma Client for Dart/Flutter
// ///
// /// This client provides type-safe database access using adapters.
// /// No GraphQL backend required — connects directly to your database!

import 'package:prisma_flutter_connector/runtime_server.dart';
import 'delegates/user_delegate.dart';
import 'delegates/refresh_token_delegate.dart';
import 'delegates/item_delegate.dart';

/// Main Prisma client for database operations
///
/// Provides access to all models through type-safe delegate classes.
class PrismaClient {
  /// Create a new PrismaClient with a database adapter
  PrismaClient({required this.adapter})
    : _executor = QueryExecutor(adapter: adapter) {
    user = UserDelegate(_executor);
    refreshToken = RefreshTokenDelegate(_executor);
    item = ItemDelegate(_executor);
  }

  PrismaClient._transaction(BaseExecutor executor)
    : adapter = executor.adapter,
      _executor = executor {
    user = UserDelegate(_executor);
    refreshToken = RefreshTokenDelegate(_executor);
    item = ItemDelegate(_executor);
  }

  /// The database adapter (PostgreSQL, Supabase, SQLite, etc.)
  final SqlDriverAdapter adapter;

  /// The query executor
  final BaseExecutor _executor;

  /// Delegate for User operations
  late final UserDelegate user;

  /// Delegate for RefreshToken operations
  late final RefreshTokenDelegate refreshToken;

  /// Delegate for Item operations
  late final ItemDelegate item;

  /// Execute multiple operations in a transaction
  ///
  /// All operations succeed or all rollback on error.
  Future<T> $transaction<T>(
    Future<T> Function(PrismaClient) callback, {
    IsolationLevel? isolationLevel,
  }) async {
    return await _executor.runTransaction((txExecutor) async {
      final txClient = PrismaClient._transaction(txExecutor);
      return await callback(txClient);
    }, isolationLevel: isolationLevel);
  }

  /// Close the database connection
  Future<void> $disconnect() async {
    await _executor.dispose();
  }
}

/// Helper class for filter operators
///
/// Use these when building WHERE clauses.
class Where {
  /// Equals
  static Map<String, dynamic> equals(dynamic value) {
    return FilterOperators.equals(value);
  }

  /// Not equals
  static Map<String, dynamic> not(dynamic value) {
    return FilterOperators.not(value);
  }

  /// In list
  static Map<String, dynamic> in_(List<dynamic> value) {
    return FilterOperators.in_(value);
  }

  /// Not in list
  static Map<String, dynamic> notIn(List<dynamic> value) {
    return FilterOperators.notIn(value);
  }

  /// Less than
  static Map<String, dynamic> lt(dynamic value) {
    return FilterOperators.lt(value);
  }

  /// Less than or equal
  static Map<String, dynamic> lte(dynamic value) {
    return FilterOperators.lte(value);
  }

  /// Greater than
  static Map<String, dynamic> gt(dynamic value) {
    return FilterOperators.gt(value);
  }

  /// Greater than or equal
  static Map<String, dynamic> gte(dynamic value) {
    return FilterOperators.gte(value);
  }

  /// Contains (string)
  static Map<String, dynamic> contains(String value) {
    return FilterOperators.contains(value);
  }

  /// Starts with
  static Map<String, dynamic> startsWith(String value) {
    return FilterOperators.startsWith(value);
  }

  /// Ends with
  static Map<String, dynamic> endsWith(String value) {
    return FilterOperators.endsWith(value);
  }

  /// AND conditions
  static Map<String, dynamic> and(List<Map<String, dynamic>> conditions) {
    return FilterOperators.and(conditions);
  }

  /// OR conditions
  static Map<String, dynamic> or(List<Map<String, dynamic>> conditions) {
    return FilterOperators.or(conditions);
  }

  /// NOT condition
  static Map<String, dynamic> none(Map<String, dynamic> condition) {
    return FilterOperators.none(condition);
  }
}
