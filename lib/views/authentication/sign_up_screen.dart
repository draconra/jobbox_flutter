import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/colors.dart';
import '../../../util/theme/icons.dart';
import '../../../util/theme/dimens.dart';
import '../../../widgets/navigation/top_bar.dart';
import '../../widgets/input/filled_button.dart';
import '../../widgets/input/text_field.dart';
import '../../widgets/input/circle_image_button.dart';
import '../../../model/data/user_model_data.dart';
import '../../../model/data/data.dart';

class SignUpScreen extends StatefulWidget {
  // -- Props --
  static const routeName = '/sign-up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // -- States --
  final _emailTextController = TextEditingController(text: Users.user.email);
  final _newPasswordTextController =
      TextEditingController(text: Users.user.password);
  final _reTypePasswordTextController =
      TextEditingController(text: Users.user.password);

  // -- Actions --
  void onTapBack(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapLogin() {
    Navigator.pop(context);
  }

  void _onRegistered() {
    Navigator.pop(context);
  }

  // -- UI --
  Widget _message(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Positioned(
      right: 0,
      left: 0,
      bottom: bottomInset,
      child: Container(
        height: 54,
        alignment: AlignmentDirectional.center,
        color: Theme.of(context).colorScheme.background,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.brownDark.color,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                ),
            children: [
              const TextSpan(
                  text: "By creating an account, you agree to Koko's\n"),
              TextSpan(
                text: 'Terms of Use ',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: 'and'),
              TextSpan(
                text: ' Privacy Policy',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final userModelData = Provider.of<UserModelData>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: TopBar(
        dimissIcon: AppIcons.chevronLeft,
        centerTitle: 'Sign Up',
        onTapBack: () => onTapBack(context),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 18, right: 18, bottom: bottomInset),
          child: Column(
            children: [
              const SizedBox(height: 38),
              CircleImageButon(
                title: 'Add Photo',
                onTap: () {},
              ),
              const SizedBox(height: Dimensions.textFieldSpaceBetween),
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
                title: 'New Password',
                placeholder: 'Enter new password',
                isMasked: true,
                controller: _newPasswordTextController,
              )),
              const SizedBox(height: Dimensions.textFieldSpaceBetween),
              MyTextField(
                  props: MyTextFieldProps(
                title: 'Re-type Password',
                placeholder: 'Enter password again',
                isMasked: true,
                isMaskedDisabled: true,
                controller: _reTypePasswordTextController,
              )),
              const SizedBox(height: 54),
              MyFilledButton(
                title: 'Create Account',
                onTap: () => {
                  userModelData.register(
                    _emailTextController.text,
                    _newPasswordTextController.text,
                    _reTypePasswordTextController.text,
                    _onRegistered,
                  )
                },
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brownDark.color,
                        ),
                  ),
                  TextButton(
                    onPressed: onTapLogin,
                    child: Text(
                      'Log In',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
        _message(context),
      ]),
    );
  }
}
