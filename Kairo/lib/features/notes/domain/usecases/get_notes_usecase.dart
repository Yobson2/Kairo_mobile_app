import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/notes/domain/entities/note.dart';
import 'package:kairo/features/notes/domain/repositories/notes_repository.dart';

/// Gets all notes from the local database.
class GetNotesUseCase extends UseCase<List<Note>, NoParams> {
  /// Creates a [GetNotesUseCase].
  const GetNotesUseCase(this._repository);

  final NotesRepository _repository;

  @override
  Future<Either<Failure, List<Note>>> call(NoParams params) {
    return _repository.getNotes();
  }
}
