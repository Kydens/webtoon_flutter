import 'package:fpdart/fpdart.dart';
import '../../utils/failure.dart';
import '../entities/comic.dart';
import '../repositories/comic_repository.dart';

class GetHotComic {
  final ComicRepository repository;

  GetHotComic(this.repository);

  Future<Either<Failure, List<Comic>>> execute() {
    return repository.getHotComics();
  }
}
