import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserReq);
  Future<Either> signup(CreateUserRequest createUserReq);
}

class AuthenticationFirebaseServiceImplementation extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'No User Found';
      } else if (e.code == 'invalid-credential') {
        message = 'Password Incorrect';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      return const Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with provided email';
      }
      return left(message);
    }
  }
}
