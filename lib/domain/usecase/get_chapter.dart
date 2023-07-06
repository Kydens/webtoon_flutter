import 'package:fpdart/fpdart.dart';
import '../../utils/failure.dart';
import '../entities/chapter.dart';
import '../repositories/comic_repository.dart';

class GetChapter {
  final ComicRepository repository;

  GetChapter(this.repository);

  Future<Either<Failure, Chapter>> execute(String param) async {
    return await repository.getChapter(param);
  }
}
