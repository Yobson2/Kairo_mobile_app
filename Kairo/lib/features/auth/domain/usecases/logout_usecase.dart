import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/auth/domain/repositories/auth_repository.dart';

/// Logs out the current user and clears tokens.
class LogoutUseCase extends UseCase<void, NoParams> {
  /// Creates a [LogoutUseCase].
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.logout();
  }
}
