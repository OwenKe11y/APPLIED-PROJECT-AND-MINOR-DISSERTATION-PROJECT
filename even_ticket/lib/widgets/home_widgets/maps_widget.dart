import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    myCurrentLocation();
    super.initState();
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(53.3608176244587, -6.251144528771498),
    zoom: 7,
  );

  late GoogleMapController _googleMapController;

  late LocationData currentLocation;
  var location = new Location();

  myCurrentLocation() async {
    try {
      currentLocation = await location.getLocation();
      print("locationLatitude: ${currentLocation.latitude.toString()}");
      print("locationLongitude: ${currentLocation.longitude.toString()}");
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        String error = 'Permission denied';
        print(error);
      }
      //currentLocation = null;
    }
  }

  static final Marker _CrokeParkMarker = Marker(
    markerId: MarkerId('CrokePark'),
    infoWindow: InfoWindow(title: 'Croke Park'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: LatLng(53.3608176244587, -6.251144528771498),
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        markers: {_CrokeParkMarker},
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
