import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';

import 'domain/usecases/auth/signin.dart';

final sl = GetIt.instance;

Future<void> initalizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
      AuthenticationFirebaseServiceImplementation());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
