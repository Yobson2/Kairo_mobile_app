import 'package:dio/dio.dart';
import 'package:kairo/core/error/exceptions.dart';
import 'package:kairo/core/network/api_endpoints.dart';
import 'package:kairo/features/savings/data/models/savings_goal_model.dart';

/// Abstract remote datasource for savings goals.
abstract class SavingsRemoteDataSource {
  Future<List<SavingsGoalModel>> getAllSavingsGoals();
  Future<SavingsGoalModel> createSavingsGoal(SavingsGoalModel model);
  Future<SavingsGoalModel> updateSavingsGoal(SavingsGoalModel model);
  Future<void> deleteSavingsGoal(String id);
}

/// Implementation using Dio HTTP client.
class SavingsRemoteDataSourceImpl implements SavingsRemoteDataSource {
  /// Creates a [SavingsRemoteDataSourceImpl].
  const SavingsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<SavingsGoalModel>> getAllSavingsGoals() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(ApiEndpoints.savingsGoals);
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response');
      }
      return data
          .cast<Map<String, dynamic>>()
          .map(SavingsGoalModel.fromJson)
          .toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SavingsGoalModel> createSavingsGoal(SavingsGoalModel model) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.savingsGoals,
        data: model.toJson(),
      );
      return SavingsGoalModel.fromJson(response.data!);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SavingsGoalModel> updateSavingsGoal(SavingsGoalModel model) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '${ApiEndpoints.savingsGoals}/${model.id}',
        data: model.toJson(),
      );
      return SavingsGoalModel.fromJson(response.data!);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteSavingsGoal(String id) async {
    try {
      await _dio.delete<void>('${ApiEndpoints.savingsGoals}/$id');
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}

/// Mock implementation for development.
class MockSavingsRemoteDataSource implements SavingsRemoteDataSource {
  static const _delay = Duration(milliseconds: 500);

  @override
  Future<List<SavingsGoalModel>> getAllSavingsGoals() async {
    await Future<void>.delayed(_delay);
    return [];
  }

  @override
  Future<SavingsGoalModel> createSavingsGoal(SavingsGoalModel model) async {
    await Future<void>.delayed(_delay);
    return model;
  }

  @override
  Future<SavingsGoalModel> updateSavingsGoal(SavingsGoalModel model) async {
    await Future<void>.delayed(_delay);
    return model;
  }

  @override
  Future<void> deleteSavingsGoal(String id) async {
    await Future<void>.delayed(_delay);
  }
}
