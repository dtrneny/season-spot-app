import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/widgets/index.dart';

class VendorAdditionScreen extends StatefulWidget {
  const VendorAdditionScreen({super.key});

  @override
  State<VendorAdditionScreen> createState() => _VendorAdditionScreenState();
}

class _VendorAdditionScreenState extends State<VendorAdditionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _businessNameController = TextEditingController();
  final _businessEmailController = TextEditingController();

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
      onPressed: () {},
      child: Text(context.translate.createVendorProfile),
    );
  }
}
