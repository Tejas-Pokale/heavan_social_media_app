import 'package:flutter/material.dart';
import 'package:video_player_app/screens/create_account.dart';
import 'package:video_player_app/screens/sign_up.dart';
import 'package:video_player_app/widgets/email_input.dart';
import 'package:video_player_app/widgets/password_input.dart';
import 'package:video_player_app/widgets/remember_me.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  late Widget rememberMeWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rememberMeWidget = RememberMeWidget(
      remember: remember,
      label: 'remember me?',
      updateState: (val) {
        remember = val;
      },
    );
  }

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
              stops: [.1, 1],
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
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
                            PasswordInputWidget(
                              controller: _passwordController,
                              hintText: 'Enter your password',
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 7,
                    ),

                    SizedBox(
                      width: 220,
                      child: rememberMeWidget,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                        ),
                        child: Text(
                          'login',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgot password?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        )),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
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
                              navigateToSignUp();
                            },
                            child: Text(
                              'Sign up!',
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

  void login() {
    print('email :- ${_emailController.text}');
    print('password :- ${_passwordController.text}');
    print('remember :- ${remember}');
    navigateToCreateAccount();
  }

  void navigateToSignUp() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
  }

  void navigateToCreateAccount() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => CreateAccountScreen(),
    ));
  }
}
