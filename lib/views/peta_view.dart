import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:presensi_pegawai/provider/peta_provider.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';

class PetaView extends StatelessWidget {
  const PetaView({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.read<PetaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: prov.latLng,
              onMapReady: () {
                prov.mapready == true;
              },
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      'https://mt3.google.com/vt/lyrs=m&x={x}&y={y}&z={z}'),
              MarkerLayer(
                markers: [
                  Marker(
                    point: prov.latLng,
                    builder: (context) {
                      return Image.asset(
                        'assets/mapin.png',
                        width: 20,
                      );
                    },
                  ),
                ],
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: LatLng(-0.0156432, 109.2833565),
                    radius: 100,
                    color: Colors.red.withOpacity(0.5),
                    borderColor: Colors.white.withOpacity(0.5),
                    borderStrokeWidth: 2,
                  ),
                ],
              ),
            ],
            mapController: prov.mapController,
          ),
        ],
      ),
    );
  }
}
