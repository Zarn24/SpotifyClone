import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/appbar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/presentation/authentication/pages/sign_up.dart';

import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../root/pages/root.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: Image.asset(
          'assets/vectors/spotify_logo.png',
          height: 150,
          width: 150,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                      params: SigninUserRequest(
                          email: _email.text.toString(),
                          password: _password.text.toString()));
                  result.fold((l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const RootPage()),
                        (route) => false);
                  });
                },
                title: 'Sign In')
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter E-Mail')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: 'Enter Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        builder: (BuildContext) => SignUpPage()));
              },
              child: const Text('Register Now'))
        ],
      ),
    );
  }
}
