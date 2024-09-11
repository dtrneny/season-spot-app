import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/shared/widgets/index.dart';
import 'package:season_spot/features/auth/sign_in/sign_in_controller.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = SignInController();

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailErrorMessage;
  bool _shouldSkipValidation = false;
  bool _signingIn = false;

  Future<void> _signIn() async {
    setState(() => _signingIn = true);
    if (_emailErrorMessage != null) {
      setState(() {
        _emailErrorMessage = null;
        _shouldSkipValidation = true;
      });
    }
    if (!_shouldSkipValidation && !_formKey.currentState!.validate()) {
      setState(() => _signingIn = false);
      return;
    }

    _shouldSkipValidation = false;

    final result = await _signInController.signIn(
        _emailController.text, _passwordController.text);

    final _ = switch (result) {
      Success() => _handleSignInSuccess(),
      Failure(:final exception) => _handleSignInFailure(exception),
    };

    setState(() => _signingIn = false);
  }

  void _handleSignInSuccess() {
    context.go('/dashboard');
  }

  void _handleSignInFailure(AppError error) {
    if (error is InvalidCredentialsError) {
      setState(() => _emailErrorMessage = error.getLocalizedMessage(context));
      return;
    }

    _signInController.toast
        .showToast(error.getLocalizedMessage(context), type: ToastType.error);
  }

  void _clearSignInErrorOnChange() {
    if (_emailErrorMessage == null) {
      return;
    }
    setState(() => _emailErrorMessage = null);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildHeader(),
              const SizedBox(height: AppPadding.p40),
              _buildForm(),
              const SizedBox(height: 10.0),
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/resources/season_spot_logo.svg',
            height: 75,
            width: 75,
          ),
          const SizedBox(height: AppPadding.p40),
          Text(
            context.translate.welcomeToSeasonSpot,
            style: TextStyle(
                color: context.theme.base.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 24.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            context.translate.signInToYourAccount,
            style: TextStyle(
                color: context.theme.base.neutral600,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormItem(
            label: context.translate.email,
            child: TextInput(
              controller: _emailController,
              onChanged: (_) => _clearSignInErrorOnChange(),
              hint: context.translate.enterAnEmail,
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
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: ClickableText(
              text: context.translate.forgotPassword, onPressed: () {}),
        ),
        const SizedBox(height: AppPadding.p40),
        BaseButton(
          onPressed: _signIn,
          child: _signingIn
              ? const ButtonSpinner()
              : Text(context.translate.signIn),
        ),
        const SizedBox(height: AppPadding.p40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate.dontHaveAnAccount,
              style: TextStyle(
                  fontSize: AppTypographySizing.small,
                  color: context.theme.base.neutral600),
            ),
            const SizedBox(width: 3.0),
            ClickableText(
                text: context.translate.signUpYourself,
                onPressed: () => context.push('/sign-up'))
          ],
        )
      ],
    );
  }
}
