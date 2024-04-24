import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grace/service/authentication_service.dart';
import 'package:grace/service/validation_service.dart';
import 'package:grace/theme/breakpoint.dart';
import 'package:grace/theme/measurement.dart';
import 'package:grace/widget/button/primary_icon.dart';
import 'package:grace/widget/form/text_input.dart';
import 'package:grace/widget/toast/toast.dart';

class SettingsScreen extends StatefulWidget {
  final AuthenticationService authenticationService;
  final ValidationService validationService = ValidationService();

  SettingsScreen({
    super.key,
    required this.authenticationService,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _profileKey = GlobalKey<FormState>();
  final _loginKey = GlobalKey<FormState>();

  late TextEditingController firstNameController, lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController, passwordAgainController;

  @override
  void initState() {
    super.initState();

    firstNameController =
        TextEditingController(text: widget.authenticationService.firstName);
    lastNameController =
        TextEditingController(text: widget.authenticationService.lastName);
    emailController =
        TextEditingController(text: widget.authenticationService.email);

    passwordController = TextEditingController();
    passwordAgainController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(Measurement.getSpacing(4.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            child: Text(
              'Check out your settings',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            child: Card(
              color: Theme.of(context).canvasColor,
              elevation: 0,
              child: Container(
                width: Breakpoint.sm.maximum,
                padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(3.0),
                      ),
                      child: Text(
                        'Update your profile information',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(3.0),
                      ),
                      child: Form(
                        key: _profileKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Measurement.getSpacing(2.25),
                              ),
                              child: TextInput(
                                controller: firstNameController,
                                label: 'First Name',
                                validator: (value) => widget.validationService
                                    .validateName(value),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: Measurement.getSpacing(2.25),
                              ),
                              child: TextInput(
                                controller: lastNameController,
                                label: 'Last Name',
                                validator: (value) => widget.validationService
                                    .validateName(value),
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
                          ],
                        ),
                      ),
                    ),
                    PrimaryIconButton(
                      icon: Icons.save_alt,
                      label: 'Update',
                      onPressed: () => handleUpdateProfile(),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Measurement.getSpacing(3.0)),
            child: Card(
              color: Theme.of(context).canvasColor,
              elevation: 0,
              child: Container(
                width: Breakpoint.sm.maximum,
                padding: EdgeInsets.all(Measurement.getSpacing(3.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(3.0),
                      ),
                      child: Text(
                        'Update your password',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: Measurement.getSpacing(3.0),
                      ),
                      child: Form(
                        key: _loginKey,
                        child: Column(
                          children: [
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
                                bottom: Measurement.getSpacing(2.25),
                              ),
                              child: TextInput(
                                controller: passwordAgainController,
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
                          ],
                        ),
                      ),
                    ),
                    PrimaryIconButton(
                      icon: Icons.save_alt,
                      label: 'Update',
                      onPressed: () => handleUpdatePassword(),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: Breakpoint.sm.maximum,
            child: PrimaryIconButton(
              icon: Icons.logout,
              label: 'Sign out',
              onPressed: () {
                widget.authenticationService.deauthenticate().then(
                      (_) => GoRouter.of(context).goNamed('signin'),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  void handleUpdateProfile() {
    if (!_profileKey.currentState!.validate()) {
      return;
    }

    Map<String, String> data = {};

    if (firstNameController.text != widget.authenticationService.firstName) {
      data['firstName'] = firstNameController.text;
    }

    if (lastNameController.text != widget.authenticationService.lastName) {
      data['lastName'] = lastNameController.text;
    }

    if (emailController.text != widget.authenticationService.email) {
      data['email'] = emailController.text;
    }

    if (data.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(Toast.success(
        context,
        'No profile changes were made because no changes were found.',
      ).asSnackbar());

      return;
    }

    widget.authenticationService
        .update(
            email: data['email'],
            firstName: data['firstName'],
            lastName: data['lastName'])
        .then((String? message) {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
          context,
          message,
        ).asSnackbar());
      } else {
        widget.authenticationService.pulse().then((_) {
          ScaffoldMessenger.of(context).showSnackBar(Toast.success(
            context,
            'Your profile has been updated.',
          ).asSnackbar());
        });
      }
    });
  }

  void handleUpdatePassword() {
    if (!_loginKey.currentState!.validate()) {
      return;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(Toast.success(
        context,
        'No profile changes were made because no changes were found.',
      ).asSnackbar());

      return;
    }

    widget.authenticationService
        .update(password: passwordController.text)
        .then((String? message) {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(Toast.failure(
          context,
          message,
        ).asSnackbar());
      } else {
        widget.authenticationService.pulse().then(
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(Toast.success(
              context,
              'Your password has been updated.',
            ).asSnackbar());
          },
        );
      }
    });
  }
}
