import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/chapter.dart';
import '../../../domain/usecase/get_chapter.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final GetChapter _getChapter;

  ChapterBloc(this._getChapter) : super(ChapterEmpty()) {
    on<FetchChapterEvent>((event, emit) async {
      emit(ChapterLoading());
      final result = await _getChapter.execute(event.param);
      result.fold(
        (failure) => emit(ChapterError(failure.message)),
        (data) => emit(ChapterHasData(data)),
      );
    });
  }
}
