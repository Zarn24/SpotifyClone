import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';

import 'domain/usecases/auth/signin.dart';

final sl = GetIt.instance;

Future<void> initalizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
      AuthenticationFirebaseServiceImplementation());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServicesImp());

  sl.registerSingleton<SongRepository>(SongRepositoryImpl());

  sl.registerSingleton<GetNewSongsUseCase>(GetNewSongsUseCase());

  sl.registerSingleton<GetPLayListUseCase>(GetPLayListUseCase());
}
