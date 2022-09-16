// Column(
// children: [
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Column(
// children: [
// Image.asset(MyImages.map_green, height: 36, width: 36,),
// vSizedBox,
// MainHeadingText(text: '200 M', fontSize: 14,),
// vSizedBox05,
// ParagraphText(text: 'Radius', fontSize: 14, color: MyColors.labelcolor,),
// ],
// ),
// hSizedBox,
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// MainHeadingText(text: 'Ecom Ads PVT Ltd, Tiruchengode', fontSize: 16,),
// vSizedBox05,
// ParagraphText(
// text: '20/5, Molasiyar maaligai, Old bustand, Tiruchengode',
// fontSize: 14,
// color: MyColors.labelcolor,
// ),
// vSizedBox,
// Row(
// children: [
// ParagraphText(text: 'Branch Manager', fontSize: 14, color: MyColors.black,),
// hSizedBox,
// ParagraphText(text: ': Karthika', fontSize: 14, color: MyColors.primaryColor,),
// ],
// ),
//
// ],
// ),
// ),
// PopupmenuButtonCustom(
// onTapedit: (){
// push(context: context, screen: Edit_Branch_Page());
// },
// deletemain: 'Delete This Branch',
// deletesub: 'Do you wish to delete this Branch?',
// )
//
// ],
// ),
// Divider(height: 40, color: Color(0xFFCAD8D8),)
//
// ],
// ),





//
//
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../constants/colors.dart';
// import '../constants/globalkeys.dart';
// import '../constants/sized_box.dart';
// import '../packages/lib/widget/search_widget.dart';
// import '../services/webservices.dart';
// import 'customtextfield.dart';
//
//
//
// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//
//
//   initState(){
//     getmap();
//   }
//   GoogleMapController? mapController; //contrller for Google map
//   LatLng startLocation = LatLng(23.2547 , 77.4029 );
//   // String? lat;
//   // String? long;
//   static late double lat;
//   static late double long;
//   static late double currentlat;
//   static late double currentlong;
//   static late List placemarkaddress;
//
//   getmap()async{
//     Position position = await _getGeoLocationPosition();
//     print('position--------${position},');
//     currentlat=position.latitude;
//     currentlong=position.longitude;
//     print('position--------${position.latitude},${position.longitude}');
//     print('currentlatlong--------${currentlat},${currentlong}');
//   }
//   String location ='Null, Press Button';
//   String AAddress = '';
//   List<dynamic> Addresslist = [];
//   List<dynamic> placemarks = [];
//   String Address = '';
//   String city = '';
//   String state = '';
//   String country = '';
//   String zip = '';
//   String lng = '';
//   String latt = '';
//
//
//   Set<Marker> _markers = {};
//
//   TextEditingController codeController = TextEditingController();
//   TextEditingController firstnameController = TextEditingController();
//   TextEditingController lastnameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController apartmentController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController zipcodeController = TextEditingController();
//   TextEditingController specialController = TextEditingController();
//   TextEditingController phonenoController = TextEditingController();
//   TextEditingController _textEditingController = TextEditingController();
//   TextEditingController searchlocationController = TextEditingController();
//
//
//
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
//
//   Future<void> GetAddressFromLatLong(Position position)async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     print('placemarks-----${placemarks}');
//     placemarkaddress=placemarks;
//     print('placemarkaddress-----${placemarkaddress}');
//     Placemark place = placemarks[0];
//     print('placemarks0-----${placemarks[0]}');
//
//     AAddress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//     cityController.text=place.locality.toString();
//     countryController.text=place.country.toString();
//     stateController.text = place.administrativeArea.toString();
//     zipcodeController.text=place.postalCode.toString();
//     // "city": cityController.text,
//     // "state": stateController.text,
//     // "country":countryController.text,
//     // "pincode":zipcodeController.text,
//
//     print('Currentaddress------${AAddress}');
//     setState(()  {
//     });
//   }
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng( currentlat, currentlong ),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414
//   );
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon( Icons.my_location_outlined,),
//         backgroundColor: MyColors.primaryColor,
//         onPressed: () async{
//           print('youtappedoncurrrentlocationbutton--');
//           LatLng newlatlang = LatLng(currentlat,currentlong);
//           // LatLng newlatlang = LatLng(lat,long);
//           print('current--lat--long---${newlatlang}');
//           mapController?.animateCamera(
//               CameraUpdate.newCameraPosition(
//                   CameraPosition(target: newlatlang, zoom: 17)
//                 //17 is new zoom level
//               )
//           );
//           Position position = await _getGeoLocationPosition();
//           location ='Lat: ${position.latitude} , Long: ${position.longitude}';
//           print('thislatlonggoneonbillingpage---${location}');
//           lat = position.latitude;
//           long = position.longitude;
//
//           await GetAddressFromLatLong(position);
//           print('Currentaddress2------${AAddress}');
//           searchlocationController.text=AAddress;
//           print('Currentaddress3------${searchlocationController.text}');
//           // await MyGlobalKeys.searchLocationKey.currentState?.updateTextField(AAddress);
//           _markers.clear();
//           _markers.add(
//               Marker(
//                   markerId: MarkerId('${_markers.length +1}'),
//                   position: LatLng(currentlat,  currentlong ),
//                   // position: LatLng(latlng.latitude,  latlng.longitude ),
//                   draggable: true,
//                   onDrag: (value)async{
//                     // latlng = value;
//                     // placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
//                   }
//               )
//           );
//           setState(() {
//           });
//
//           // print('placemarkaddress2-----${placemarkaddress}');
//           //
//           // Navigator.pop(context,placemarkaddress);
//         },
//       ),
//       body: Column(
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//
//               GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: _kGooglePlex,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                     setState(() {
//                       mapController = controller;
//                     });
//                   },
//                   markers: _markers,
//                   onTap: (LatLng latlng)async{
//                     List<Placemark> placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
//                     placemarkaddress=placemarks;
//                     // String address ='';
//                     print('placemarks----------${placemarks}');
//                     var address='${placemarks[0].street.toString()},${placemarks[0].name.toString()},${placemarks[0].locality.toString()},${placemarks[0].country.toString()},${placemarks[0].postalCode.toString()}';
//                     print('entireaddress----${address}');
//                     print('placemarkscountry----------${ placemarks[0].country.toString()},');
//                     print('placemarkscountry----------${ placemarks[0].country.toString()}');
//                     print('tappedlatitude----------${latlng.latitude}');
//                     print('tappedlongitude----------${latlng.longitude}');
//
//                     // addressController.text = value.description;
//                     // addressController.text= address.toString();
//                     lat=latlng.latitude;
//                     long=latlng.longitude;
//                     searchlocationController.text = address.toString();
//                     countryController.text = placemarks[0].country.toString();
//                     stateController.text = placemarks[0].administrativeArea.toString();
//                     cityController.text = placemarks[0].locality.toString();
//                     zipcodeController.text = placemarks[0].postalCode.toString();
//                     // MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
//                     _markers.clear();
//                     _markers.add(
//                         Marker(
//                             markerId: MarkerId('${_markers.length +1}'),
//                             // position: LatLng(currentlat,  currentlong ),
//                             position: LatLng(latlng.latitude,  latlng.longitude ),
//                             draggable: true,
//                             onDrag: (value)async{
//                               latlng = value;
//                               placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
//                               var address='${placemarks[0].street.toString()},${placemarks[0].name.toString()},${placemarks[0].locality.toString()},${placemarks[0].country.toString()},${placemarks[0].postalCode.toString()}';
//                               MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
//                             }
//                         )
//                     );
//                     setState(() {
//                     });
//                   }
//               ),
//               Positioned(
//                 bottom:20,
//                 left: 20,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     print('AddAddresstaped----');
//                     // print('placemarkaddress2-----${placemarkaddress}');
//                     //  placemarkaddress[0]['searchfield']=searchlocationController.text;
//                     Map address1={
//                       "address": searchlocationController.text,
//                       "lat":lat,
//                       "long":long,
//                       "city": cityController.text,
//                       "state": stateController.text,
//                       "country":countryController.text,
//                       "pincode":zipcodeController.text,
//                     };
//                     print('address1-----${address1}');
//                     Navigator.pop(context,address1);
//
//                   },
//                   child: Text('Done'),
//                   style: ElevatedButton.styleFrom(
//                     shape: StadiumBorder(),
//                     primary: MyColors.primaryColor,
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: Text('To the lake!'),
//       //   icon: Icon(Icons.directions_boat),
//       // ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }