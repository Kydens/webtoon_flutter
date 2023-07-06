import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/comic.dart';
import '../../../domain/entities/detail_comic.dart';
import '../../../domain/usecase/get_hot_comic.dart';

part 'hot_comics_event.dart';
part 'hot_comics_state.dart';

class HotComicsBloc extends Bloc<HotComicsEvent, HotComicsState> {
  final GetHotComic _getHotComic;

  HotComicsBloc(this._getHotComic) : super(HotComicsEmpty()) {
    on<HotComicsEvent>((event, emit) async {
      if (event is FetchHotComicsEvent) {
        emit(HotComicsLoading());
        final result = await _getHotComic.execute();

        result.fold(
          (failure) => emit(HotComicsError(failure.toString())),
          (data) => emit(HotComicsHasData(data)),
        );
      }
    });
  }
}
