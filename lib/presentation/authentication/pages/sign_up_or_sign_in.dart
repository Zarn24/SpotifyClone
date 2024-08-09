import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/vectors/top_pattern.png')),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/vectors/bottom_pattern.png')),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBG)),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/vectors/spotify_logo.png'),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text('')
                ],
              )),
        ],
      ),
    );
  }
}
