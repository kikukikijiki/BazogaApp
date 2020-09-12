import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InteractiveMaps extends StatefulWidget {
  @override
  _InteractiveMapsState createState() => _InteractiveMapsState();
}

class _InteractiveMapsState extends State<InteractiveMaps> {
  LatLng myLocation;
  Timer _timer;
  final Map<String, Marker> _marker = {};

  void getCurrentLocation() async {
    // _marker.clear();
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      final myMarker = Marker(
          markerId: MarkerId("My Position"),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(title: "My Location", snippet: "Udacoding"));
      _marker['Current Location'] = myMarker;
      myLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print("Lat :  ${currentLocation.latitude}");
    print("Lon : ${currentLocation.longitude}");
  }

  void periodicMethod() async {
    _timer = Timer.periodic(Duration(seconds: 1), (test) async {
      if (this.mounted) {
        setState(() {
          getCurrentLocation();
          print("Get Location Ke ${test.tick}");
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    periodicMethod();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    periodicMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Google Maps"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: myLocation, zoom: 14.0),
                  markers: _marker.values.toSet(),
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                    Factory<OneSequenceGestureRecognizer>(
                      () => ScaleGestureRecognizer(),
                    )
                  ].toSet(),
                ),
              ),
            ),
          ],
        ));
  }
}
