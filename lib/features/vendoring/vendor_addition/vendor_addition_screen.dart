import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/features/vendoring/vendor_addition/vendor_addition_controller.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class VendorAdditionScreen extends StatefulWidget {
  const VendorAdditionScreen({super.key});

  @override
  State<VendorAdditionScreen> createState() => _VendorAdditionScreenState();
}

class _VendorAdditionScreenState extends State<VendorAdditionScreen> {
  final VendorAdditionController _controller = VendorAdditionController();

  final _formKey = GlobalKey<FormState>();
  static const _createVendorAccountKey = 'createVendorAccount';

  final _businessNameController = TextEditingController();
  final _businessEmailController = TextEditingController();

  Future<void> _createAccount() async {
    final result = await _controller.createVendorAccount(
      key: _createVendorAccountKey,
      data: VendorAccount(
        bussinessName: _businessNameController.text,
        bussinessEmail: _businessEmailController.text,
      ),
    );

    if (result && mounted) {
      // FIXME: later replace to detail
      context.go('/dashboard');
    }
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
      context.translate.vendorAdditionFormDescription,
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
            label: context.translate.bussinessName,
            child: TextInput(
              controller: _businessNameController,
              hint: context.translate.bussinessNamePlaceholder,
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.bussinessEmail,
            child: TextInput(
              controller: _businessEmailController,
              hint: context.translate.bussinessEmailPlaceholder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return BaseButton(
      onPressed: _createAccount,
      child: _controller.loadingByKey(_createVendorAccountKey)
          ? const ButtonSpinner()
          : Text(context.translate.createVendorProfile),
    );
  }
}
