import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/features/auth/sign_up/sign_up_controller.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/toast/toast_type_enum.dart';
import 'package:season_spot/shared/widgets/index.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = SignUpController();

  final _formKey = GlobalKey<FormState>();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();

  String? _emailErrorMessage;
  bool _shouldSkipValidation = false;
  bool _signingUp = false;

  Future<void> _signUp() async {
    setState(() => _signingUp = true);
    if (_emailErrorMessage != null) {
      setState(() {
        _emailErrorMessage = null;
        _shouldSkipValidation = true;
      });
    }
    if (!_shouldSkipValidation && !_formKey.currentState!.validate()) {
      setState(() => _signingUp = false);
      return;
    }

    _shouldSkipValidation = false;

    final result = await _signUpController.signUp(
      UserAccount(
        firstname: _firstnameController.text,
        lastname: _lastnameController.text,
        email: _emailController.text,
      ),
      _passwordController.text,
    );

    final _ = switch (result) {
      Success() => _handleSignUpSuccess(),
      Failure(:final exception) => _handleSignUpFailure(exception),
    };

    setState(() => _signingUp = false);
  }

  void _handleSignUpSuccess() {
    context.pop();
  }

  void _handleSignUpFailure(AppError error) {
    if (error is EmailInUseError) {
      setState(() => _emailErrorMessage = error.getLocalizedMessage(context));
      return;
    }

    _signUpController.toast.showToast(
      error.getLocalizedMessage(context),
      type: ToastType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildIntroductionText(),
        const SizedBox(height: AppPadding.p20),
        _buildForm(),
        const SizedBox(height: AppPadding.p60),
        _buildActions(),
        const SizedBox(height: AppPadding.p60),
      ],
    );
  }

  Widget _buildIntroductionText() {
    return Text(
      context.translate.signUpFormDescription,
      style: TextStyle(
        fontSize: AppTypographySizing.base,
        color: context.theme.base.neutral600,
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormItem(
            label: context.translate.firstname,
            child: TextInput(
              controller: _firstnameController,
              hint: context.translate.firstnamePlaceholder,
              rules: [
                RequiredValidationRule(),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.lastname,
            child: TextInput(
              controller: _lastnameController,
              hint: context.translate.lastnamePlaceholder,
              rules: [
                RequiredValidationRule(),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.email,
            child: TextInput(
              controller: _emailController,
              hint: context.translate.emailPlaceholder,
              rules: [
                RequiredValidationRule(),
                EmailValidationRule(),
                ErrorMessageRule(message: _emailErrorMessage),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.password,
            child: PasswordInput(
              controller: _passwordController,
              hint: context.translate.enterAPassword,
              rules: [
                RequiredValidationRule(),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.confirmationPassword,
            child: PasswordInput(
              controller: _confPasswordController,
              hint: context.translate.confirmPassword,
              rules: [
                RequiredValidationRule(),
                EqualityValidationRule(
                  comparedValueBuilder: () => _passwordController.text,
                  customMessage: context.translate.passwordsHaveToMatch,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return BaseButton(
      onPressed: _signUp,
      child: _signingUp
          ? const ButtonSpinner()
          : Text(context.translate.createAnAccount),
    );
  }
}
