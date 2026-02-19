import 'package:dio/dio.dart';
import 'package:kairo/core/error/exceptions.dart';
import 'package:kairo/core/network/api_endpoints.dart';
import 'package:kairo/features/transactions/data/models/transaction_model.dart';

/// Remote data source for transactions API calls.
abstract class TransactionsRemoteDataSource {
  /// GET: Fetches all transactions from the server.
  Future<List<TransactionModel>> getAllTransactions();

  /// GET: Fetches a single transaction by ID.
  Future<TransactionModel> getTransactionById(String id);

  /// POST: Creates a new transaction on the server.
  /// Returns the created model with server-assigned fields.
  Future<TransactionModel> createTransaction(TransactionModel model);

  /// PUT: Updates an existing transaction on the server.
  Future<TransactionModel> updateTransaction(TransactionModel model);

  /// DELETE: Deletes a transaction on the server.
  Future<void> deleteTransaction(String id);
}

/// Implementation of [TransactionsRemoteDataSource] using [Dio].
class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  /// Creates a [TransactionsRemoteDataSourceImpl].
  const TransactionsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiEndpoints.transactions,
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return data
          .cast<Map<String, dynamic>>()
          .map(TransactionModel.fromJson)
          .toList();
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiEndpoints.transactions}/$id',
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return TransactionModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TransactionModel> createTransaction(TransactionModel model) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.transactions,
        data: model.toJson(),
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return TransactionModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TransactionModel> updateTransaction(TransactionModel model) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        '${ApiEndpoints.transactions}/${model.id}',
        data: model.toJson(),
      );
      final data = response.data;
      if (data == null) {
        throw const ServerException(message: 'Empty response from server');
      }
      return TransactionModel.fromJson(data);
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await _dio.delete<void>('${ApiEndpoints.transactions}/$id');
    } on DioException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}

/// Mock implementation of [TransactionsRemoteDataSource] for development.
///
/// Returns mock data without making real network calls.
class MockTransactionsRemoteDataSource
    implements TransactionsRemoteDataSource {
  static const _delay = Duration(milliseconds: 500);

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future<void>.delayed(_delay);
    return [];
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    await Future<void>.delayed(_delay);
    throw const ServerException(
      message: 'Transaction not found',
      statusCode: 404,
    );
  }

  @override
  Future<TransactionModel> createTransaction(TransactionModel model) async {
    await Future<void>.delayed(_delay);
    return model;
  }

  @override
  Future<TransactionModel> updateTransaction(TransactionModel model) async {
    await Future<void>.delayed(_delay);
    return model;
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await Future<void>.delayed(_delay);
  }
}
