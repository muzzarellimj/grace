import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/validation_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';
import 'package:grace/widget/form/text_input.dart';
import 'package:grace/widget/link/embedded_link_phrase.dart';
import 'package:grace/widget/toast/toast.dart';

class SigninScreen extends StatefulWidget {
  final AuthenticationService authenticationService;
  final ValidationService validationService = ValidationService();

  SigninScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                                validator: (value) => widget.validationService
                                    .validateEmailAddress(value),
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
                                validator: (value) => widget.validationService
                                    .validatePassword(value),
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
                                onPressed: () => handleEmailButtonPress(),
                              ),
                            ),
                            PrimaryIconButton(
                              icon: Icons.mail,
                              label: 'Sign in with Google',
                              widthFactor: 0.7,
                              onPressed: () => handleGoogleButtonPress(),
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
              child: EmbeddedLinkPhrase(
                prefix: 'New to Grace? ',
                label: 'Sign up',
                mainAxisAlignment: MainAxisAlignment.center,
                onTap: () => GoRouter.of(context).goNamed('signup'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleEmailButtonPress() {
    if (_key.currentState!.validate()) {
      widget.authenticationService
          .signinEmailPassword(emailController.text, passwordController.text)
          .then(
        (String? message) {
          if (message == null) {
            GoRouter.of(context).goNamed('home');
            ScaffoldMessenger.of(context).showSnackBar(Toast.success(
              context,
              'You are now signed in. Welcome back to Grace!',
            ).asSnackbar());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
              context,
              message,
            ).asSnackbar());
          }
        },
      );
    }
  }

  void handleGoogleButtonPress() {
    widget.authenticationService.signinGoogle().then((String? message) {
      if (message == null) {
        GoRouter.of(context).goNamed('home');
        ScaffoldMessenger.of(context).showSnackBar(Toast.success(
          context,
          'You are now signed in. Welcome back to Grace!',
        ).asSnackbar());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
          context,
          'Unable to connect to Google - please sign in on Google.com and try again.',
        ).asSnackbar());
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
