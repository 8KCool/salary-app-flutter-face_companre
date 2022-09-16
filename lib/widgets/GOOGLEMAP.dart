import 'dart:async';
import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/providers/clock.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';

import '../constants/colors.dart';
import '../constants/globalkeys.dart';
import '../constants/sized_box.dart';

import '../packages/lib/widget/search_widget.dart';
import '../services/webservices.dart';
import 'customtextfield.dart';
// import 'place_circle.dart';

class MapSample extends StatefulWidget {
  final double editLat;
  final double editLong;
  final double radius;

  MapSample(
      {Key? key,
      required this.editLat,
      required this.editLong,
      required this.radius})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  initState() {
    lat=widget.editLat;
    long=widget.editLong;
    getmap();

  }

  GoogleMapController? mapController; //contrller for Google map
  // LatLng startLocation = LatLng(20.5937, 78.9629);
  // String? lat;
  // String? long;
  static late double lat;
  static late double long;
  // static late double currentlat;
  // static late double currentlong;
  static late List placemarkaddress;
  Map<CircleId, Circle> circles = <CircleId, Circle>{};

  getmap() async {
    Position position = await _getGeoLocationPosition();
    print('position--------${position},');
    lat = position.latitude;
    long = position.longitude;
    print('position--------${position.latitude},${position.longitude}');
    print('currentlatlong--------${lat},${long}');

    print('youtappedoncurrrentlocationbutton--');
    LatLng newlatlang = LatLng(lat, long);
    // LatLng newlatlang = LatLng(lat,long);
    print('current--lat--long---${newlatlang}');
    // mapController?.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: newlatlang, zoom: 17)
    //     //17 is new zoom level
    //     ));
    // Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    print('thislatlonggoneonbillingpage---${location}');
    lat = position.latitude;
    long = position.longitude;

    await GetAddressFromLatLong(position);
    print('Currentaddress2------${AAddress}');
    searchlocationController.text = AAddress;
    print('Currentaddress3------${searchlocationController.text}');

    // setState(() {});
  }

  String location = 'Null, Press Button';
  String AAddress = '';
  List<dynamic> Addresslist = [];
  List<dynamic> placemarks = [];
  String Address = '';
  String city = '';
  String state = '';
  String country = '';
  String zip = '';
  String lng = '';
  String latt = '';

  Set<Marker> _markers = {};

  TextEditingController codeController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController specialController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController searchlocationController = TextEditingController();

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print('placemarks-----${placemarks}');
    placemarkaddress = placemarks;
    print('placemarkaddress-----${placemarkaddress}');
    Placemark place = placemarks[0];
    print('placemarks0-----${placemarks[0]}');

    AAddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    cityController.text = place.locality.toString();
    countryController.text = place.country.toString();
    stateController.text = place.administrativeArea.toString();
    zipcodeController.text = place.postalCode.toString();
    // "city": cityController.text,
    // "state": stateController.text,
    // "country":countryController.text,
    // "pincode":zipcodeController.text,

    print('Currentaddress------${AAddress}');
    // setState(() {});

  }

  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(lat, long),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.my_location_outlined,
        ),
        backgroundColor: MyColors.primaryColor,
        onPressed: () async {
          print('youtappedoncurrrentlocationbutton--');
          LatLng newlatlang = LatLng(lat, long);
          // LatLng newlatlang = LatLng(lat,long);
          print('current--lat--long---${newlatlang}');
      /*    mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: newlatlang, zoom: 17)
              //17 is new zoom level
              ));*/
          Position position = await _getGeoLocationPosition();
          location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
          print('thislatlonggoneonbillingpage---${location}');
          lat = position.latitude;
          long = position.longitude;
          update_marker(position.latitude, position.longitude);
          await GetAddressFromLatLong(position);
          print('Currentaddress2------${AAddress}');
          searchlocationController.text = AAddress;
          print('Currentaddress3------${searchlocationController.text}');

          // setState(() {});

          // print('placemarkaddress2-----${placemarkaddress}');
          //
          // Navigator.pop(context,placemarkaddress);
        },
      ),
      body: Consumer<GlobalModal>(
          builder: (context,globalModal,child) {
          return globalModal.load?CustomLoader():Container(
            child: Stack(
              // alignment: Alignment.center,
              children: [
                GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:  CameraPosition(
                      target: LatLng(widget.editLat,widget.editLong),
                      zoom: 14.4746,
                    ),
                    circles: Set<Circle>.of(circles.values),
                    onMapCreated: (GoogleMapController controller) {
                      update_marker(lat,long);
                      _controller.complete(controller);

                      // setState(() {
                      globalModal.loadingShow();
                        mapController = controller;
                      globalModal.loadingHide();
                      // });
                    },
                    markers: _markers,
                    onTap: (LatLng latlng) async {
                      update_marker(latlng.latitude,latlng.longitude);
                      List<Placemark> placemarks = await placemarkFromCoordinates(
                          lat, long);
                      placemarkaddress = placemarks;

                      var address =
                          '${placemarks[0].street.toString()},${placemarks[0].name.toString()},${placemarks[0].locality.toString()},${placemarks[0].country.toString()},${placemarks[0].postalCode.toString()}';


                      searchlocationController.text = address.toString();
                      countryController.text = placemarks[0].country.toString();
                      stateController.text =
                          placemarks[0].administrativeArea.toString();
                      cityController.text = placemarks[0].locality.toString();
                      zipcodeController.text = placemarks[0].postalCode.toString();

                    }),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () async {
                      print('AddAddresstaped----');

                      Map address1 = {
                        "address": searchlocationController.text,
                        "lat": lat,
                        "long": long,
                        "city": cityController.text,
                        "state": stateController.text,
                        "country": countryController.text,
                        "pincode": zipcodeController.text,
                      };
                      print('address1-----${address1}');
                      Navigator.pop(context, address1);
                    },
                    child: Container(
                      height: 50,
                        width: 130,
                        child: Center(child: Text('Done',style: TextStyle(fontSize: 16),))),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: MyColors.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 50),

                    // height: 48,
                    width: double.infinity,
                    // margin: EdgeInsets.symmetric(
                    //     horizontal:16 ,vertical:8 ),
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        border: Border.all(color: MyColors.primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child: SearchLocation(
                      controller: searchlocationController,
                      key: MyGlobalKeys.searchLocationKey,
                      apiKey: 'AIzaSyABk-0Al27H9Ap_Rtti2t0ePxOLvl5QFzk',
                      onSelected: (value) async {
                        var temp = await value.geolocation;
                        if (temp != null)
                        if (temp != null) {
                          dynamic l = temp.coordinates;
                          update_marker(l.latitude,l.longitude);

                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                  l.latitude, l.longitude);
                          placemarkaddress = placemarks;
                          searchlocationController.text = value.description;
                          countryController.text = placemarks[0].country.toString();
                          stateController.text =
                              placemarks[0].administrativeArea.toString();
                          cityController.text = placemarks[0].locality.toString();
                          zipcodeController.text =
                              placemarks[0].postalCode.toString();
                        }

                        // setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),

          );
        }
      ),

    );
  }
update_marker(lat1 ,lng1){

  lat = lat1;
  long = lng1;
  // _markers.clear();
  _markers.add(Marker(
      markerId: MarkerId('mymarker1'),
      position: LatLng(lat, long),
      // position: LatLng(latlng.latitude,  latlng.longitude ),
      draggable: true,
      onDrag: (value) async {
        update_marker(value.latitude,value.longitude);
        // latlng = value;
        // placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
      }));
  mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,long), zoom: 14)
    //17 is new zoom level
  ));


  _add();
}
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _add() {
    print('add circle---------');
    final int circleCount = circles.length;
    print('add circle---------$circleCount');
    if (circleCount == 12) {
      return;
    }
    final String circleIdVal = 'circle_id_1';
    // _circleIdCounter++;
    final CircleId circleId = CircleId(circleIdVal);
    final Circle circle = Circle(
      circleId: circleId,
      zIndex: 1,
      visible: true,
      // consumeTapEvents: true,
      strokeColor: Colors.blue,
      fillColor: Colors.blue.withOpacity(0.5),
      strokeWidth: 3,
      center: LatLng(lat,long),
      radius: widget.radius,
      onTap: () {
        print('object--------------');
        // _onCircleTapped(circleId);
      },
    );
    // setState(() {
    Provider.of<GlobalModal>(context, listen: false).loadingShow();

    print('circle-----------${circle.visible}');
      circles[circleId] = circle;
    Provider.of<GlobalModal>(context, listen: false).loadingHide();

    // });
  }
}
