import 'dart:async';
import 'package:cycle/models/docking_station.dart';
import 'package:cycle/services/data_manager.dart';
import 'package:cycle/services/map_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';

class Navigation {
  final List<LatLng> _stops = [
    LatLng(51.510357, -0.116773),
    LatLng(51.504501, -0.086500)
  ];
  final _context;
  final int numberOfRiders = 3;

  Navigation(this._context);

  void navigate() async {
    for (int i = 0; i < _stops.length; i++) {
      await buildRouteBetweenTwoPoints(
          _stops[i], _stops[i + 1], numberOfRiders);
    }
  }

  Future<void> buildRouteBetweenTwoPoints(
      LatLng start, LatLng stop, int numberOfRiders) async {
    DockingStation startDockingStation =
        await getClosestDockingStationWithBikesAvailable(start, numberOfRiders);
    DockingStation stopDockingStation =
        await getClosestDockingStationWithEmptyDocks(stop, numberOfRiders);

    await buildWalkingRouteBetweenTwoPoints(
        start, LatLng(startDockingStation.lat, startDockingStation.lon));

    await buildCyclingRouteBetweenTwoPoints(
        LatLng(startDockingStation.lat, startDockingStation.lon),
        LatLng(stopDockingStation.lat, stopDockingStation.lon));

    await buildWalkingRouteBetweenTwoPoints(
        LatLng(stopDockingStation.lat, stopDockingStation.lon), stop);
  }

  Future<void> buildWalkingRouteBetweenTwoPoints(
      LatLng start, LatLng stop) async {
    await openMapsSheet(_context, start, stop, DirectionsMode.walking);
  }

  Future<void> buildCyclingRouteBetweenTwoPoints(
      LatLng start, LatLng stop) async {
    await openMapsSheet(_context, start, stop, DirectionsMode.bicycling);
  }
}
