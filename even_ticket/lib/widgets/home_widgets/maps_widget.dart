import 'dart:io';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/event_widgets/event_details_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as geo;

class MapScreen extends StatefulWidget {
  // final Event event;
  // const MapScreen({Key? key, required this.event}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //final event = Provider.of<Events>(context);
  //late Events event;
  @override
  void initState() {
    super.initState();
  }

  late GoogleMapController _googleMapController;
  late LocationData currentLocation;
  var location = new Location();

  late Marker mapMarker;

  static final Marker _CrokeParkMarker = Marker(
    markerId: MarkerId('CrokePark'),
    infoWindow: InfoWindow(title: 'Croke Park'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: LatLng(53.3608176244587, -6.251144528771498),
  );

  // myCurrentLocation() async {
  //   try {
  //     currentLocation = await location.getLocation();
  //     print("locationLatitude: ${currentLocation.latitude.toString()}");
  //     print("locationLongitude: ${currentLocation.longitude.toString()}");
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       String error = 'Permission denied';
  //       print(error);
  //     }
  //     //currentLocation = null;
  //   }
  // }

  getEventLocation(Events event) async {
    List<geo.Location> locations =
        await geo.locationFromAddress(event.location);

    mapMarker = Marker(
      markerId: MarkerId(event.location),
      infoWindow: InfoWindow(title: event.location),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(
          locations.elementAt(0).latitude, locations.elementAt(0).longitude),
    );
    print(mapMarker);
    return mapMarker;
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  double Longitude = 0;
  double Latitude = 0;

  locationtest(Events event) async {
    List<geo.Location> locations =
        await geo.locationFromAddress(event.location);

    var Long = locations.elementAt(0).longitude;
    var Lat = locations.elementAt(0).latitude;

    Longitude = Long.toDouble();
    Latitude = Lat.toDouble();
  }

  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(53.3608176244587, -6.251144528771498),
  //   zoom: 7,
  // );

  initialCameraPosition() {
    return CameraPosition(
      target: LatLng(Latitude, Longitude),
      zoom: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);
    locationtest(event);
    print(Latitude);
    print(Longitude);

    Marker _EventMarker = Marker(
      markerId: MarkerId('EventMarker'),
      infoWindow: InfoWindow(title: event.title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(Latitude, Longitude),
    );
    //mapMarker = getEventLocation(event);
    return Scaffold(
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
