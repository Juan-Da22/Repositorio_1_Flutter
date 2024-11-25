import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  MapViewState createState() => MapViewState();  // Cambiado a MapViewState
}

class MapViewState extends State<MapView> {  // Cambiado a MapViewState
  final MapController _mapController = MapController();
  LatLng? _currentPosition;
  Stream<Position>? _positionStream;
  double _currentZoom = 15.0;

  Future<void> _initLocationTracking() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('El servicio de ubicación está deshabilitado.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Permiso de ubicación denegado.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Los permisos de ubicación están permanentemente denegados.');
      return;
    }

    try {
      final position = await LocationService.getCurrentLocation();
      setState(() {
        _currentPosition = LatLng(position!.latitude, position.longitude);
      });
      if (_currentPosition != null) {
        _mapController.move(_currentPosition!, _currentZoom);
      }
    } catch (e) {
      print('Error obteniendo la ubicación inicial: $e');
    }

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    _positionStream!.listen((Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      if (_currentPosition != null) {
        _mapController.move(_currentPosition!, _currentZoom);
      }
    });
  }

  void updateLocation() {
    _initLocationTracking();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _currentPosition ?? const LatLng(6.2442, -75.5812),
        initialZoom: _currentZoom,
        maxZoom: 18.0,
        minZoom: 10.0,
        onPositionChanged: (position, hasGesture) {
          if (position.zoom != null) {
            _currentZoom = position.zoom!;
          }
        },
      ),
      children: [
        TileLayer(
            urlTemplate: 'https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
        ),
        if (_currentPosition != null)
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _currentPosition!,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
