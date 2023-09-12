import 'package:flutter/material.dart';
import 'package:video_player_app/screens/sign_in.dart';
import 'package:video_player_app/widgets/email_input.dart';
import 'package:video_player_app/widgets/password_input.dart';
import 'package:video_player_app/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(clipBehavior: Clip.none, children: [
          Hero(
            tag: 'horror',
            child: Image.asset(
              'assets/images/horror1.jpg',
              width: size.width,
              height: 500,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.0),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            EmailInputWidget(
                              controller: _emailController,
                              hintText: 'Enter your email',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextInputWidget(
                              controller: _usernameController,
                              hintText: 'Enter your username',
                              icon: Icons.person,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            PasswordInputWidget(
                              controller: _passwordController,
                              hintText: 'Enter your password',
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            signUp();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                        ),
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        TextButton(
                            onPressed: () {
                              navigateToSignIn();
                            },
                            child: Text(
                              'Sign in!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void signUp() {
    print('email :- ${_emailController.text}');
    print('username :- ${_usernameController.text}');
    print('password :- ${_passwordController.text}');
  }
  
  void navigateToSignIn() {
     Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignInScreen(),
    ));
  }
}
