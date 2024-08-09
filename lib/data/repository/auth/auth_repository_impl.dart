import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/data/repository/auth/auth.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
