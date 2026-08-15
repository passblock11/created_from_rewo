// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../filters.dart';
part 'item.freezed.dart';

@freezed
class Item with _$Item {
  const Item._();

  const factory Item({
    required String id,
    required String title,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: json['created_at'] is DateTime
          ? json['created_at'] as DateTime
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

/// Input for creating a new Item
@freezed
class CreateItemInput with _$CreateItemInput {
  const CreateItemInput._();

  const factory CreateItemInput({required String title}) = _CreateItemInput;

  factory CreateItemInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('CreateItemInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'title': title};
  }
}

/// Input for updating an existing Item
@freezed
class UpdateItemInput with _$UpdateItemInput {
  const UpdateItemInput._();

  const factory UpdateItemInput({String? title}) = _UpdateItemInput;

  factory UpdateItemInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('UpdateItemInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{if (title != null) 'title': title};
  }
}

@freezed
class ItemWhereUniqueInput with _$ItemWhereUniqueInput {
  const ItemWhereUniqueInput._();

  const factory ItemWhereUniqueInput({String? id}) = _ItemWhereUniqueInput;

  factory ItemWhereUniqueInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemWhereUniqueInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{if (id != null) 'id': id};
  }
}

@freezed
class ItemWhereInput with _$ItemWhereInput {
  const ItemWhereInput._();

  const factory ItemWhereInput({
    StringFilter? id,
    StringFilter? title,
    DateTimeFilter? createdAt,
    List<ItemWhereInput>? AND,
    List<ItemWhereInput>? OR,
    ItemWhereInput? NOT,
  }) = _ItemWhereInput;

  factory ItemWhereInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemWhereInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.toJson(),
      if (title != null) 'title': title!.toJson(),
      if (createdAt != null) 'createdAt': createdAt!.toJson(),
      if (AND != null) 'AND': AND!.map((e) => e.toJson()).toList(),
      if (OR != null) 'OR': OR!.map((e) => e.toJson()).toList(),
      if (NOT != null) 'NOT': NOT!.toJson(),
    };
  }
}

@freezed
class ItemListRelationFilter with _$ItemListRelationFilter {
  const ItemListRelationFilter._();

  const factory ItemListRelationFilter({
    ItemWhereInput? some,
    ItemWhereInput? every,
    ItemWhereInput? none,
  }) = _ItemListRelationFilter;

  factory ItemListRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemListRelationFilter.fromJson not needed');
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
class ItemRelationFilter with _$ItemRelationFilter {
  const ItemRelationFilter._();

  const factory ItemRelationFilter({
    @JsonKey(name: 'is') ItemWhereInput? is_,
    ItemWhereInput? isNot,
  }) = _ItemRelationFilter;

  factory ItemRelationFilter.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemRelationFilter.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (is_ != null) 'is': is_!.toJson(),
      if (isNot != null) 'isNot': isNot!.toJson(),
    };
  }
}

@freezed
class ItemOrderByInput with _$ItemOrderByInput {
  const ItemOrderByInput._();

  const factory ItemOrderByInput({
    SortOrder? id,
    SortOrder? title,
    SortOrder? createdAt,
  }) = _ItemOrderByInput;

  factory ItemOrderByInput.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemOrderByInput.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      if (id != null) 'id': id!.name,
      if (title != null) 'title': title!.name,
      if (createdAt != null) 'createdAt': createdAt!.name,
    };
  }
}

/// Scalar fields of Item for typed projection.
enum ItemScalarField {
  id('id'),
  title('title'),
  createdAt('createdAt');

  const ItemScalarField(this.fieldName);

  /// The Dart field name (the compiler resolves @map columns via the registry).
  final String fieldName;
}

/// Typed include for Item relations
@freezed
class ItemInclude with _$ItemInclude {
  const ItemInclude._();

  const factory ItemInclude({List<ItemScalarField>? select}) = _ItemInclude;

  factory ItemInclude.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('ItemInclude.fromJson not needed');
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

  /// Scalar projection for this include when nested under a parent include; null = all fields.
  Map<String, dynamic>? selectMap() {
    if (select == null || select!.isEmpty) return null;
    return <String, dynamic>{for (final f in select!) f.fieldName: true};
  }
}
