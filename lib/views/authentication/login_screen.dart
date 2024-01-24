import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/types.dart';
import '../../../util/theme/dimens.dart';

import '../../../views/authentication/sign_up_screen.dart';
import '../../../widgets/input/text_field.dart';
import '../../../widgets/input/filled_button.dart';

import '../../../model/data/data.dart';
import '../../../model/data/user_model_data.dart';

class LoginScreen extends StatefulWidget {
  // -- Props --
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // -- State --
  final _emailTextController = TextEditingController(text: Users.user.email);
  final _passwordTextController =
      TextEditingController(text: Users.user.password);

  // -- Actions --
  void onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, SignUpScreen.routeName);
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 74),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Job',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilies.antourOne.name,
                    ),
                  ),
                  Text(
                    'box',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilies.antourOne.name,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              MyTextField(
                props: MyTextFieldProps(
                  title: 'Email',
                  placeholder: 'Enter email',
                  controller: _emailTextController,
                ),
              ),
              const SizedBox(height: Dimensions.textFieldSpaceBetween),
              MyTextField(
                props: MyTextFieldProps(
                  title: 'Password',
                  placeholder: 'Enter password',
                  isMasked: true,
                  controller: _passwordTextController,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Forgot Password?',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 36),
              MyFilledButton(
                title: 'Login',
                onTap: () => {
                  userModelData.login(
                    _emailTextController.text,
                    _passwordTextController.text,
                  )
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () => onTapSignUp(context),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
