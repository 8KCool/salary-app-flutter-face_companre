import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/colors.dart';
import 'package:salaryredesign/constants/constans.dart';
import 'package:salaryredesign/modals/branch.dart';
import 'package:salaryredesign/services/api_urls.dart';
import 'package:salaryredesign/services/webservices.dart';
import 'package:salaryredesign/widgets/CustomLoader.dart';
import 'package:salaryredesign/widgets/CustomTexts.dart';
import 'package:salaryredesign/widgets/appbar.dart';
import 'package:salaryredesign/widgets/buttons.dart';
import 'package:salaryredesign/widgets/customtextfield.dart';
import 'package:salaryredesign/widgets/dropdown.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';

import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../packages/lib/widget/search_widget.dart';
import '../../providers/clock.dart';
import '../../widgets/Alert.dart';
import '../../widgets/GOOGLEMAP.dart';
import '../../widgets/avatar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Add_Branch_Page extends StatefulWidget {
  final bool isEdit;
  final String? id;
  // final BranchModal branchDatail;

   Add_Branch_Page({Key? key,required this.isEdit ,this.id,}) : super(key: key);

  @override
  State<Add_Branch_Page> createState() => _Add_Branch_PageState();
}


class _Add_Branch_PageState extends State<Add_Branch_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController branchAdd = TextEditingController();
  TextEditingController radius = TextEditingController();
  TextEditingController searchAdd = TextEditingController();
  TextEditingController latcontroller = TextEditingController();
  TextEditingController longcontroller = TextEditingController();
  List branchUserList=[];
  String? manager;

  List placemarkaddress=[];
  double currentlat=0;

  double currentlong=0;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng( currentlat, currentlong ),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414
  // );
double lat=0;
double long=0;
  GoogleMapController? mapController; //contrller for Google map
  // LatLng startLocation = LatLng(23.2547 , 77.4029 );
  // LatLng startLocation = LatLng(currentlat,  currentlong);
  getmap()async{
    Position position = await _getGeoLocationPosition();
    print('position--------${position},');
    currentlat=position.latitude;
    currentlong=position.longitude;
    print('position--------${position.latitude},${position.longitude}');
    print('currentlatlong--------${currentlat},${currentlong}');
  }
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  getBranchDetail()async{
    log('branch detail --------}');
    Map<String,dynamic>data={
      'id':widget.id
    };
    Provider.of<GlobalModal>(context, listen: false).loadingShow();
    var res = await Webservices.postData(apiUrl: ApiUrls.editBranch, body: data, context: context);
    Provider.of<GlobalModal>(context, listen: false).loadingHide();

    log('branch detail --------${res['data']['branchDetail']['radius']}');
    branchName.text=res['data']['branchDetail']['name'].toString();
    branchAdd.text=res['data']['branchDetail']['address'];
    latcontroller.text=res['data']['branchDetail']['latitude'];
    longcontroller.text=res['data']['branchDetail']['longitude'];
    radius.text=res['data']['branchDetail']['radius'].toString();
    if(res['data']['branchUserList'].length>0){
      branchUserList=res['data']['branchUserList'];
      if(res['data']['branchDetail']['manager']!=null){
        manager=res['data']['branchDetail']['manager'].toString();

      }
    }


    log('branch detail --------${radius.text}');
 // setState(() {
 //
 // });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


     getlatlong();
    getmap();
    if(widget.isEdit){
      getBranchDetail();
    }
  }
  getlatlong()async{
    await Provider.of<GlobalModal>(context, listen: false).getLocation();
    // currentlat=Provider.of<GlobalModal>(context, listen: false).location?.Lat??0;
    // currentlong=Provider.of<GlobalModal>(context, listen: false).location?.Lng??0;
    latcontroller.text='${Provider.of<GlobalModal>(context, listen: false).location?.Lat.toString()}';
    longcontroller.text='${Provider.of<GlobalModal>(context, listen: false).location?.Lng.toString()}';

    print('latlng---------${latcontroller.text}${longcontroller.text}');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: appBar(context: context, title:widget.isEdit?'Edit Branches':'Add Branches') ,
      body:Consumer<GlobalModal>(
          builder: (context,globalModal,child) {
          return globalModal.load?CustomLoader():SingleChildScrollView(
            child: Padding(
              padding: horizontal_pad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSizedBox4,
                      MainHeadingText(text:widget.isEdit?'Edit Branches':'Add Branches' , color: MyColors.black,),
                      Column(
                        children: [
                          vSizedBox2,
                          CustomTextField(controller: branchName, hintText: '',
                            label: 'Branch Name',
                            showlabel: true,
                            labelcolor: MyColors.black,
                          ),
                          vSizedBox2,
                          GestureDetector(
                            onTap: ()async{
                              var placemarks = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => MapSample(editLat: double.parse(latcontroller.text), editLong: double.parse(longcontroller.text), radius:radius.text!=''?double.parse(radius.text):100,),
                                ),
                              );
                              print('placemarksdddddmizan------${placemarks} ss');
                              print('placemarksaddress------${placemarks['address']}');

                              latcontroller.text=placemarks['lat'].toString();
                              longcontroller.text=placemarks['long'].toString();
                              branchAdd.text=placemarks['address'];
                              searchAdd.text=placemarks['address'];
                              // countryController.text = placemarks['country'];
                              // stateController.text = placemarks['state'];
                              // cityController.text = placemarks['city'];
                              // zipcodeController.text = placemarks['pincode'];
                              // await MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
                            },
                            child: CustomTextField(controller: searchAdd, hintText: '',
                              label: 'Search location on map',
                              showlabel: true,
                              labelcolor: MyColors.black,
                              enabled: false,
                            ),
                          ),
                          // vSizedBox2,
                          // GestureDetector(
                          //   onTap: ()async{
                          //     var placemarks = await Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) => MapSample(editLat: double.parse(latcontroller.text), editLong: double.parse(longcontroller.text), radius:radius.text!=''?double.parse(radius.text):100,),
                          //       ),
                          //     );
                          //     print('placemarksdddddmizan------${placemarks} ss');
                          //     print('placemarksaddress------${placemarks['address']}');
                          //
                          //     latcontroller.text=placemarks['lat'].toString();
                          //     longcontroller.text=placemarks['long'].toString();
                          //     branchAdd.text=placemarks['address'];
                          //     searchAdd.text=placemarks['address'];
                          //     // countryController.text = placemarks['country'];
                          //     // stateController.text = placemarks['state'];
                          //     // cityController.text = placemarks['city'];
                          //     // zipcodeController.text = placemarks['pincode'];
                          //     // await MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
                          //   },
                          //   child: CustomTextField(
                          //     paddingsuffix: 20,
                          //     controller: searchAdd, hintText: '',
                          //     label: 'Search location on map',
                          //     showlabel: true,
                          //     labelcolor: MyColors.black,
                          //     prefixIcon: MyImages.search,
                          //     suffixheight: 24,
                          //     height: 53,
                          //
                          //     // enabled: false,
                          //   ),
                          // ),
                          vSizedBox2,
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //
                          //     Text('Search location on map',textAlign: TextAlign.start,),
                          //     Padding(
                          //       padding: EdgeInsets.only(right: 0,left: 0,top: 15,bottom: 10),
                          //       child: Container(
                          //         margin: EdgeInsets.only(top: 0),
                          //
                          //         // height: 48,
                          //         width: double.infinity,
                          //         // margin: EdgeInsets.symmetric(
                          //         //     horizontal:16 ,vertical:8 ),
                          //         decoration: BoxDecoration(
                          //             color: MyColors.white,
                          //             border: Border.all(
                          //                 color: MyColors.blackcolor70),
                          //             borderRadius: BorderRadius.circular(8)),
                          //         padding: EdgeInsets.only(
                          //             left: 10, right: 10, top: 5, bottom: 5),
                          //         child: SearchLocation(
                          //           controller: searchAdd,
                          //           key: MyGlobalKeys.searchLocationKey,
                          //           apiKey:
                          //           'AIzaSyABk-0Al27H9Ap_Rtti2t0ePxOLvl5QFzk',
                          //           onSelected: (value) async {
                          //
                          //             var temp = await value.geolocation;
                          //             if(temp!=null)
                          //               print('ghehehedhdhdfbn' + temp.coordinates.longitude.toString());
                          //             print('ghehehedhdhdfbn123');
                          //             // addressController.text = value.description;
                          //             print('addressController-----${branchAdd.text}');
                          //             print('ghehehedhdhdfbn456');
                          //             if(temp!=null){
                          //               dynamic l = temp.coordinates;
                          //
                          //               print('ghehehedhdhdfbn789');
                          //               String p = value.placeId;
                          //               print("value from country   ${temp!.coordinates}");
                          //               print('ghehehedhdhdfbn2');
                          //
                          //               print(
                          //                   "value from country   ${l.longitude}");
                          //               print("value from place   ${p.toString()}");
                          //               // print("value from state   }");
                          //               print(
                          //                   "value from city   ${value.description}");
                          //               // print("lat   ${l.latitude.toString()}");
                          //               // print("long   ${l.longitude.toString()}");
                          //               lat = l.latitude;
                          //               long = l.longitude;
                          //               latcontroller.text=l.latitude.toString();
                          //               longcontroller.text=l.longitude.toString();
                          //               print("latlocal   ${lat}");
                          //               print("longlocal   ${long}");
                          //               List<Placemark> placemarks = await placemarkFromCoordinates(l.latitude, l.longitude);
                          //               placemarkaddress=placemarks;
                          //               print("placemarksmapsearch   ${placemarks}");
                          //
                          //               print("placemarks   ${placemarks[0].administrativeArea}");
                          //               searchAdd.text=value.description;
                          //               branchAdd.text = value.description.toString();
                          //
                          //               // countryController.text = placemarks[0].country.toString();
                          //               // stateController.text = placemarks[0].administrativeArea.toString();
                          //               // cityController.text = placemarks[0].locality.toString();
                          //               // zipcodeController.text = placemarks[0].postalCode.toString();
                          //             }
                          //
                          //             LatLng newlatlang = LatLng(lat,long);
                          //             print('current--lat--long---${newlatlang}');
                          //             mapController?.animateCamera(
                          //                 CameraUpdate.newCameraPosition(
                          //                     CameraPosition(target: newlatlang, zoom: 17)
                          //                   //17 is new zoom level
                          //                 )
                          //             );
                          //             _markers.clear();
                          //             _markers.add(
                          //                 Marker(
                          //                     markerId: MarkerId('${_markers.length +1}'),
                          //                     position: LatLng(lat,  long ),
                          //                     // position: LatLng(latlng.latitude,  latlng.longitude ),
                          //                     draggable: true,
                          //                     onDrag: (value)async{
                          //
                          //                       // latlng = value;
                          //                       // placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
                          //                     }
                          //                 )
                          //             );
                          //             setState(() {
                          //             });
                          //           }
                          //
                          //           ,
                          //         ),
                          //
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 200,
                          //       child: Stack(
                          //         // alignment: Alignment.center,
                          //         children: [
                          //
                          //           GoogleMap(
                          //               mapType: MapType.normal,
                          //
                          //               initialCameraPosition: _kGooglePlex,
                          //               onMapCreated: (GoogleMapController controller) {
                          //                 _controller.complete(controller);
                          //                 setState(() {
                          //                   mapController = controller;
                          //                 });
                          //               },
                          //               markers: _markers,
                          //               onTap: (LatLng latlng)async{
                          //                 List<Placemark> placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
                          //                 placemarkaddress=placemarks;
                          //                 // String address ='';
                          //                 print('placemarks----------${placemarks}');
                          //                 var address='${placemarks[0].street.toString()},${placemarks[0].name.toString()},${placemarks[0].locality.toString()},${placemarks[0].country.toString()},${placemarks[0].postalCode.toString()}';
                          //                 print('entireaddress----${address}');
                          //                 print('placemarkscountry----------${ placemarks[0].country.toString()},');
                          //                 print('placemarkscountry----------${ placemarks[0].country.toString()}');
                          //                 print('tappedlatitude----------${latlng.latitude}');
                          //                 print('tappedlongitude----------${latlng.longitude}');
                          //
                          //                 // addressController.text = value.description;
                          //                 // addressController.text= address.toString();
                          //                 lat=latlng.latitude;
                          //                 long=latlng.longitude;
                          //                 latcontroller.text=latlng.latitude.toString();
                          //                 longcontroller.text=latlng.longitude.toString();
                          //                 branchAdd.text = address.toString();
                          //                 // countryController.text = placemarks[0].country.toString();
                          //                 // stateController.text = placemarks[0].administrativeArea.toString();
                          //                 // cityController.text = placemarks[0].locality.toString();
                          //                 // zipcodeController.text = placemarks[0].postalCode.toString();
                          //                 // MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
                          //                 _markers.clear();
                          //                 _markers.add(
                          //                     Marker(
                          //                         markerId: MarkerId('${_markers.length +1}'),
                          //                         // position: LatLng(currentlat,  currentlong ),
                          //                         position: LatLng(latlng.latitude,  latlng.longitude ),
                          //                         draggable: true,
                          //                         onDrag: (value)async{
                          //                           latlng = value;
                          //                           placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
                          //                           var address='${placemarks[0].street.toString()},${placemarks[0].name.toString()},${placemarks[0].locality.toString()},${placemarks[0].country.toString()},${placemarks[0].postalCode.toString()}';
                          //                           MyGlobalKeys.searchLocationKey.currentState?.updateTextField(address);
                          //                         }
                          //                     )
                          //                 );
                          //                 setState(() {
                          //                 });
                          //               }
                          //           ),
                          //           // Positioned(
                          //           //   bottom:20,
                          //           //   left: 20,
                          //           //   child: ElevatedButton(
                          //           //     onPressed: () async {
                          //           //       print('AddAddresstaped----');
                          //           //       // print('placemarkaddress2-----${placemarkaddress}');
                          //           //       //  placemarkaddress[0]['searchfield']=searchlocationController.text;
                          //           //       // Map address1={
                          //           //       //   "address": searchlocationController.text,
                          //           //       //   "lat":lat,
                          //           //       //   "long":long,
                          //           //       //   "city": cityController.text,
                          //           //       //   "state": stateController.text,
                          //           //       //   "country":countryController.text,
                          //           //       //   "pincode":zipcodeController.text,
                          //           //       // };
                          //           //       // print('address1-----${address1}');
                          //           //       // Navigator.pop(context,address1);
                          //           //
                          //           //     },
                          //           //     child: Text('Done'),
                          //           //     style: ElevatedButton.styleFrom(
                          //           //       shape: StadiumBorder(),
                          //           //       primary: MyColors.primaryColor,
                          //           //     ),
                          //           //   ),
                          //           // ),
                          //
                          //         ],
                          //       ),
                          //
                          //       // child: GoogleMap(
                          //       //   mapType: MapType.normal,
                          //       //   initialCameraPosition: _kGooglePlex,
                          //       //   onMapCreated: (GoogleMapController controller) {
                          //       //     _controller.complete(controller);
                          //       //     setState(() {
                          //       //       mapController = controller;
                          //       //     });
                          //       //   },
                          //       //   markers: _markers,
                          //       // ),
                          //     ),
                          //   ],
                          // ),
                          // // Image.asset(MyImages.google_map),
                          // vSizedBox2,
                          CustomTextField(controller: branchAdd, hintText: '',
                            label: 'Branch Address',
                            showlabel: true,
                            labelcolor: MyColors.black,
                            maxLines: 4,
                            height: 60,
                          ),
                          vSizedBox2,
                          CustomTextField(controller: latcontroller, hintText: '',
                            label: 'Lattitude',
                            showlabel: true,
                            labelcolor: MyColors.black,
                          ),
                          vSizedBox2,
                          CustomTextField(controller: longcontroller, hintText: '',
                            label: 'Longitude',
                            showlabel: true,
                            labelcolor: MyColors.black,
                          ),
                          vSizedBox2,

                          CustomTextField(controller: radius, hintText: '',
                            label: 'Limit Attendance Taking Radius (in meters)',
                            showlabel: true,
                            keyboardtype: TextInputType.number,
                            labelcolor: MyColors.black,
                          ),
                          vSizedBox2,
                          if(widget.isEdit && branchUserList.length>0)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text('Assign Branch Head / Branch Manager',)]),
                            vSizedBox,
                          if(widget.isEdit && branchUserList.length>0)
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                border: Border.all(color: MyColors.blackcolor70),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: DropdownButton<String>(
                                underline: Container(
                                  height: 8,
                                ),
                                hint: Text('Select Manager'),
                                value: manager,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ),
                                elevation: 0,
                                isExpanded: true,
                                alignment: Alignment.centerLeft,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) async {
                                  globalModal.loadingShow();
                                  manager = newValue!;
                                  globalModal.loadingHide();
                                  print('id' + manager.toString());


                                },

                                items: branchUserList.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e['id'].toString(),
                                    child: Text(e['name']),
                                  );
                                }).toList(),

                                //     .map<DropdownMenuItem<String>>((String value) {
                                //   return DropdownMenuItem<String>(
                                //     value: value,
                                //     child: Text(value),
                                //   );
                                // }).toList(),
                              ),
                            ),
                          // CustomTextField(controller: name, hintText: '',
                          //   label: 'Assign Branch Head / Branch Manager',
                          //   showlabel: true,
                          //
                          //   labelcolor: MyColors.black,
                          //   prefixIcon: MyImages.search,
                          //   suffixheight: 24,
                          // ),
                          vSizedBox2,
                          RoundEdgedButton(
                              text: 'Save',
                            onTap: ()async{
                                print('object');
                                if(branchName.text==''){
                                showSnackbar(context, 'Please Enter your Branch name.');
                                }else if(branchAdd.text==''){
                               showSnackbar(context, 'Please Enter your Branch Address.');
                                }else if(radius.text==''){
                                  showSnackbar(context, 'Please Enter Limit Attendance Taking Radius (in meters).');
                                }
                                else{
                                  var apiurl=ApiUrls.storeBranch;
                                  Map<String , dynamic>data={
                                    'name':branchName.text,
                                    'address':branchAdd.text,
                                    'radius':radius.text,
                                    'latitude':latcontroller.text,
                                    'longitude':longcontroller.text
                                  };
                                  if(widget.isEdit){
                                    data['id']=widget.id.toString();
                                    if(manager!=null && manager!=''){
                                      data['manager']=manager.toString();
                                    }
                                    apiurl=ApiUrls.updateBranch;
                                  }

                                  globalModal.loadingShow();
                                  print('datat for api- ${data}');
                                  var res = await Webservices.postData(apiUrl: apiurl, body: data, context: context);
                                  if(res['success'].toString()=='true'){
                                    globalModal.loadingHide();
                                    // showMyDialog(res['message'], context, true);
                                    showSnackbar(context, res['message']);
                                    globalModal.getBranch(context);
                                    Navigator.pop(context);
                                  }
                                  else{
                                    // showMyDialog(res['message'], context, false);
                                    Navigator.pop(context);
                                  }

                                }
                            },
                          ),
                          vSizedBox4,
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
