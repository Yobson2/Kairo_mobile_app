import 'package:dio/dio.dart';
import 'package:kairo/core/error/exceptions.dart';
import 'package:kairo/core/network/api_endpoints.dart';
import 'package:kairo/features/budget/data/models/budget_model.dart';

/// Remote data source for budgets API calls.
abstract class BudgetsRemoteDataSource {
  /// GET all budgets from the server.
  Future<List<BudgetModel>> getAllBudgets();

  /// GET a single budget by ID.
  Future<BudgetModel> getBudgetById(String id);

  /// POST a new budget.
  Future<BudgetModel> createBudget(BudgetModel model);

  /// PUT an existing budget.
  Future<BudgetModel> updateBudget(BudgetModel model);

  /// DELETE a budget by ID.
  Future<void> deleteBudget(String id);
}

/// Implementation of [BudgetsRemoteDataSource] using [Dio].
class BudgetsRemoteDataSourceImpl implements BudgetsRemoteDataSource {
  const BudgetsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<BudgetModel>> getAllBudgets() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiEndpoints.budgets);
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return data
          .cast<Map<String, dynamic>>()
          .map(BudgetModel.fromJson)
          .toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BudgetModel> getBudgetById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiEndpoints.budgets}/$id',
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return BudgetModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BudgetModel> createBudget(BudgetModel model) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.budgets,
        data: model.toJson(),
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return BudgetModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BudgetModel> updateBudget(BudgetModel model) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '${ApiEndpoints.budgets}/${model.id}',
        data: model.toJson(),
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return BudgetModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteBudget(String id) async {
    try {
      await _dio.delete<void>('${ApiEndpoints.budgets}/$id');
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}

// coverage:ignore-file

/// Mock implementation of [BudgetsRemoteDataSource] for local testing.
class MockBudgetsRemoteDataSource implements BudgetsRemoteDataSource {
  static const _delay = Duration(milliseconds: 500);

  @override
  Future<List<BudgetModel>> getAllBudgets() async {
    await Future<void>.delayed(_delay);
    return [];
  }

  @override
  Future<BudgetModel> getBudgetById(String id) async {
    await Future<void>.delayed(_delay);
    throw const ServerException(message: 'Mock: budget not found');
  }

  @override
  Future<BudgetModel> createBudget(BudgetModel model) async {
    await Future<void>.delayed(_delay);
    return model.copyWith(serverId: 'mock-server-${model.id}');
  }

  @override
  Future<BudgetModel> updateBudget(BudgetModel model) async {
    await Future<void>.delayed(_delay);
    return model;
  }

  @override
  Future<void> deleteBudget(String id) async {
    await Future<void>.delayed(_delay);
  }
}
