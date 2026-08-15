import 'package:prisma_flutter_connector/runtime_server.dart';
import '../models/refresh_token.dart';

/// Delegate for RefreshToken operations
/// Provides type-safe CRUD operations using database adapters
class RefreshTokenDelegate {
  RefreshTokenDelegate(this._executor);

  final BaseExecutor _executor;

  /// Find a single RefreshToken by unique field(s)
  Future<RefreshToken?> findUnique({
    required RefreshTokenWhereUniqueInput where,
    RefreshTokenInclude? include,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.findUnique)
        .where(_whereUniqueToJson(where));

    if (include != null) queryBuilder.include(include.toJson());

    final result = await _executor.executeQueryAsSingleMap(
      queryBuilder.build(),
    );
    return result != null
        ? RefreshToken.fromJson(_normalizeForJson(result))
        : null;
  }

  /// Find a single RefreshToken or throw if not found
  Future<RefreshToken> findUniqueOrThrow({
    required RefreshTokenWhereUniqueInput where,
  }) async {
    final result = await findUnique(where: where);
    if (result == null) {
      throw Exception('RefreshToken not found');
    }
    return result;
  }

  /// Find the first RefreshToken matching criteria
  Future<RefreshToken?> findFirst({
    RefreshTokenWhereInput? where,
    RefreshTokenOrderByInput? orderBy,
    RefreshTokenInclude? include,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.findFirst);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy != null) queryBuilder.orderBy(_orderByToJson(orderBy));
    if (include != null) queryBuilder.include(include.toJson());

    final result = await _executor.executeQueryAsSingleMap(
      queryBuilder.build(),
    );
    return result != null
        ? RefreshToken.fromJson(_normalizeForJson(result))
        : null;
  }

  /// Find the first RefreshToken matching criteria, or throw if none
  Future<RefreshToken> findFirstOrThrow({
    RefreshTokenWhereInput? where,
    RefreshTokenOrderByInput? orderBy,
    RefreshTokenInclude? include,
  }) async {
    final result = await findFirst(
      where: where,
      orderBy: orderBy,
      include: include,
    );
    if (result == null) {
      throw Exception('RefreshToken not found');
    }
    return result;
  }

  /// Find multiple RefreshTokens with optional filters
  Future<List<RefreshToken>> findMany({
    RefreshTokenWhereInput? where,
    dynamic orderBy,
    int? take,
    int? skip,
    RefreshTokenInclude? include,
    Map<String, dynamic>? includeRequired,
    List<String>? selectFields,
    bool? distinct,
    List<String>? distinctFields,
    RefreshTokenWhereUniqueInput? cursor,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.findMany);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is RefreshTokenOrderByInput)
      queryBuilder.orderBy(_orderByToJson(orderBy));
    if (take != null) queryBuilder.take(take);
    if (skip != null) queryBuilder.skip(skip);
    if (cursor != null) queryBuilder.cursor(_whereUniqueToJson(cursor));
    if (include != null) queryBuilder.include(include.toJson());
    if (includeRequired != null) queryBuilder.includeRequired(includeRequired);
    if (selectFields != null) queryBuilder.selectFields(selectFields);
    if (distinct == true) queryBuilder.distinct(distinctFields);

    final results = await _executor.executeQueryAsMaps(queryBuilder.build());
    return results
        .map((json) => RefreshToken.fromJson(_normalizeForJson(json)))
        .toList();
  }

  /// Find multiple RefreshTokens as projected rows (maps).
  ///
  /// Typed inputs; `Map` rows out — use for scalar projection
  /// (`select:`/`distinctOn:`), computed correlated subqueries, and
  /// include-with-select. Rows may be partial, so they are not
  /// hydrated into typed models.
  Future<List<Map<String, dynamic>>> findManyProjected({
    RefreshTokenWhereInput? where,
    dynamic orderBy,
    int? take,
    int? skip,
    RefreshTokenWhereUniqueInput? cursor,
    RefreshTokenInclude? include,
    List<RefreshTokenScalarField>? select,
    Map<String, ComputedField>? computed,
    bool? distinct,
    List<RefreshTokenScalarField>? distinctOn,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.findMany);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is RefreshTokenOrderByInput)
      queryBuilder.orderBy(_orderByToJson(orderBy));
    if (take != null) queryBuilder.take(take);
    if (skip != null) queryBuilder.skip(skip);
    if (cursor != null) queryBuilder.cursor(_whereUniqueToJson(cursor));
    if (include != null) queryBuilder.include(include.toJson());
    if (select != null && select.isNotEmpty) {
      queryBuilder.selectFields([for (final f in select) f.fieldName]);
    }
    if (computed != null) queryBuilder.computed(computed);
    if (distinct == true || (distinctOn != null && distinctOn.isNotEmpty)) {
      queryBuilder.distinct(
        distinctOn == null || distinctOn.isEmpty
            ? null
            : [for (final f in distinctOn) f.fieldName],
      );
    }

    return await _executor.executeQueryAsMaps(queryBuilder.build());
  }

  /// Find the first RefreshToken as a projected row (map). See findManyProjected.
  Future<Map<String, dynamic>?> findFirstProjected({
    RefreshTokenWhereInput? where,
    dynamic orderBy,
    RefreshTokenInclude? include,
    List<RefreshTokenScalarField>? select,
    Map<String, ComputedField>? computed,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.findFirst);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is RefreshTokenOrderByInput)
      queryBuilder.orderBy(_orderByToJson(orderBy));
    if (include != null) queryBuilder.include(include.toJson());
    if (select != null && select.isNotEmpty) {
      queryBuilder.selectFields([for (final f in select) f.fieldName]);
    }
    if (computed != null) queryBuilder.computed(computed);

    return await _executor.executeQueryAsSingleMap(queryBuilder.build());
  }

  /// Create a new RefreshToken
  Future<RefreshToken> create({required CreateRefreshTokenInput data}) async {
    final data0 = data.toJson();
    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.create)
        .data(data0)
        .build();

    const relationFields = {'user'};
    if (data0.keys.any(relationFields.contains)) {
      final row = await _executor.executeMutationWithRelationsReturning(query);
      if (row == null) {
        throw Exception('Failed to create RefreshToken');
      }
      return RefreshToken.fromJson(_normalizeForJson(row));
    }

    final result = await _executor.executeQueryAsSingleMap(query);
    if (result == null) {
      throw Exception('Failed to create RefreshToken');
    }
    return RefreshToken.fromJson(_normalizeForJson(result));
  }

  /// Create multiple RefreshTokens
  Future<int> createMany({
    required List<CreateRefreshTokenInput> data,
    bool? skipDuplicates,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.createMany)
        .data({'data': data.map((d) => d.toJson()).toList()});
    if (skipDuplicates == true) queryBuilder.skipDuplicates();

    return await _executor.executeMutation(queryBuilder.build());
  }

  /// Create multiple RefreshTokens and return the created rows
  Future<List<RefreshToken>> createManyAndReturn({
    required List<CreateRefreshTokenInput> data,
    bool? skipDuplicates,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.createManyAndReturn)
        .data({'data': data.map((d) => d.toJson()).toList()});
    if (skipDuplicates == true) queryBuilder.skipDuplicates();

    final results = await _executor.executeQueryAsMaps(queryBuilder.build());
    return results
        .map((json) => RefreshToken.fromJson(_normalizeForJson(json)))
        .toList();
  }

  /// Update a RefreshToken
  Future<RefreshToken> update({
    required RefreshTokenWhereUniqueInput where,
    required UpdateRefreshTokenInput data,
    List<RefreshTokenScalarField>? setNull,
  }) async {
    final data0 = data.toJson();
    // Explicit null-clears: typed inputs drop null fields, so fields to be
    // set to NULL are listed here and injected as explicit nulls.
    if (setNull != null) {
      for (final f in setNull) {
        data0[f.fieldName] = null;
      }
    }
    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.update)
        .where(_whereUniqueToJson(where))
        .data(data0)
        .build();

    const relationFields = {'user'};
    if (data0.keys.any(relationFields.contains)) {
      await _executor.executeMutationWithRelationsReturning(query);
    } else {
      await _executor.executeMutation(query);
    }

    // Fetch the updated record
    return await findUniqueOrThrow(where: where);
  }

  /// Create a RefreshToken, or update it if the unique key already exists
  Future<RefreshToken> upsert({
    required RefreshTokenWhereUniqueInput where,
    required CreateRefreshTokenInput create,
    required UpdateRefreshTokenInput update,
  }) async {
    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.upsert)
        .where(_whereUniqueToJson(where))
        .data({'create': create.toJson(), 'update': update.toJson()})
        .build();

    final result = await _executor.executeQueryAsSingleMap(query);
    if (result == null) {
      throw Exception('Failed to upsert RefreshToken');
    }
    return RefreshToken.fromJson(_normalizeForJson(result));
  }

  /// Update multiple RefreshTokens
  Future<int> updateMany({
    required RefreshTokenWhereInput where,
    required UpdateRefreshTokenInput data,
    List<RefreshTokenScalarField>? setNull,
  }) async {
    final data0 = data.toJson();
    if (setNull != null) {
      for (final f in setNull) {
        data0[f.fieldName] = null;
      }
    }
    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.updateMany)
        .where(_whereToJson(where))
        .data(data0)
        .build();

    return await _executor.executeMutation(query);
  }

  /// Delete a RefreshToken
  Future<RefreshToken> delete({
    required RefreshTokenWhereUniqueInput where,
  }) async {
    // Fetch before deleting
    final existing = await findUniqueOrThrow(where: where);

    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.delete)
        .where(_whereUniqueToJson(where))
        .build();

    await _executor.executeMutation(query);
    return existing;
  }

  /// Delete multiple RefreshTokens
  Future<int> deleteMany({required RefreshTokenWhereInput where}) async {
    final query = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.deleteMany)
        .where(_whereToJson(where))
        .build();

    return await _executor.executeMutation(query);
  }

  /// Count RefreshTokens matching criteria
  Future<int> count({RefreshTokenWhereInput? where}) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.count);

    if (where != null) queryBuilder.where(_whereToJson(where));

    return await _executor.executeCount(queryBuilder.build());
  }

  /// Group RefreshTokens by fields with aggregations
  Future<List<Map<String, dynamic>>> groupBy({
    required List<String> by,
    RefreshTokenWhereInput? where,
    bool? count,
    Map<String, bool>? sum,
    Map<String, bool>? avg,
    Map<String, bool>? min,
    Map<String, bool>? max,
    dynamic orderBy,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.groupBy)
        .groupByFields(by);

    if (where != null) queryBuilder.where(_whereToJson(where));

    final agg = <String, dynamic>{};
    if (count == true) agg['_count'] = true;
    if (sum != null) agg['_sum'] = sum;
    if (avg != null) agg['_avg'] = avg;
    if (min != null) agg['_min'] = min;
    if (max != null) agg['_max'] = max;
    if (agg.isNotEmpty) queryBuilder.aggregation(agg);

    if (orderBy != null) queryBuilder.orderBy(orderBy);

    return await _executor.executeQueryAsMaps(queryBuilder.build());
  }

  /// Aggregate over RefreshTokens (count/sum/avg/min/max)
  Future<Map<String, dynamic>> aggregate({
    RefreshTokenWhereInput? where,
    bool? count,
    Map<String, bool>? sum,
    Map<String, bool>? avg,
    Map<String, bool>? min,
    Map<String, bool>? max,
    List<Map<String, dynamic>>? countFiltered,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('refresh_tokens')
        .action(QueryAction.aggregate);

    if (where != null) queryBuilder.where(_whereToJson(where));

    final agg = <String, dynamic>{};
    if (count == true) agg['_count'] = true;
    if (sum != null) agg['_sum'] = sum;
    if (avg != null) agg['_avg'] = avg;
    if (min != null) agg['_min'] = min;
    if (max != null) agg['_max'] = max;
    if (countFiltered != null) agg['_countFiltered'] = countFiltered;
    queryBuilder.aggregation(agg);

    final result = await _executor.executeQueryAsSingleMap(
      queryBuilder.build(),
    );
    return result ?? <String, dynamic>{};
  }

  /// Normalize map values for Freezed fromJson (DateTime -> String, etc.)
  Map<String, dynamic> _normalizeForJson(Map<String, dynamic> map) {
    return map.map((key, value) {
      if (value is DateTime) return MapEntry(key, value.toIso8601String());
      if (value is Map<String, dynamic>)
        return MapEntry(key, _normalizeForJson(value));
      if (value is List) {
        return MapEntry(
          key,
          value.map((e) {
            if (e is Map<String, dynamic>) return _normalizeForJson(e);
            if (e is DateTime) return e.toIso8601String();
            return e;
          }).toList(),
        );
      }
      return MapEntry(key, value);
    });
  }

  /// Convert WhereUniqueInput to JSON for JsonQueryBuilder
  Map<String, dynamic> _whereUniqueToJson(RefreshTokenWhereUniqueInput where) {
    return where.toJson()..removeWhere((key, value) => value == null);
  }

  /// Convert WhereInput to JSON for JsonQueryBuilder
  Map<String, dynamic> _whereToJson(RefreshTokenWhereInput where) {
    final json = where.toJson();
    final result = <String, dynamic>{};

    for (final entry in json.entries) {
      if (entry.value == null) continue;

      if (entry.key == 'AND' || entry.key == 'OR') {
        final list = entry.value as List?;
        if (list != null && list.isNotEmpty) {
          result[entry.key] = list.map((item) {
            if (item is Map) return item;
            return (item as RefreshTokenWhereInput).toJson();
          }).toList();
        }
      } else if (entry.key == 'NOT') {
        final not = entry.value;
        if (not is Map) {
          result[entry.key] = not;
        } else if (not is RefreshTokenWhereInput) {
          result[entry.key] = not.toJson();
        }
      } else {
        if (entry.value is Map) {
          final filterMap = entry.value as Map;
          final cleanedFilter = <String, dynamic>{};
          for (final filterEntry in filterMap.entries) {
            if (filterEntry.value != null) {
              cleanedFilter[filterEntry.key.toString()] = filterEntry.value;
            }
          }
          if (cleanedFilter.isNotEmpty) {
            result[entry.key] = cleanedFilter;
          }
        } else {
          try {
            final serialized = (entry.value as dynamic).toJson();
            if (serialized is Map) {
              final cleaned = <String, dynamic>{};
              for (final e in serialized.entries) {
                if (e.value != null) cleaned[e.key.toString()] = e.value;
              }
              if (cleaned.isNotEmpty) result[entry.key] = cleaned;
            } else {
              result[entry.key] = entry.value;
            }
          } catch (_) {
            result[entry.key] = entry.value;
          }
        }
      }
    }

    return result;
  }

  /// Convert OrderByInput to JSON for JsonQueryBuilder
  Map<String, dynamic> _orderByToJson(RefreshTokenOrderByInput orderBy) {
    final json = orderBy.toJson();
    final result = <String, dynamic>{};

    for (final entry in json.entries) {
      if (entry.value != null) {
        result[entry.key] = entry.value.toString().split('.').last;
      }
    }

    return result;
  }
}
