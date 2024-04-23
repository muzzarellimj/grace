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

class SignupScreen extends StatefulWidget {
  final AuthenticationService authenticationService;
  final ValidationService validationService = ValidationService();

  SignupScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _key = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

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
                      'Sign up with Grace',
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
                              controller: firstNameController,
                              label: 'First Name',
                              validator: (value) =>
                                  widget.validationService.validateName(value),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: Measurement.getSpacing(2.25),
                            ),
                            child: TextInput(
                              controller: lastNameController,
                              label: 'Last Name',
                              validator: (value) =>
                                  widget.validationService.validateName(value),
                            ),
                          ),
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
                              bottom: Measurement.getSpacing(2.25),
                            ),
                            child: TextInput(
                              controller: passwordController,
                              label: 'Password',
                              obscure: true,
                              validator: (value) =>
                                  widget.validationService.validatePassword(
                                value,
                                passwordAController: passwordController,
                                passwordBController: passwordAgainController,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: Measurement.getSpacing(3.0),
                            ),
                            child: TextInput(
                              controller: passwordAgainController,
                              label: 'Confirm Password',
                              obscure: true,
                              validator: (value) =>
                                  widget.validationService.validatePassword(
                                value,
                                passwordAController: passwordController,
                                passwordBController: passwordAgainController,
                              ),
                            ),
                          ),
                          PrimaryIconButton(
                            icon: Icons.arrow_right_alt,
                            label: 'Sign up',
                            widthFactor: 0.7,
                            onPressed: () => handleButtonPress(),
                          ),
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
              prefix: 'Already have an account? ',
              label: 'Sign in',
              onTap: () => GoRouter.of(context).goNamed('signin'),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
      )),
    );
  }

  void handleButtonPress() {
    if (_key.currentState!.validate()) {
      widget.authenticationService
          .signup(
        emailController.text,
        passwordController.text,
        firstNameController.text,
        lastNameController.text,
      )
          .then((String? message) {
        if (message == null) {
          GoRouter.of(context).goNamed('signin');
          ScaffoldMessenger.of(context).showSnackBar(Toast.success(
            context,
            'Your account has been created. Please sign in.',
          ).asSnackbar());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
            context,
            message,
          ).asSnackbar());
        }
      });
    }
  }
}
