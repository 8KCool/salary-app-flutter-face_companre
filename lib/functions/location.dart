
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
Future<Position> determinePosition() async {
  // print('je;;o');
  var position;
  // var address;
  try{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    print('checking location service');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // serviceEnabled =true;
    print('the ser is $serviceEnabled');
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('Error in getting location: Location services are disabled.');
      // return Position(longitude: 75, latitude: 22, timestamp: DateTime.now(), accuracy: 10, altitude: 10, heading: 10, speed: 10, speedAccuracy: 10);
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position =  await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    return  position;
    // lat = position.latitude;
    // lng = position.longitude;
    // List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    // print('address----$placemarks');

  }catch(e){
    // Geolocator.openAppSettings();
    print('Error in getting current location : $e');
    position =  Position(longitude: 77.4126, latitude: 23.2599, timestamp: DateTime.now(), accuracy: 10, altitude: 10, heading: 10, speed: 10, speedAccuracy: 10);
    return position;
  }
}
// Future<String> getAddressFromLatLng(double? lat, double? lang) async {
//   if (lat == null || lang == null) return "";
//   GeoCode geoCode = GeoCode();
//   try{
//     Address address =
//     // await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
//     // List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
//     print("address"+address.toString());
//     return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
//   }catch(err){
//     print('err from reverseGeocoding()-----------${err}');
//     return '';
//   }
//
// }
Future<String> getAddressFromLatLng(double? lat, double? lang) async {
  if (lat == null || lang == null) return "";

  try{

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    print("address ---------------${placemarks[0].toString()}");
    return '${placemarks[0].street} , ${placemarks[0].name} ${placemarks[0].postalCode} ${placemarks[0].country}';

  }catch(err){
    print('err from reverseGeocoding()-----------${err}');
    return '';
  }

}