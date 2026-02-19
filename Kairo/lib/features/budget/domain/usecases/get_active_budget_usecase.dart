import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/budget/domain/entities/budget.dart';
import 'package:kairo/features/budget/domain/repositories/budgets_repository.dart';

/// Gets the currently active budget (where today falls within the date range).
class GetActiveBudgetUseCase extends UseCase<Budget?, NoParams> {
  const GetActiveBudgetUseCase(this._repository);

  final BudgetsRepository _repository;

  @override
  Future<Either<Failure, Budget?>> call(NoParams params) {
    return _repository.getActiveBudget();
  }
}
