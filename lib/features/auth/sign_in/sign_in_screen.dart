import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
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
  final SignInController _controller = SignInController();

  final _formKey = GlobalKey<FormState>();
  static const _singInKey = 'signIn';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _validated = false;

  Future<void> _signIn() async {
    if (!_validated) {
      setState(() => _validated = true);
    }

    if (_formKey.currentState!.validate()) {
      return;
    }

    final result = await _controller.signIn(
      key: _singInKey,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (result && mounted) {
      context.go('/dashboard');
    }
  }

  void _clearInvalidCredentialsErrorOnChange() {
    if (_controller.currentState is! ErrorState) {
      return;
    }
    _controller.clearState();
  }

  String? _getEmailErrorMessage() {
    final state = _controller.currentState;
    if (state is! ErrorState || state.error is! InvalidCredentialsError) {
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
              _buildActions(),
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
              fontSize: AppTypographySizing.extraLarge,
            ),
          ),
          const SizedBox(height: 5.0),
          IntroductionText(text: context.translate.signInToYourAccount),
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
            required: true,
            child: TextInput(
              controller: _emailController,
              onChanged: (_) => _clearInvalidCredentialsErrorOnChange(),
              hint: context.translate.enterAnEmail,
              validationMode: _validated
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              rules: [
                RequiredValidationRule(),
                EmailValidationRule(),
                ErrorMessageRule(message: _getEmailErrorMessage()),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            required: true,
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

  Widget _buildActions() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: ClickableText(
            text: context.translate.forgotPassword,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: AppPadding.p40),
        BaseButton(
          onPressed: _signIn,
          child: _controller.loadingByKey(_singInKey)
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
                color: context.theme.base.neutral600,
              ),
            ),
            const SizedBox(width: 3.0),
            ClickableText(
              text: context.translate.signUpYourself,
              onPressed: () => context.push('/sign-up'),
            )
          ],
        )
      ],
    );
  }
}
