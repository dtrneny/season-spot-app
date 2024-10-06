import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/core/validation/index.dart';
import 'package:season_spot/features/vendoring/vendor_addition/vendor_addition_controller.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/shared/widgets/index.dart';
import 'package:season_spot/shared/widgets/inputs/location_picker_overlay/location_picker_overlay.dart';

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
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _overlayController = OverlayPortalController();

  AutocompletePrediction? _location;

  Future<void> _createAccount() async {
    final result = await _controller.createVendorAccount(
      key: _createVendorAccountKey,
      data: VendorAccount(
        bussinessName: _businessNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
      ),
    );

    if (result && mounted) {
      // FIXME: later replace to detail
      context.go('/dashboard');
    }
  }

  String? _getEmailErrorMessage() {
    final state = _controller.currentState;
    if (state is! ErrorState || state.error is! EmailInUseError) {
      return null;
    }
    return state.error.getLocalizedMessage(context);
  }

  void _onLocationSelect(AutocompletePrediction prediction) {
    _overlayController.toggle();
    setState(() => _location = prediction);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormItem(
            label: context.translate.bussinessName,
            required: true,
            child: TextInput(
              controller: _businessNameController,
              hint: context.translate.bussinessNamePlaceholder,
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.bussinessEmail,
            required: true,
            child: TextInput(
              controller: _emailController,
              hint: context.translate.bussinessEmailPlaceholder,
              rules: [
                ErrorMessageRule(message: _getEmailErrorMessage()),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.phoneNumber,
            required: true,
            child: TextInput(
              controller: _phoneNumberController,
              hint: context.translate.phoneNumberPlaceholder,
              rules: [
                PhoneNumberValidationRule(),
              ],
            ),
          ),
          const SizedBox(height: AppPadding.p20),
          FormItem(
            label: context.translate.location,
            required: true,
            child: _buildLocationField(),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(AppRounding.base)),
        onTap: _overlayController.toggle,
        child: _buildLocationOverlay(),
      ),
    );
  }

  Widget _buildLocationOverlay() {
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (_) => FullScreenOverlay(
        onBackButtonTap: () => _overlayController.toggle(),
        child: LocationPickerOverlay(onLocationSelect: _onLocationSelect),
      ),
      child: _location != null
          ? _buildSelectedLocation()
          : _buildLocationInkWellContent(),
    );
  }

  Widget _buildSelectedLocation() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: context.theme.base.neutral200,
        borderRadius: BorderRadius.circular(
          AppRounding.base,
        ), // Adjust the radius as needed
      ),
      child: Row(
        children: [
          BaseIcon(
            icon: AppIcons.flag,
            color: context.theme.base.primaryColor,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _location!.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInkWellContent() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          BaseIcon(
            icon: AppIcons.flag,
            color: context.theme.base.neutral600,
          ),
          const SizedBox(height: 8.0),
          Text(
            context.translate.pickALocation,
            style: TextStyle(color: context.theme.base.primaryColor),
          )
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
