import 'dart:io';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/chapter.dart';
import '../../domain/entities/comic.dart';
import '../../domain/entities/detail_comic.dart';
import '../../domain/repositories/comic_repository.dart';
import '../../utils/exception.dart';
import '../../utils/failure.dart';
import '../datasources/comic_remote_datasource.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicRemoteDataSource remoteDataSource;

  ComicRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Comic>>> getComics() async {
    try {
      final result = await remoteDataSource.getComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Comic>>> getHotComics() async {
    try {
      final result = await remoteDataSource.getHotComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailComic>> getDetailComic(String param) async {
    try {
      final result = await remoteDataSource.getDetailComic(param);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Chapter>> getChapter(String param) async {
    try {
      final result = await remoteDataSource.getChapter(param);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Comic>>> getPencarian(String query) async {
    try {
      final result = await remoteDataSource.getPencarian(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
