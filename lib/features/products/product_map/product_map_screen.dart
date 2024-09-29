import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:season_spot/core/theming/index.dart';

class ProductMapScreen extends StatefulWidget {
  const ProductMapScreen({super.key});

  @override
  State<ProductMapScreen> createState() => _ProductMapScreenState();
}

class _ProductMapScreenState extends State<ProductMapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-23.5557714, -46.6395571);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        style: mapLight,
      ),
    );
  }
}
