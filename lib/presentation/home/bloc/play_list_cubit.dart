import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_state.dart';

import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PLayListLoading());

  Future<void> getPLayList() async {
    var returnedSongs = await sl<GetPLayListUseCase>().call();

    returnedSongs.fold((l) {
      emit(PLayListLoadFailiure());
    }, (data) {
      emit(PLayListLoaded(songs: data));
    });
  }
}
