import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class PetaProvider with ChangeNotifier {
  LocationAccuracy _accuracy = LocationAccuracy.low;
  LatLng latLng = LatLng(0, 0);
  LatLng latLng_lama = LatLng(0, 0);

  MapController mapController = MapController();
  bool mapready = false;
  bool mulaibaca = false;

  void start_searlok() {
    if (mulaibaca == false) {
      mulaibaca = true;
      _searlok();
    }
  }

  void stop_searlok() {
    mulaibaca == false;
  }

  Future<bool> cekizin() async {
    var izin = await Geolocator.checkPermission();
    if (izin != LocationPermission.always &&
        izin != LocationPermission.whileInUse) {
      izin = await Geolocator.requestPermission();
    }
    if (izin != LocationPermission.always &&
        izin != LocationPermission.whileInUse) {
      return false;
    }
    return true;
  }

  Future _searlok() async {
    final izin = await cekizin();
    if (izin == false) return;

    try {
      final lokasi = await Geolocator.getCurrentPosition(
        desiredAccuracy: _accuracy,
      );
      latLng = LatLng(lokasi.latitude, lokasi.longitude);
      akurasi_up();

      if (mapready == true) {
        final jarak = Geolocator.distanceBetween(
          latLng.latitude,
          latLng.longitude,
          latLng_lama.latitude,
          latLng_lama.longitude,
        );
        if (jarak > 300) {
          latLng_lama = latLng;
          mapController.move(latLng, mapController.zoom);
        }
      }
      print('Lokasi Ditemukan $lokasi');
    } catch (e) {
      print('Lokasi Error = $e');
      akurasi_down();
    }

    if (mulaibaca == true) {
      await Future.delayed(Duration(seconds: 1));
      _searlok();
    }
  }

  void akurasi_up() {
    if (_accuracy == LocationAccuracy.low) {
      _accuracy = LocationAccuracy.medium;
    } else if (_accuracy == LocationAccuracy.medium) {
      _accuracy = LocationAccuracy.best;
    } else if (_accuracy == LocationAccuracy.best) {
      _accuracy = LocationAccuracy.bestForNavigation;
    }
  }

  void akurasi_down() {
    if (_accuracy == LocationAccuracy.bestForNavigation) {
      _accuracy = LocationAccuracy.best;
    } else if (_accuracy == LocationAccuracy.best) {
      _accuracy = LocationAccuracy.medium;
    } else if (_accuracy == LocationAccuracy.medium) {
      _accuracy = LocationAccuracy.low;
    }
  }
}
