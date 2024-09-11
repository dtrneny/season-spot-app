

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/shared/widgets/index.dart';
import 'package:season_spot/shared/widgets/layouts/root_layout/root_layout_controller.dart';

class RootLayout extends StatefulWidget {
  final Widget child;

  const RootLayout({ super.key, required this.child });

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  final _rootLayoutController = RootLayoutController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  UserAccount? _userAccount;

  List<LinkItem> _getLinks() {
    return [
    LinkItem(
      icon: AppIcons.dashboard,
      label: context.translate.dashboard,
      route: '/dashboard',
    ),
    LinkItem(
      icon: AppIcons.user,
      label: context.translate.vendorProfile,
      route: '/vendor-profile',
    ),
    LinkItem(
      icon: AppIcons.location,
      label: context.translate.productMap,
      route: '/product-map',
    ),
    LinkItem(
      icon: AppIcons.flag,
      label: context.translate.communityPlaces,
      route: '/community-places',
    ),
    LinkItem(
      icon: AppIcons.bell,
      label: context.translate.notificationCenter,
      route: '/notification-center',
    ),
    LinkItem(
      icon: AppIcons.settings,
      label: context.translate.settings,
      route: '/settings',
    ),
  ];
  }

  void _navigate(String route) {
    context.go(route);
    _scaffoldKey.currentState?.closeDrawer();
  }

  Future<void> _getCurrentUserAccount() async {
    final result = await _rootLayoutController.getUserAccount();

    final _ = switch (result) {
      Success(:final value) => setState(() => _userAccount = value),
      Failure(:final exception) => _handleFailure(exception),
    };
  }

  Future<void> _signOut() async {
    final result = await _rootLayoutController.signOut();

    final _ = switch (result) {
      Success(:final value) => _handleSignOut(value),
      Failure(:final exception) => _handleFailure(exception),
    };
  }

  void _handleFailure(AppError error) {
    _rootLayoutController.toast.showToast(error.getLocalizedMessage(context), type: ToastType.error);
  }

  void _handleSignOut(bool result) {
    if (!result) { return; }
    _navigate('/sign-in');
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserAccount();
  }

  @override
  Widget build(BuildContext context){
    return BaseScreen(
      appBar: BaseAppBar(
        leadingAction: Center(
          child: IconButton(
            icon: BaseIcon(
              icon: AppIcons.burger,
              color: context.theme.base.secondaryColor
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        trailingAction: IconButton(
          icon: BaseIcon(
            icon: AppIcons.bell,
            color: context.theme.base.secondaryColor
          ),
          onPressed: () {},
        ),
      ),
      drawer: _rootDrawer(),
      scaffoldKey: _scaffoldKey,
      child: widget.child,
    );
  }

  Drawer _rootDrawer() => Drawer(
     child: Padding(
       padding: const EdgeInsets.only(top: AppPadding.p60, left: AppPadding.p16, right: AppPadding.p28, bottom: AppPadding.p60),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/resources/season_spot_logo.svg',
              height: 52, 
              width: 52,
            ),
            const SizedBox(height: AppPadding.p20),
            if (_userAccount != null) _buildUserAccountInfo(_userAccount!),
            const BaseDivider(),
            const SizedBox(height: AppPadding.p20),
            ..._getLinks().map((link) => BaseSidebarLink(
              icon: link.icon,
              label: link.label,
              onPressed: () => _navigate(link.route),
              isActive: GoRouterState.of(context).uri.toString() == link.route,
            )),
            const SizedBox(height: AppPadding.p20),
            const BaseDivider(),
            const SizedBox(height: AppPadding.p20),
            BaseSidebarLink(
              icon: AppIcons.signOut,
              label: context.translate.signOut,
              onPressed: _signOut,
            ),
         ]
       ),
     )
  );

  Widget _buildUserAccountInfo(UserAccount account) {
    return Row(
      children: [
        Container(
          width: 50.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: context.theme.base.neutral250,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppPadding.p16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${account.firstname} ${account.lastname}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppTypographySizing.base,
                color: context.theme.base.primaryColor,
              ),
            ),
            Text(
              account.email,
              style: TextStyle(
                color: context.theme.base.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}