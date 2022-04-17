import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class MapScreen extends StatefulWidget {
  final Events event;
  const MapScreen({Key? key, required this.event}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double? lat = 0;
  double? long = 0;

  @override
  void initState() {
    super.initState();
    myCurrentLocation();
    getLong(0.0).then((response) {
      setState(() {
        long = response;
      });
    });
    getLat(0.0).then((response) {
      setState(() {
        lat = response;
      });
    });
  }

  getLong(double longitude) async {
    if (mounted) {
      List<geo.Location> locations =
          await geo.locationFromAddress(widget.event.location);
      longitude = locations.elementAt(0).longitude;
      print(longitude);
      return longitude;
    }
  }

  getLat(double latitude) async {
    if (mounted) {
      List<geo.Location> locations =
          await geo.locationFromAddress(widget.event.location);
      latitude = locations.elementAt(0).latitude;
      print(latitude);
      return latitude;
    }
  }

  late GoogleMapController _googleMapController;
  late LocationData currentLocation;
  var location = Location();

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

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  initialCameraPosition() {
    return CameraPosition(
      target: LatLng(lat!, long!),
      zoom: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    Marker _EventMarker = Marker(
      markerId: MarkerId('EventMarker'),
      infoWindow: InfoWindow(title: widget.event.title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(lat!, long!),
    );
    //mapMarker = getEventLocation(event);
    return lat == null || lat == 0 && long == null || long == 0
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(mainColour)))
        : Scaffold(
            body: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              markers: {_EventMarker},
              initialCameraPosition: initialCameraPosition(),
              onMapCreated: (controller) => _googleMapController = controller,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: lightGrey,
              foregroundColor: darkGrey,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(initialCameraPosition()),
              ),
              child: const Icon(Icons.location_pin),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          );
  }
}
