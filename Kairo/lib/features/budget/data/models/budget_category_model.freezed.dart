// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BudgetCategoryModel {
  String get id;
  String get budgetId;
  String get categoryId;
  String get groupName;
  double get allocatedAmount;
  double? get allocatedPercentage;
  DateTime get createdAt;
  bool get isSynced;

  /// Create a copy of BudgetCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BudgetCategoryModelCopyWith<BudgetCategoryModel> get copyWith =>
      _$BudgetCategoryModelCopyWithImpl<BudgetCategoryModel>(
          this as BudgetCategoryModel, _$identity);

  /// Serializes this BudgetCategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BudgetCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount) &&
            (identical(other.allocatedPercentage, allocatedPercentage) ||
                other.allocatedPercentage == allocatedPercentage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, budgetId, categoryId,
      groupName, allocatedAmount, allocatedPercentage, createdAt, isSynced);

  @override
  String toString() {
    return 'BudgetCategoryModel(id: $id, budgetId: $budgetId, categoryId: $categoryId, groupName: $groupName, allocatedAmount: $allocatedAmount, allocatedPercentage: $allocatedPercentage, createdAt: $createdAt, isSynced: $isSynced)';
  }
}

/// @nodoc
abstract mixin class $BudgetCategoryModelCopyWith<$Res> {
  factory $BudgetCategoryModelCopyWith(
          BudgetCategoryModel value, $Res Function(BudgetCategoryModel) _then) =
      _$BudgetCategoryModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String budgetId,
      String categoryId,
      String groupName,
      double allocatedAmount,
      double? allocatedPercentage,
      DateTime createdAt,
      bool isSynced});
}

/// @nodoc
class _$BudgetCategoryModelCopyWithImpl<$Res>
    implements $BudgetCategoryModelCopyWith<$Res> {
  _$BudgetCategoryModelCopyWithImpl(this._self, this._then);

  final BudgetCategoryModel _self;
  final $Res Function(BudgetCategoryModel) _then;

  /// Create a copy of BudgetCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? budgetId = null,
    Object? categoryId = null,
    Object? groupName = null,
    Object? allocatedAmount = null,
    Object? allocatedPercentage = freezed,
    Object? createdAt = null,
    Object? isSynced = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      budgetId: null == budgetId
          ? _self.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      allocatedPercentage: freezed == allocatedPercentage
          ? _self.allocatedPercentage
          : allocatedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSynced: null == isSynced
          ? _self.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BudgetCategoryModel extends BudgetCategoryModel {
  const _BudgetCategoryModel(
      {required this.id,
      required this.budgetId,
      required this.categoryId,
      required this.groupName,
      required this.allocatedAmount,
      this.allocatedPercentage,
      required this.createdAt,
      this.isSynced = false})
      : super._();
  factory _BudgetCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetCategoryModelFromJson(json);

  @override
  final String id;
  @override
  final String budgetId;
  @override
  final String categoryId;
  @override
  final String groupName;
  @override
  final double allocatedAmount;
  @override
  final double? allocatedPercentage;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isSynced;

  /// Create a copy of BudgetCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BudgetCategoryModelCopyWith<_BudgetCategoryModel> get copyWith =>
      __$BudgetCategoryModelCopyWithImpl<_BudgetCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BudgetCategoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BudgetCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.budgetId, budgetId) ||
                other.budgetId == budgetId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount) &&
            (identical(other.allocatedPercentage, allocatedPercentage) ||
                other.allocatedPercentage == allocatedPercentage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, budgetId, categoryId,
      groupName, allocatedAmount, allocatedPercentage, createdAt, isSynced);

  @override
  String toString() {
    return 'BudgetCategoryModel(id: $id, budgetId: $budgetId, categoryId: $categoryId, groupName: $groupName, allocatedAmount: $allocatedAmount, allocatedPercentage: $allocatedPercentage, createdAt: $createdAt, isSynced: $isSynced)';
  }
}

/// @nodoc
abstract mixin class _$BudgetCategoryModelCopyWith<$Res>
    implements $BudgetCategoryModelCopyWith<$Res> {
  factory _$BudgetCategoryModelCopyWith(_BudgetCategoryModel value,
          $Res Function(_BudgetCategoryModel) _then) =
      __$BudgetCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String budgetId,
      String categoryId,
      String groupName,
      double allocatedAmount,
      double? allocatedPercentage,
      DateTime createdAt,
      bool isSynced});
}

/// @nodoc
class __$BudgetCategoryModelCopyWithImpl<$Res>
    implements _$BudgetCategoryModelCopyWith<$Res> {
  __$BudgetCategoryModelCopyWithImpl(this._self, this._then);

  final _BudgetCategoryModel _self;
  final $Res Function(_BudgetCategoryModel) _then;

  /// Create a copy of BudgetCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? budgetId = null,
    Object? categoryId = null,
    Object? groupName = null,
    Object? allocatedAmount = null,
    Object? allocatedPercentage = freezed,
    Object? createdAt = null,
    Object? isSynced = null,
  }) {
    return _then(_BudgetCategoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      budgetId: null == budgetId
          ? _self.budgetId
          : budgetId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _self.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      allocatedPercentage: freezed == allocatedPercentage
          ? _self.allocatedPercentage
          : allocatedPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSynced: null == isSynced
          ? _self.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
