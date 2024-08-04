import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:season_spot/common/widgets/inputs/clickable_text.dart';
import 'package:season_spot/common/widgets/inputs/password_input.dart';
import 'package:season_spot/common/widgets/inputs/text_input.dart';
import 'package:season_spot/common/widgets/misc/form_item.dart';
import 'package:season_spot/common/widgets/inputs/primary_button.dart';
import 'package:season_spot/features/auth/controllers/sign_in_controller.dart';
import 'package:season_spot/localization/localization.dart';
import 'package:season_spot/theming/utils/theme_extensions.dart';
import 'package:season_spot/theming/utils/app_paddings.dart';
import 'package:season_spot/theming/utils/app_typography_sizing.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController _signInController = SignInController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Padding( 
        padding: const EdgeInsets.symmetric(horizontal: 20.0), 
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
              fontSize: 24.0
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            context.translate.signInToYourAccount,
            style: TextStyle(
              color: context.theme.base.neutral600,
              fontWeight: FontWeight.w400,
              fontSize: 16.0
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        FormItem(
          label: context.translate.email,
          child: TextInput(
            controller: emailController,
            hint: context.translate.enterAnEmail,
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
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: ClickableText(text: context.translate.forgotPassword, onPressed: () {}),
        ),
        const SizedBox(height: AppPadding.p28),
        PrimaryButton(
          onPressed: () => _signInController.addToCounter(1),
          child: Text(context.translate.signIn),
        ),
        const SizedBox(height: AppPadding.p40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate.dontHaveAnAccount,
              style: TextStyle(
                fontSize: AppTypographySizing.small,
                color: context.theme.base.neutral600
              ),
            ),
            const SizedBox(width: 3.0),
            ClickableText(text: context.translate.signUpYourself, onPressed: () {})
          ],
        )
      ],
    );
  }
}