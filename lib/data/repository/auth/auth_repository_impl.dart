import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/repository/auth/auth.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
