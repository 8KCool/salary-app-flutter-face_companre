//
// import 'package:flutter/material.dart';
// // import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
//
//
//
// import '../constants/globalkey.dart';
// import '../constants/sized_box.dart';
// // import '../widgets/CustomTexts.dart';
// import 'package:geocode/geocode.dart';
//
// import '../widget/CustomTexts.dart';
//
// Future<Position> determinePosition() async {
//   late Position position;
//   // print('je;;o');
//   try {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     print('checking location service');
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     // serviceEnabled =true;
//     print('the ser is $serviceEnabled');
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       print('Error in getting location: Location services are disabled.');
//       showDialog(context: MyGlobalKeys.navigatorKey.currentContext!,
//           builder: (context) {
//             return Dialog(
//               insetPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SubHeadingText(text: 'Failed!!', color: Colors.red,),
//                     hSizedBox,
//                     Center(child: SubHeadingText(
//                       text: 'Please enable location services to continue',))
//                   ],
//                 ),
//               ),
//             );
//           });
//       // return Position(longitude: 75, latitude: 22, timestamp: DateTime.now(), accuracy: 10, altitude: 10, heading: 10, speed: 10, speedAccuracy: 10);
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
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     position = await Geolocator.getCurrentPosition();
//     print("position" + position.toString());
//     // var longitude = double.parse(position.latitude.toString());
//     // var latitude = double.parse(position.longitude.toString());
//     // Coordinates lat_lng=longitude;
//     // getSetAddress(Coordinates(position.latitude, position.longitude));
//     // _getAddress(position.latitude, position.longitude);
//     return position;
//   } catch (e) {
//     // Geolocator.openAppSettings();
//     print('Error in getting current location : $e');
//     position = Position(longitude: 75,
//         latitude: 22,
//         timestamp: DateTime.now(),
//         accuracy: 10,
//         altitude: 10,
//         heading: 10,
//         speed: 10,
//         speedAccuracy: 10);
//     print("position ---else---" + position.toString());
//
//     return position;
//   }
// }
// Future<String> getAddressFromLatLng(double? lat, double? lang) async {
//   if (lat == null || lang == null) return "";
//   GeoCode geoCode = GeoCode();
//   Address address =
//   await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
//   print("address"+address.toString());
//   return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
// }
// //   getSetAddress(Coordinates coordinates) async {
// // var _resultAddress;
// //     final addresses =
// //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
// //      // setState(() {
// //       _resultAddress = addresses.first.addressLine;
// //     // });
// //     return _resultAddress;
// //   }
