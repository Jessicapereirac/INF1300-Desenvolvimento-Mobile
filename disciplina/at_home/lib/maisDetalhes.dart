import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'package:com/helpers/professional_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'internacionalizacao/translate.dart';

class maisDetalhes extends StatefulWidget {
  Professional professional;

  maisDetalhes(this.professional);

  @override
  _maisDetalhesState createState() => _maisDetalhesState(this.professional);

}

class _maisDetalhesState extends State<maisDetalhes> {
  Professional professional;
  var location = new Location();
  LocationData userLocation;
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _kGooglePlex;
  Set<Marker> markers = Set();

  _maisDetalhesState(this.professional);

  getImageRef() {
    List arr = this.professional.img.split("\\");
    return arr.last;
  }

  Future<dynamic> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    List<Placemark> placemark = await Geolocator().placemarkFromAddress("Brazil, ${professional.admindistrict}, ${professional.city}, ${professional.zipcode}");
    Marker marker1 = Marker(
      markerId: MarkerId("Client"),
      position: LatLng(currentLocation.latitude, currentLocation.longitude),
      infoWindow: InfoWindow(
        title: "you"
      ),
    );
    Marker marker2 = Marker(
      markerId: MarkerId("${professional.name}"),
      position: LatLng(placemark.first.position.latitude, placemark.first.position.longitude),
      infoWindow: InfoWindow(
        title: professional.name
      ),
    );
    markers.add(marker1);
    markers.add(marker2);
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "at home",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 25),
            )),
        body: FutureBuilder(
            future: _getLocation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 5.0,
                  ),
                );
              } else if (snapshot.hasError) {
                return Container();
              } else {
                this.userLocation = snapshot.data;
                _kGooglePlex = CameraPosition(
                  target: LatLng(
                      this.userLocation.latitude, this.userLocation.longitude),
                  zoom: 14.4746,
                );
                return GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: markers,
                );
              }
            }));
  }
}
