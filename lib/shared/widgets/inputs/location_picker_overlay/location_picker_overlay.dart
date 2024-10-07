import 'package:flutter/material.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/localization/localization.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/core/theming/index.dart';
import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';
import 'package:season_spot/shared/widgets/index.dart';
import 'package:season_spot/shared/widgets/inputs/location_picker_overlay/location_picker_overlay_controller.dart';

class LocationPickerOverlay extends StatefulWidget {
  final Function(AutocompletePrediction prediction) onLocationSelect;

  const LocationPickerOverlay({
    super.key,
    required this.onLocationSelect,
  });

  @override
  State<LocationPickerOverlay> createState() => _LocationPickerOverlayState();
}

class _LocationPickerOverlayState extends State<LocationPickerOverlay> {
  final _controller = LocationPickerOverlayController();
  final _queryController = TextEditingController();

  static const _fetchPredictionsKey = 'fetchPredictions';

  List<AutocompletePrediction> _predictions = [];

  void _onQueryChanged() async {
    if (_queryController.text.isEmpty) {
      return;
    }

    final predictions = await _controller.fetchPredictions(
      key: _fetchPredictionsKey,
      query: _queryController.text,
    );

    if (!mounted) {
      return;
    }

    setState(() => _predictions = predictions);
  }

  @override
  void initState() {
    super.initState();
    final debouncedSearch = debounce(() {
      _onQueryChanged();
    }, const Duration(milliseconds: 600));

    _queryController.addListener(() {
      debouncedSearch();
    });
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScreenState>(
      stream: _controller.stateStream,
      initialData: _controller.currentState,
      builder: (context, snapshot) => _buildContent(),
    );
  }

  Widget _buildContent() {
    Widget content = !_controller.loadingByKey(_fetchPredictionsKey)
        ? _predictions.isNotEmpty
            ? _buildPredicitonList()
            : _buildEmptyListMessage()
        : _buildLoading();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeading(),
        const SizedBox(height: AppPadding.p20),
        _buildSearchBar(),
        const SizedBox(height: AppPadding.p20),
        content,
      ],
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p16),
      child: Align(
        child: CircularProgressIndicator(
          color: context.theme.base.primaryColor,
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Text(
      context.translate.pickALocation,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: AppTypographySizing.medium,
        color: context.theme.base.primaryColor,
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextInput(
      controller: _queryController,
      hint: context.translate.search,
      prefixIcon: BaseIcon(
        icon: AppIcons.search,
        color: context.theme.base.neutral600,
        size: 20.0,
      ),
    );
  }

  Widget _buildPredicitonList() {
    return SizedBox(
      height: double.maxFinite,
      child: ListView.separated(
        itemCount: _predictions.length,
        separatorBuilder: (context, index) =>
            Divider(color: context.theme.base.neutral200),
        itemBuilder: (context, index) =>
            _buildPredictionRow(_predictions[index]),
      ),
    );
  }

  Widget _buildPredictionRow(AutocompletePrediction prediction) {
    return ListTile(
      title: Text(prediction.description),
      onTap: () {
        widget.onLocationSelect(prediction);
      },
    );
  }

  Widget _buildEmptyListMessage() {
    return Align(
      child: Text(
        context.translate.noLocationsFound,
        style: TextStyle(color: context.theme.base.neutral600),
      ),
    );
  }
}
