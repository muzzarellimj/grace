import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';
import 'package:grace/widget/form/text_input.dart';
import 'package:grace/widget/toast/toast.dart';

class AuthenticateScreen extends StatefulWidget {
  final AuthenticationService authenticationService;

  const AuthenticateScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
              child: Image.asset(
                'assets/images/brand-fill.png',
                height: Measurement.getSizing(5.0),
              ),
            ),
            Card(
              color: Theme.of(context).dialogBackgroundColor,
              elevation: 0,
              child: Container(
                width: Breakpoint.sm.minimum,
                padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
                      child: Text(
                        'Sign in to Grace',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(3.0),
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Measurement.getSpacing(2.25),
                              ),
                              child: TextInput(
                                controller: emailController,
                                label: 'Email Address',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid email address.';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Measurement.getSpacing(3.0),
                              ),
                              child: TextInput(
                                controller: passwordController,
                                label: 'Password',
                                obscure: true,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 8) {
                                    return 'Please enter a password with 8 or more characters.';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Measurement.getSpacing(2.25),
                              ),
                              child: PrimaryIconButton(
                                icon: Icons.alternate_email,
                                label: 'Sign in with email',
                                widthFactor: 0.7,
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    widget.authenticationService
                                        .authenticate(
                                      emailController.text,
                                      passwordController.text,
                                    )
                                        .then(
                                      (profile) {
                                        if (profile != null) {
                                          GoRouter.of(context).goNamed('home');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            Toast.failure(
                                              context,
                                              'Incorrect email address or password - please try again.',
                                            ).asSnackbar(),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            PrimaryIconButton(
                              icon: Icons.mail,
                              label: 'Sign in with Google',
                              widthFactor: 0.7,
                              onPressed: () {
                                widget.authenticationService
                                    .authenticateGoogle()
                                    .then(
                                  (profile) {
                                    if (profile != null) {
                                      GoRouter.of(context).goNamed('home');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(Toast.failure(context,
                                                  'Unable to sign in with Google - please sign in on Google.com and try again.')
                                              .asSnackbar());
                                    }
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to Grace? ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  InkWell(
                    hoverColor: Theme.of(context).primaryColorLight,
                    onTap: () {
                      GoRouter.of(context).goNamed('signup');
                    },
                    borderRadius: BorderRadius.circular(12.0),
                    child: Padding(
                      padding: EdgeInsets.all(
                        Measurement.getSpacing(0.5),
                      ),
                      child: Text(
                        'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
