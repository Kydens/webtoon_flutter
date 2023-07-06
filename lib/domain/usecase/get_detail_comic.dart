import 'package:fpdart/fpdart.dart';
import '../../utils/failure.dart';
import '../entities/detail_comic.dart';
import '../repositories/comic_repository.dart';

class GetDetailComic {
  final ComicRepository repository;

  GetDetailComic(this.repository);

  Future<Either<Failure, DetailComic>> execute(String param) async {
    return await repository.getDetailComic(param);
  }
}
