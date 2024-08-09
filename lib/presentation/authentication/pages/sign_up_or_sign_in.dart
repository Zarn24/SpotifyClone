import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/appbar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/authentication/pages/sign_in.dart';
import 'package:spotify_clone/presentation/authentication/pages/sign_up.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(
            title: Text(''),
          ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/vectors/spotify_logo.png'),
                    const SizedBox(
                      height: 55,
                    ),
                    const Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      'Spotify is an audio streaming and media services provider',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: BasicAppButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                          builder: (BuildContext) =>
                                              const SignUpPage()));
                                },
                                title: 'Register')),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                        builder: (BuildContext) =>
                                            const SignInPage()));
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: context.IsDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
