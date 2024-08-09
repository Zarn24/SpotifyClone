import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserRequest createUserReq);
}

class AuthenticationFirebaseServiceImplementation extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
    } on FirebaseAuthException catch (e) {}
  }
}
