import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';
import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongLoading());

  Future<void> getNewSongs() async {
    try {
      // Fetch the new songs
      var returnedSongs = await sl<GetNewSongsUseCase>().call();

      returnedSongs.fold((failure) {
        // If an error occurs, emit failure state with message
        print('Failed to fetch new songs: $failure');
        emit(NewsSongLoadFailiure(errorMessage: failure.message));
      }, (data) {
        // If successful, emit loaded state
        print('New songs fetched successfully: $data');
        emit(NewsSongLoaded(songs: data));
      });
    } catch (e) {
      print('Error in NewsSongsCubit: $e');
      emit(NewsSongLoadFailiure(errorMessage: 'An unexpected error occurred.'));
    }
  }
}
