import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
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

  var _validated = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenState>(
      stream: _controller.stateStream,
      initialData: _controller.currentState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is ErrorState &&
            state.error.presentation == PresentationType.toast) {
          _controller.toast.showToast(
            state.error.getLocalizedMessage(context),
            type: ToastType.error,
          );
        }

        return _buildContent();
      },
    );
  }

  Future<void> _signUp() async {
    if (!_validated) {
      setState(() => _validated = true);
    }

    if (_formKey.currentState!.validate()) {
      return;
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

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        IntroductionText(text: context.translate.signUpFormDescription),
        const SizedBox(height: AppPadding.p20),
        _buildForm(),
        const SizedBox(height: AppPadding.p60),
        _buildActions(),
        const SizedBox(height: AppPadding.p60),
      ],
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
            required: true,
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
            required: true,
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
            required: true,
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
            required: true,
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
            required: true,
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
