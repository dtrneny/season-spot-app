
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/features/home/dashboard_temp_mock.dart';
import 'package:season_spot/features/home/widgets/dashboard_info_card.dart';
import 'package:season_spot/features/home/widgets/dashboard_product_card.dart';
import 'package:season_spot/shared/widgets/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final List<DashboardProduct> _productMock = getDashboardProductMock();
  int _activeProductIndex = 0;

  String _getFormattedDate() {
    final DateTime now = DateTime.now();
    String localeCode = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMMd(localeCode).format(now);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: _buildAppBar(),
      child: SingleChildScrollView( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start, 
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppPadding.p28),
            _buildDateInformation(),
            const SizedBox(height: AppPadding.p16),
            _buildSearchHeader(),
            const SizedBox(height: AppPadding.p28),
            _buildGettingStartedCard(),
            const SizedBox(height: AppPadding.p28),
            _buildRecommendationsCarousel(),
          ],
        ), 
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p16),
        child: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              AppIcons.burger,
              colorFilter: ColorFilter.mode(context.theme.base.secondaryColor, BlendMode.srcIn),
            ),
            onPressed: null,         
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppPadding.p16),
          child: IconButton(
            icon: SvgPicture.asset(
              AppIcons.bell,
              colorFilter: ColorFilter.mode(context.theme.base.secondaryColor, BlendMode.srcIn),
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }

  Widget _buildDateInformation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.calendar,
          colorFilter: ColorFilter.mode(context.theme.base.neutral600, BlendMode.srcIn),
        ),
        const SizedBox(width: 8.0),
        Text(
          _getFormattedDate(),
          style: TextStyle(
            color: context.theme.base.neutral600,
            fontSize: AppTypographySizing.base
          ),
        ),
      ],
    );
  }

  Widget _buildSearchHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Heading1(title: context.translate.discoverLocalFarmersAndFreshProduce)),
        const SizedBox(width: AppPadding.p40),
        const BaseIconButton(),
      ],
    );
  }

  Widget _buildGettingStartedCard() {
    return DashboardInfoCard(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                context.translate.gettingStarted,
                style: TextStyle(
                  fontSize: AppTypographySizing.medium,
                  color: context.theme.base.neutral100,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: AppPadding.p16),
              SvgPicture.asset(
                AppIcons.arrowRight,
                colorFilter: ColorFilter.mode(context.theme.base.complementaryColor, BlendMode.srcIn),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.p4),
          Text(
            context.translate.dashboardGettingStartedText,
            style: TextStyle(
              fontSize: AppTypographySizing.small,
              color: context.theme.base.neutral100,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecommendationsCarousel() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Heading1(title: context.translate.recommendations)),
              const SizedBox(width: AppPadding.p40),
              IndicatorDots(dotsCount: _productMock.length, activeIndex: _activeProductIndex)
            ],
          ),
          const SizedBox(height: AppPadding.p20),
          CarouselSlider.builder(
            itemCount: _productMock.length,
            options: CarouselOptions(
              height: 230,
              enableInfiniteScroll: false,
              padEnds : false,
              onPageChanged: (index, reason) {
                setState(() => _activeProductIndex = index);
              },
            ),
            itemBuilder: (context, index, realIndex)  => _buildProductCard(_productMock[index], index),
          ),
      ],
    );
  }

  Widget _buildProductCard(DashboardProduct product, int index) {
    return Container(
      margin: index == 0
        ? const EdgeInsets.only(right: AppPadding.p16)
        : const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: DashboardProductCard(
        imageUrl: product.imageUrl,
        title: product.title,
        description: product.description,
        category: product.category
      ),
    );
  }
}