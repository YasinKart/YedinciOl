import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.872704, 32.491935);
  void _onMapCreated(GoogleMapController controller){
    mapController=controller;
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('Mengene Halı Saha'),
            position: LatLng(37.859845, 32.506779),
          ),
          const Marker(
            markerId: MarkerId('Efor Halı Saha'),
            position: LatLng(37.8805086, 32.4342123),
          ),
          const Marker(
            markerId: MarkerId('Sporyum Halı Saha'),
            position: LatLng(37.858538, 32.461056),
          ),
          const Marker(
            markerId: MarkerId('Konya Halı Saha'),
            position: LatLng(37.9045783, 32.388942),
          ),
          const Marker(
            markerId: MarkerId('Cumhuriyet Futbol Sahası'),
            position: LatLng(37.9182866, 32.4670518),
          ),
          const Marker(
            markerId: MarkerId('Köprübaşı Halı Saha Spor Tesisleri'),
            position: LatLng(37.8822978, 32.5149033),
          ),
          const Marker(
            markerId: MarkerId('Yurttabir Halı Saha'),
            position: LatLng(37.9012218, 32.5069027),
          ),
          const Marker(
            markerId: MarkerId('Özcan Halı Saha Spor Tesisleri'),
            position: LatLng(37.9148163, 32.5105799),
          ),
          const Marker(
            markerId: MarkerId('Karşehir Halısaha'),
            position: LatLng(37.8802448, 32.5173038),
          ),
        },
      ),

    );
  }

