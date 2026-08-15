// /// Generated filter types for type-safe queries
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'filters.freezed.dart';

/// Filter for String fields
@freezed
class StringFilter with _$StringFilter {
  const StringFilter._();

  const factory StringFilter({
    String? equals,
    String? not,
    @JsonKey(name: 'in') List<String>? in_,
    List<String>? notIn,
    String? contains,
    String? startsWith,
    String? endsWith,
    String? lt,
    String? lte,
    String? gt,
    String? gte,
    String? mode,
    bool? isNull,
  }) = _StringFilter;

  factory StringFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('StringFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    String? m = mode;
    Object? wrap(String? v) =>
        (v != null && m != null) ? <String, dynamic>{'value': v, 'mode': m} : v;
    return <String, dynamic>{
      if (equals != null) 'equals': equals,
      if (not != null) 'not': not,
      if (in_ != null) 'in': in_,
      if (notIn != null) 'notIn': notIn,
      if (contains != null) 'contains': wrap(contains),
      if (startsWith != null) 'startsWith': wrap(startsWith),
      if (endsWith != null) 'endsWith': wrap(endsWith),
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Int fields
@freezed
class IntFilter with _$IntFilter {
  const IntFilter._();

  const factory IntFilter({
    int? equals,
    int? not,
    @JsonKey(name: 'in') List<int>? in_,
    List<int>? notIn,
    int? lt,
    int? lte,
    int? gt,
    int? gte,
    bool? isNull,
  }) = _IntFilter;

  factory IntFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('IntFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals,
      if (not != null) 'not': not,
      if (in_ != null) 'in': in_,
      if (notIn != null) 'notIn': notIn,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Float/Decimal fields
@freezed
class FloatFilter with _$FloatFilter {
  const FloatFilter._();

  const factory FloatFilter({
    double? equals,
    double? not,
    @JsonKey(name: 'in') List<double>? in_,
    List<double>? notIn,
    double? lt,
    double? lte,
    double? gt,
    double? gte,
    bool? isNull,
  }) = _FloatFilter;

  factory FloatFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('FloatFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals,
      if (not != null) 'not': not,
      if (in_ != null) 'in': in_,
      if (notIn != null) 'notIn': notIn,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Boolean fields
@freezed
class BooleanFilter with _$BooleanFilter {
  const BooleanFilter._();

  const factory BooleanFilter({bool? equals, bool? not, bool? isNull}) =
      _BooleanFilter;

  factory BooleanFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('BooleanFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals,
      if (not != null) 'not': not,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for DateTime fields
@freezed
class DateTimeFilter with _$DateTimeFilter {
  const DateTimeFilter._();

  const factory DateTimeFilter({
    DateTime? equals,
    DateTime? not,
    @JsonKey(name: 'in') List<DateTime>? in_,
    List<DateTime>? notIn,
    DateTime? lt,
    DateTime? lte,
    DateTime? gt,
    DateTime? gte,
    bool? isNull,
  }) = _DateTimeFilter;

  factory DateTimeFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('DateTimeFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals!.toIso8601String(),
      if (not != null) 'not': not!.toIso8601String(),
      if (in_ != null) 'in': in_!.map((e) => e.toIso8601String()).toList(),
      if (notIn != null)
        'notIn': notIn!.map((e) => e.toIso8601String()).toList(),
      if (lt != null) 'lt': lt!.toIso8601String(),
      if (lte != null) 'lte': lte!.toIso8601String(),
      if (gt != null) 'gt': gt!.toIso8601String(),
      if (gte != null) 'gte': gte!.toIso8601String(),
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for String list fields
@freezed
class StringListFilter with _$StringListFilter {
  const StringListFilter._();

  const factory StringListFilter({
    String? has,
    List<String>? hasEvery,
    List<String>? hasSome,
    bool? isEmpty,
    bool? isNull,
  }) = _StringListFilter;

  factory StringListFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('StringListFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (has != null) 'has': has,
      if (hasEvery != null) 'hasEvery': hasEvery,
      if (hasSome != null) 'hasSome': hasSome,
      if (isEmpty != null) 'isEmpty': isEmpty,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Int list fields
@freezed
class IntListFilter with _$IntListFilter {
  const IntListFilter._();

  const factory IntListFilter({
    int? has,
    List<int>? hasEvery,
    List<int>? hasSome,
    bool? isEmpty,
    bool? isNull,
  }) = _IntListFilter;

  factory IntListFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('IntListFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (has != null) 'has': has,
      if (hasEvery != null) 'hasEvery': hasEvery,
      if (hasSome != null) 'hasSome': hasSome,
      if (isEmpty != null) 'isEmpty': isEmpty,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for BigInt fields
@freezed
class BigIntFilter with _$BigIntFilter {
  const BigIntFilter._();

  const factory BigIntFilter({
    BigInt? equals,
    BigInt? not,
    @JsonKey(name: 'in') List<BigInt>? in_,
    List<BigInt>? notIn,
    BigInt? lt,
    BigInt? lte,
    BigInt? gt,
    BigInt? gte,
    bool? isNull,
  }) = _BigIntFilter;

  factory BigIntFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('BigIntFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals!.toString(),
      if (not != null) 'not': not!.toString(),
      if (in_ != null) 'in': in_!.map((e) => e.toString()).toList(),
      if (notIn != null) 'notIn': notIn!.map((e) => e.toString()).toList(),
      if (lt != null) 'lt': lt!.toString(),
      if (lte != null) 'lte': lte!.toString(),
      if (gt != null) 'gt': gt!.toString(),
      if (gte != null) 'gte': gte!.toString(),
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Bytes fields
@freezed
class BytesFilter with _$BytesFilter {
  const BytesFilter._();

  const factory BytesFilter({List<int>? equals, List<int>? not, bool? isNull}) =
      _BytesFilter;

  factory BytesFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('BytesFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (equals != null) 'equals': equals,
      if (not != null) 'not': not,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Filter for Json (PostgreSQL jsonb) fields
@freezed
class JsonFilter with _$JsonFilter {
  const JsonFilter._();

  const factory JsonFilter({
    List<String>? path,
    Object? equals,
    @JsonKey(name: 'string_contains') String? stringContains,
    @JsonKey(name: 'string_starts_with') String? stringStartsWith,
    @JsonKey(name: 'string_ends_with') String? stringEndsWith,
    @JsonKey(name: 'array_contains') Object? arrayContains,
    Object? lt,
    Object? lte,
    Object? gt,
    Object? gte,
    bool? isNull,
  }) = _JsonFilter;

  factory JsonFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('JsonFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (path != null) 'path': path,
      if (equals != null) 'equals': equals,
      if (stringContains != null) 'stringContains': stringContains,
      if (stringStartsWith != null) 'stringStartsWith': stringStartsWith,
      if (stringEndsWith != null) 'stringEndsWith': stringEndsWith,
      if (arrayContains != null) 'arrayContains': arrayContains,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (isNull == true) 'isNull': true,
      if (isNull == false) 'isNotNull': true,
    };
  }
}

/// Sort order for ordering results
enum SortOrder {
  @JsonValue('asc')
  asc,
  @JsonValue('desc')
  desc,
}
