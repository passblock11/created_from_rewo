import 'package:prisma_flutter_connector/runtime_server.dart';
import '../models/item.dart';

/// Delegate for Item operations
/// Provides type-safe CRUD operations using database adapters
class ItemDelegate {
  ItemDelegate(this._executor);

  final BaseExecutor _executor;

  /// Find a single Item by unique field(s)
  Future<Item?> findUnique({
    required ItemWhereUniqueInput where,
    ItemInclude? include,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.findUnique)
        .where(_whereUniqueToJson(where));

    if (include != null) queryBuilder.include(include.toJson());

    final result = await _executor.executeQueryAsSingleMap(
      queryBuilder.build(),
    );
    return result != null ? Item.fromJson(_normalizeForJson(result)) : null;
  }

  /// Find a single Item or throw if not found
  Future<Item> findUniqueOrThrow({required ItemWhereUniqueInput where}) async {
    final result = await findUnique(where: where);
    if (result == null) {
      throw Exception('Item not found');
    }
    return result;
  }

  /// Find the first Item matching criteria
  Future<Item?> findFirst({
    ItemWhereInput? where,
    ItemOrderByInput? orderBy,
    ItemInclude? include,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.findFirst);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy != null) queryBuilder.orderBy(_orderByToJson(orderBy));
    if (include != null) queryBuilder.include(include.toJson());

    final result = await _executor.executeQueryAsSingleMap(
      queryBuilder.build(),
    );
    return result != null ? Item.fromJson(_normalizeForJson(result)) : null;
  }

  /// Find the first Item matching criteria, or throw if none
  Future<Item> findFirstOrThrow({
    ItemWhereInput? where,
    ItemOrderByInput? orderBy,
    ItemInclude? include,
  }) async {
    final result = await findFirst(
      where: where,
      orderBy: orderBy,
      include: include,
    );
    if (result == null) {
      throw Exception('Item not found');
    }
    return result;
  }

  /// Find multiple Items with optional filters
  Future<List<Item>> findMany({
    ItemWhereInput? where,
    dynamic orderBy,
    int? take,
    int? skip,
    ItemInclude? include,
    Map<String, dynamic>? includeRequired,
    List<String>? selectFields,
    bool? distinct,
    List<String>? distinctFields,
    ItemWhereUniqueInput? cursor,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.findMany);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is ItemOrderByInput)
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
        .map((json) => Item.fromJson(_normalizeForJson(json)))
        .toList();
  }

  /// Find multiple Items as projected rows (maps).
  ///
  /// Typed inputs; `Map` rows out — use for scalar projection
  /// (`select:`/`distinctOn:`), computed correlated subqueries, and
  /// include-with-select. Rows may be partial, so they are not
  /// hydrated into typed models.
  Future<List<Map<String, dynamic>>> findManyProjected({
    ItemWhereInput? where,
    dynamic orderBy,
    int? take,
    int? skip,
    ItemWhereUniqueInput? cursor,
    ItemInclude? include,
    List<ItemScalarField>? select,
    Map<String, ComputedField>? computed,
    bool? distinct,
    List<ItemScalarField>? distinctOn,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.findMany);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is ItemOrderByInput)
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

  /// Find the first Item as a projected row (map). See findManyProjected.
  Future<Map<String, dynamic>?> findFirstProjected({
    ItemWhereInput? where,
    dynamic orderBy,
    ItemInclude? include,
    List<ItemScalarField>? select,
    Map<String, ComputedField>? computed,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.findFirst);

    if (where != null) queryBuilder.where(_whereToJson(where));
    if (orderBy is Map<String, dynamic>) queryBuilder.orderBy(orderBy);
    if (orderBy is List) queryBuilder.orderBy(orderBy);
    if (orderBy is ItemOrderByInput)
      queryBuilder.orderBy(_orderByToJson(orderBy));
    if (include != null) queryBuilder.include(include.toJson());
    if (select != null && select.isNotEmpty) {
      queryBuilder.selectFields([for (final f in select) f.fieldName]);
    }
    if (computed != null) queryBuilder.computed(computed);

    return await _executor.executeQueryAsSingleMap(queryBuilder.build());
  }

  /// Create a new Item
  Future<Item> create({required CreateItemInput data}) async {
    final data0 = data.toJson();
    final query = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.create)
        .data(data0)
        .build();

    const relationFields = const <String>{};
    if (data0.keys.any(relationFields.contains)) {
      final row = await _executor.executeMutationWithRelationsReturning(query);
      if (row == null) {
        throw Exception('Failed to create Item');
      }
      return Item.fromJson(_normalizeForJson(row));
    }

    final result = await _executor.executeQueryAsSingleMap(query);
    if (result == null) {
      throw Exception('Failed to create Item');
    }
    return Item.fromJson(_normalizeForJson(result));
  }

  /// Create multiple Items
  Future<int> createMany({
    required List<CreateItemInput> data,
    bool? skipDuplicates,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.createMany)
        .data({'data': data.map((d) => d.toJson()).toList()});
    if (skipDuplicates == true) queryBuilder.skipDuplicates();

    return await _executor.executeMutation(queryBuilder.build());
  }

  /// Create multiple Items and return the created rows
  Future<List<Item>> createManyAndReturn({
    required List<CreateItemInput> data,
    bool? skipDuplicates,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.createManyAndReturn)
        .data({'data': data.map((d) => d.toJson()).toList()});
    if (skipDuplicates == true) queryBuilder.skipDuplicates();

    final results = await _executor.executeQueryAsMaps(queryBuilder.build());
    return results
        .map((json) => Item.fromJson(_normalizeForJson(json)))
        .toList();
  }

  /// Update a Item
  Future<Item> update({
    required ItemWhereUniqueInput where,
    required UpdateItemInput data,
    List<ItemScalarField>? setNull,
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
        .model('items')
        .action(QueryAction.update)
        .where(_whereUniqueToJson(where))
        .data(data0)
        .build();

    const relationFields = const <String>{};
    if (data0.keys.any(relationFields.contains)) {
      await _executor.executeMutationWithRelationsReturning(query);
    } else {
      await _executor.executeMutation(query);
    }

    // Fetch the updated record
    return await findUniqueOrThrow(where: where);
  }

  /// Create a Item, or update it if the unique key already exists
  Future<Item> upsert({
    required ItemWhereUniqueInput where,
    required CreateItemInput create,
    required UpdateItemInput update,
  }) async {
    final query = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.upsert)
        .where(_whereUniqueToJson(where))
        .data({'create': create.toJson(), 'update': update.toJson()})
        .build();

    final result = await _executor.executeQueryAsSingleMap(query);
    if (result == null) {
      throw Exception('Failed to upsert Item');
    }
    return Item.fromJson(_normalizeForJson(result));
  }

  /// Update multiple Items
  Future<int> updateMany({
    required ItemWhereInput where,
    required UpdateItemInput data,
    List<ItemScalarField>? setNull,
  }) async {
    final data0 = data.toJson();
    if (setNull != null) {
      for (final f in setNull) {
        data0[f.fieldName] = null;
      }
    }
    final query = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.updateMany)
        .where(_whereToJson(where))
        .data(data0)
        .build();

    return await _executor.executeMutation(query);
  }

  /// Delete a Item
  Future<Item> delete({required ItemWhereUniqueInput where}) async {
    // Fetch before deleting
    final existing = await findUniqueOrThrow(where: where);

    final query = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.delete)
        .where(_whereUniqueToJson(where))
        .build();

    await _executor.executeMutation(query);
    return existing;
  }

  /// Delete multiple Items
  Future<int> deleteMany({required ItemWhereInput where}) async {
    final query = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.deleteMany)
        .where(_whereToJson(where))
        .build();

    return await _executor.executeMutation(query);
  }

  /// Count Items matching criteria
  Future<int> count({ItemWhereInput? where}) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
        .action(QueryAction.count);

    if (where != null) queryBuilder.where(_whereToJson(where));

    return await _executor.executeCount(queryBuilder.build());
  }

  /// Group Items by fields with aggregations
  Future<List<Map<String, dynamic>>> groupBy({
    required List<String> by,
    ItemWhereInput? where,
    bool? count,
    Map<String, bool>? sum,
    Map<String, bool>? avg,
    Map<String, bool>? min,
    Map<String, bool>? max,
    dynamic orderBy,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
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

  /// Aggregate over Items (count/sum/avg/min/max)
  Future<Map<String, dynamic>> aggregate({
    ItemWhereInput? where,
    bool? count,
    Map<String, bool>? sum,
    Map<String, bool>? avg,
    Map<String, bool>? min,
    Map<String, bool>? max,
    List<Map<String, dynamic>>? countFiltered,
  }) async {
    final queryBuilder = JsonQueryBuilder()
        .model('items')
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
  Map<String, dynamic> _whereUniqueToJson(ItemWhereUniqueInput where) {
    return where.toJson()..removeWhere((key, value) => value == null);
  }

  /// Convert WhereInput to JSON for JsonQueryBuilder
  Map<String, dynamic> _whereToJson(ItemWhereInput where) {
    final json = where.toJson();
    final result = <String, dynamic>{};

    for (final entry in json.entries) {
      if (entry.value == null) continue;

      if (entry.key == 'AND' || entry.key == 'OR') {
        final list = entry.value as List?;
        if (list != null && list.isNotEmpty) {
          result[entry.key] = list.map((item) {
            if (item is Map) return item;
            return (item as ItemWhereInput).toJson();
          }).toList();
        }
      } else if (entry.key == 'NOT') {
        final not = entry.value;
        if (not is Map) {
          result[entry.key] = not;
        } else if (not is ItemWhereInput) {
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
  Map<String, dynamic> _orderByToJson(ItemOrderByInput orderBy) {
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
