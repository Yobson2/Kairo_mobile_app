import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/auth/domain/entities/user.dart';
import 'package:kairo/features/auth/domain/repositories/auth_repository.dart';

/// Signs in with Apple OAuth via Supabase.
class SignInWithAppleUseCase extends UseCase<User, NoParams> {
  /// Creates a [SignInWithAppleUseCase].
  const SignInWithAppleUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _repository.signInWithApple();
  }
}
