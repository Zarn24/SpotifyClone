import 'package:spotify_clone/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signup(CreateUserRequest createUserReq);
  Future<void> signin();
}
