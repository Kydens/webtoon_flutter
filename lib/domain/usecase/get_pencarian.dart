import 'package:fpdart/fpdart.dart';
import '../../utils/failure.dart';
import '../entities/comic.dart';
import '../repositories/comic_repository.dart';

class GetPencarian {
  final ComicRepository repository;
  GetPencarian(this.repository);

  Future<Either<Failure, List<Comic>>> execute(String query) {
    return repository.getPencarian(query);
  }
}
