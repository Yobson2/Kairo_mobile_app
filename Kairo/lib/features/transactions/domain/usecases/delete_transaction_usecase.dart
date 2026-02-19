import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/transactions/domain/repositories/transactions_repository.dart';

/// Deletes a transaction by ID.
class DeleteTransactionUseCase extends UseCase<void, String> {
  const DeleteTransactionUseCase(this._repository);

  final TransactionsRepository _repository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repository.deleteTransaction(params);
  }
}
