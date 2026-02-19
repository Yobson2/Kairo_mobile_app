// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetCategoryModel _$BudgetCategoryModelFromJson(Map<String, dynamic> json) =>
    _BudgetCategoryModel(
      id: json['id'] as String,
      budgetId: json['budgetId'] as String,
      categoryId: json['categoryId'] as String,
      groupName: json['groupName'] as String,
      allocatedAmount: (json['allocatedAmount'] as num).toDouble(),
      allocatedPercentage: (json['allocatedPercentage'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$BudgetCategoryModelToJson(
        _BudgetCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budgetId': instance.budgetId,
      'categoryId': instance.categoryId,
      'groupName': instance.groupName,
      'allocatedAmount': instance.allocatedAmount,
      'allocatedPercentage': instance.allocatedPercentage,
      'createdAt': instance.createdAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };
