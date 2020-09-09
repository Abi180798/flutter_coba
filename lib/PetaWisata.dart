import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PetaWisata extends StatefulWidget {
  final double lat;
  final double long;
  PetaWisata(this.lat, this.long);
  @override
  _PetaWisataState createState() => _PetaWisataState(this.lat, this.long);
}

class _PetaWisataState extends State<PetaWisata> {
  Position _myPosition;
  Position myPosition;
  String _valOptions;
  final double lat;
  final double long;
  _PetaWisataState(this.lat, this.long);
  final Set<Marker> _markers = {};
  List _options = [
    "Air Terjun Segenter",
    "Stipak Camping Ground",
    "Goa Pengkoak",
  ];
  LatLng _currentPosition ;
  @override
  void initState() {
    this._currentPosition = LatLng(this.lat, this.long);
    _markers.add(
      Marker(
        markerId: MarkerId("3.595196, 98.672226"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }
  void getLocation(listenpostition(Position listenpostion)) async {
    Position myPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
    if (myPosition != null){
      print('Set state ${myPosition}');
      setState(() {
      this._currentPosition = LatLng(myPosition.latitude, myPosition.longitude);
    });
    }
    listenpostition(myPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x44000000),
          title: Text('GMaps TAHURA Nuraksa'),
        ),
        body: SlidingUpPanel(
            minHeight: 50,
            maxHeight: 200,
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: this._currentPosition,
                    zoom: 19,
                  ),
                  zoomControlsEnabled: true,
                  markers: _markers,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 70, right: 20),
                  child: FloatingActionButton(
                    child: Icon(Icons.location_searching),
                    onPressed: () {
                      getLocation((position){
                        print(position);
                      });
                    },
                  ),
                ),
              ],
            ),
            panel: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text("Geser ke atas")
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Icon(
                          Icons.arrow_upward,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  if (_myPosition != null)
                    Text(
                        "lat: ${_myPosition.latitude}, long: ${_myPosition.longitude}"),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(
                          'Pergi ke-',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      DropdownButton(
                        icon: Icon(Icons.menu),
                        value: _valOptions,
                        items: _options.map((value) {
                          return DropdownMenuItem(
                              child: Text(value), value: value);
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valOptions = value;
                          });
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: (){
// getLocation();
},
                    child: Text("Lihat Rute"),
                  )
                ],
              ),
            )));
  }



  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _myPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
