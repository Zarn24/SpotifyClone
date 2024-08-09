import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/data/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
