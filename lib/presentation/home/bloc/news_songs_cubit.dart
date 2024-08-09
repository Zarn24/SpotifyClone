import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await sl<GetNewSongsUseCase>().call();

    returnedSongs.fold((l) {
      emit(NewsSongLoadFailiure());
    }, (data) {
      emit(NewsSongLoaded(songs: data));
    });
  }
}
