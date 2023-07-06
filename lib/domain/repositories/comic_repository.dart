import 'package:fpdart/fpdart.dart';
import '../../utils/failure.dart';
import '../entities/chapter.dart';
import '../entities/comic.dart';
import '../entities/detail_comic.dart';

abstract class ComicRepository {
  Future<Either<Failure, List<Comic>>> getComics();
  Future<Either<Failure, List<Comic>>> getHotComics();
  Future<Either<Failure, DetailComic>> getDetailComic(String param);
  Future<Either<Failure, Chapter>> getChapter(String param);
  Future<Either<Failure, List<Comic>>> getPencarian(String query);
}
