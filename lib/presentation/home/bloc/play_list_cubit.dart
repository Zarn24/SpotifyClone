import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_state.dart';
import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PLayListLoading());

  Future<void> getPLayList() async {
    try {
      // Fetch the playlist
      var returnedSongs = await sl<GetPLayListUseCase>().call();

      returnedSongs.fold((failure) {
        // If an error occurs, emit failure state with message
        print('Failed to fetch playlist: $failure');
        emit(PLayListLoadFailiure(errorMessage: failure.message));
      }, (data) {
        // If successful, emit loaded state
        print('Playlist fetched successfully: $data');
        emit(PLayListLoaded(songs: data));
      });
    } catch (e) {
      print('Error in PlayListCubit: $e');
      emit(PLayListLoadFailiure(errorMessage: 'An unexpected error occurred.'));
    }
  }
}
