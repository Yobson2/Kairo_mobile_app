import 'package:dartz/dartz.dart';
import 'package:kairo/core/error/failures.dart';
import 'package:kairo/core/usecase/usecase.dart';
import 'package:kairo/features/notes/domain/repositories/notes_repository.dart';

/// Deletes a note. Works offline by removing locally and queuing for sync.
class DeleteNoteUseCase extends UseCase<void, String> {
  /// Creates a [DeleteNoteUseCase].
  const DeleteNoteUseCase(this._repository);

  final NotesRepository _repository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repository.deleteNote(params);
  }
}
