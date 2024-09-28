import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/features/auth/sign_up/sign_up_controller.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _controller = SignUpController();

  final _formKey = GlobalKey<FormState>();
  static const _singUpKey = 'signUp';

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();

  bool _validated = false;

  Future<void> _signUp() async {
    if (!_validated) {
      setState(() => _validated = true);
    }

    final result = await _controller.signUp(
      key: _singUpKey,
      data: UserAccount(
        firstname: _firstnameController.text,
        lastname: _lastnameController.text,
        email: _emailController.text,
      ),
      password: _passwordController.text,
    );

    if (result && mounted) {
      context.pop();
    }
  }

  void _clearEmailInUseErrorOnChange() {
    if (_controller.currentState is! ErrorState) {
      return;
    }
    _controller.clearState();
  }

  String? _getEmailErrorMessage() {
    final state = _controller.currentState;
    if (state is! ErrorState || state.error is! EmailInUseError) {
      return null;
    }
    return state.error.getLocalizedMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenState>(
      stream: _controller.stateStream,
      initialData: _controller.currentState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is ErrorState &&
            state.error.presentation == ErrorPresentation.toast) {
          _controller.toast.showToast(
            state.error.getLocalizedMessage(context),
            type: ToastType.error,
          );
        }

        return _buildContent();
      },
    );
  }

  Widget _buildContent() {
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
      autovalidateMode: _validated
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
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
              onChanged: (_) => _clearEmailInUseErrorOnChange(),
              rules: [
                RequiredValidationRule(),
                EmailValidationRule(),
                ErrorMessageRule(message: _getEmailErrorMessage()),
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
      child: _controller.loadingByKey(_singUpKey)
          ? const ButtonSpinner()
          : Text(context.translate.createAnAccount),
    );
  }
}
