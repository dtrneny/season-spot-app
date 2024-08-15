
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/core/validation/rules/email_validation_rule.dart';
import 'package:season_spot/shared/widgets/index.dart';
import 'package:season_spot/shared/widgets/misc/base_screen.dart';
import 'package:season_spot/shared/widgets/misc/screen_content.dart';
import 'package:season_spot/shared/widgets/typography/screen_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ super.key });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final fisrtnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: ScreenTitle(title: context.translate.signUp),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.arrowLeft,
            colorFilter: ColorFilter.mode(context.theme.base.secondaryColor, BlendMode.srcIn),
          ),
          onPressed: () => context.pop(),
        ),
      ),
      child: ScreenContent(
        child: SingleChildScrollView( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.start, 
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildForm(),
              const SizedBox(height: AppPadding.p60),
              _buildActions(),
            ],
          ), 
        )
      ), 
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        FormItem(
          label: context.translate.firstname,
          child: TextInput(
            controller: fisrtnameController,
            hint: context.translate.firstnamePlaceholder,
          ),
        ),
        const SizedBox(height: AppPadding.p20),
        FormItem(
          label: context.translate.lastname,
          child: TextInput(
            controller: lastnameController,
            hint: context.translate.lastnamePlaceholder,
          ),
        ),
        const SizedBox(height: AppPadding.p20),
        FormItem(
          label: context.translate.email,
          child: TextInput(
            controller: emailController,
            hint: context.translate.emailPlaceholder,
            rules: [
              EmailValidationRule(),
            ],
          ),
        ),
        const SizedBox(height: AppPadding.p20),
        FormItem(
          label: context.translate.password,
          child: PasswordInput(
            controller: passwordController,
            hint: context.translate.enterAPassword,
          ),
        ),
        const SizedBox(height: AppPadding.p20),
        FormItem(
          label: context.translate.confirmationPassword,
          child: PasswordInput(
            controller: confPasswordController,
            hint: context.translate.confirmPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return PrimaryButton(
      onPressed: () {},
      child: Text(context.translate.createAnAccount),
    );
  }
}