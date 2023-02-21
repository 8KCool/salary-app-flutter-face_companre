
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../constants/colors.dart';
import '../../constants/globalFunction.dart';
import '../../constants/globalkeys.dart';
import '../../constants/image_urls.dart';
import '../../constants/sized_box.dart';
import '../../functions/navigation_functions.dart';
import '../../main.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomLoader.dart';
import '../../widgets/CustomTexts.dart';
import '../../widgets/avatar.dart';
import '../../widgets/buttons.dart';
import '../../widgets/showSnackbar.dart';
import '../face_recognition/face_recognition_processing.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' as io;
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter_face_api_beta/face_api.dart' as Regula;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


/// Camera example home widget.
class FaceCameraAttendance extends StatefulWidget {
  final String phone;
  /// Default Constructor
  const FaceCameraAttendance({Key? key,required this.phone}) : super(key: key);

  @override
  State<FaceCameraAttendance> createState() {
    return _FaceCameraAttendanceState();
  }
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
    default:
      throw ArgumentError('Unknown lens direction');
  }
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

class _FaceCameraAttendanceState extends State<FaceCameraAttendance>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;
  bool enableAudio = true;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  // Counting pointers (number of user fingers on screen)
  int _pointers = 0;
  String workingHours = '';
  bool load=false;
  Map att_detail={};
  var image1 = new Regula.MatchFacesImage();
  var image2 = new Regula.MatchFacesImage();
  var img1 = Image.asset('assets/images/face_recog.png');
  var img2 = Image.asset('assets/images/face_recog.png');
  String _similarity = "nil";
  String _liveness = "nil";

  getDetails() async {
    try{
      var m = Provider.of<GlobalModal>(context, listen: false).location;
      print('object-----222---${Provider.of<GlobalModal>(context, listen: false).location}');
      // Provider.of<GlobalModal>(context, listen: false).location
      if(m!=null){
        Map<String, dynamic> data = {"mobile_number":widget.phone};
        Provider.of<GlobalModal>(context, listen: false).load=true;
        var res = await Webservices.postData(
            apiUrl: ApiUrls.faceattendance, body: data, context: context);
        log("res from qrattendance------------$res");
        Provider.of<GlobalModal>(context, listen: false).load=false;
        if (res['success'].toString() == 'true') {
          att_detail = res;
          setState((){});

          log("res from qrattendance------------$att_detail");
          print("${widget.phone} ----- ${att_detail['data']['userData']['face_image']}");

          print('res from api ${res['data']['today_attendance']['inTime']}');
          if (res['data']['today_attendance']['inTime'] != null) {
            // is_in = true;
          }
          if (res['data']['today_attendance']['inTime'] != null &&
              res['data']['today_attendance']['outTime'] == null) {
            // is_out = true;
          }
          if (res['data']['today_attendance']['inTime'] != null &&
              res['data']['today_attendance']['outTime'] != null) {
            print('working hours-----------');



            workingHours = '${att_detail['data']['today_attendance']['workinHours']}';
            // workingHoursBreak = '${res['data']['today_break']['workinhours']}';

          }
        }
        else{
          showSnackbar(context, res['message']);
          message=res['message'];
          // _showMyDialog();
          // }
        }
      }
      else{
        // message='Please turn on your location';
        //
        // _showMyDialog();
      }

    }catch(err){
      // message='Please turn on location';
      //
      // _showMyDialog();
    }
    // print('location---------------${Provider.of<GlobalModal>(context, listen: false).location}');






  }
  addtoStorage()async{
    final path = await getExternalStorageDirectory();
    var filePathAndName = path!.path + '/'+'liveness.png';

    final imgBase64Str = await networkImageToBase64(Uri.parse(att_detail['data']['userData']['face_image']));
    print("image--------------");
    print(imgBase64Str);
    // await filePathAndName.writeAsBytes(imgBase64Str.bodyBytes);
    var  file = await File(filePathAndName).writeAsBytes((imgBase64Str!));
    print("  sefdreg ty tyj ${await file.exists()}");
  }
  @override
  void initState() {
    super.initState();

    print("mobile number--------------${widget.phone}");
    Provider.of<GlobalModal>(context, listen: false).getLocation();
    // getLocation();
    getDetails();
    if(faceAtt['data']!=null){
      // workingHours = '${faceAtt['data']['today_attendance']['workinHours']}';

    }
    // print('dgfgsrfhdgfh--------------${faceAtt['data']['today_attendance']['workinHours']}');
    // WidgetsBinding.instance.addObserver(this);
    //
    // _flashModeControlRowAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _flashModeControlRowAnimation = CurvedAnimation(
    //   parent: _flashModeControlRowAnimationController,
    //   curve: Curves.easeInCubic,
    // );
    // _exposureModeControlRowAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _exposureModeControlRowAnimation = CurvedAnimation(
    //   parent: _exposureModeControlRowAnimationController,
    //   curve: Curves.easeInCubic,
    // );
    // _focusModeControlRowAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _focusModeControlRowAnimation = CurvedAnimation(
    //   parent: _focusModeControlRowAnimationController,
    //   curve: Curves.easeInCubic,
    // );
    // // cameras=[CameraDescription(1, CameraLensDirection.front, 270)];
    // if(frontCamera!=null)
    //   onNewCameraSelected(frontCamera!);
    // //
    // //
    // // Future.delayed(Duration(seconds: 3)).then((value) async {
    // //
    // //   final CameraController? cameraController = controller;
    // //   if( cameraController != null &&
    // //       cameraController.value.isInitialized &&
    // //       !cameraController.value.isRecordingVideo
    // //   ){
    // //     onTakePictureButtonPressed();
    // //
    // //   }
    // //   else{
    //
    //   // }
    // // });

  }
  Widget createImage(image, VoidCallback onPress) => Material(
      child: InkWell(
        onTap: onPress,
        child: Container(
          // color: Colors.red,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(image: image,fit: BoxFit.cover,),
          ),
        ),
      ));
  setImage(bool first, Uint8List? imageFile, int type) {
print("imageFileimageFile-----------${imageFile}");
    if (imageFile == null) return;
    setState(() => _similarity = "nil");
    if (first) {
      image1.bitmap = base64Encode(imageFile);
      image1.imageType = type;
      print("image1---------------${image1}");
      setState(() {
        img1 = Image.memory(imageFile);
        _liveness = "nil";

      });
      print("  ankiya-1--------image1----------------");
    } else {
      image2.bitmap = base64Encode(imageFile);
      image2.imageType = type;
      setState(() => img2 = Image.memory(imageFile));
      print("image2---------------${image2}");
      print("  ankiya-1------------image2------------");
    }
  }
  matchFaces(currentFile) async{
    await  Provider.of<GlobalModal>(context, listen: false).loadingShow();

    print("matchFaced---called-----------");
    final path = await getExternalStorageDirectory();
    var filePathAndName = path!.path + '/'+'liveness.png';
    print("filePathAndName---------check file exit or not-----${filePathAndName}");
    if(widget.phone==''){
      try{
        setImage(
            false,
            io.File(filePathAndName).readAsBytesSync(),
            Regula.ImageType.PRINTED);
        print("image for match-1-----------${image1.bitmap}-------------");
        print("image for match-2----------${image2.bitmap}----------");
        // if (image1.bitmap == null ||
        //     image1.bitmap == "" ||
        //     image2.bitmap == null ||
        //     image2.bitmap == "") return;
        if(filePathAndName!=null || filePathAndName!=''){
          print(" file exist in storage-----------------------");

          setState(() => _similarity = "Processing...");
          var request = new Regula.MatchFacesRequest();
          print("  ankiya-2--------------if----------");

          request.images = [image1, image2];
          Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
            print("value---------------${value}");
            var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
            print("response-----if----------${response}");

            Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
                jsonEncode(response!.results), 0.75)
                .then((str) {
              print("str----if-----------${str}");

              var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
                  json.decode(str));
              setState(() => _similarity = split!.matchedFaces.length > 0
                  ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
                  "%")
                  : "error");
              print("_similarity------1--------${_similarity.split('%')[0]}");

              if(_similarity!='error'){
                if(double.parse(_similarity.split('%')[0])>90){

                   Provider.of<GlobalModal>(context, listen: false).loadingShow();


                  showPop('');
                }
              }

              else{
                showSnackbar(context, "Face is not match with your registered face.Please try again or contact to your admin!!");
              }

            });
          });
        }
        else{
          print("file not exist in storage-------------");
          final imgBase64Str = await networkImageToBase64(Uri.parse(att_detail['data']['userData']['face_image']));
          print("image--------else------");
          print(imgBase64Str);
          // File file = File(att_detail['data']['userData']['face_image']);
          // Uint8List uint8list = await file.readAsBytesSync();

          setImage(false, imgBase64Str,
              Regula.ImageType.LIVE);

          setState(() => _similarity = "Processing...");
          var request = new Regula.MatchFacesRequest();
          print("  ankiya-2----------else--------------");
          request.images = [image1, image2];
          Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
            print("value---------------${value}");
            var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
            print("response----else-----------${response}");

            Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
                jsonEncode(response!.results), 0.75)
                .then((str) {
              print("str--------else-------${str}");

              var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
                  json.decode(str));
              setState(() => _similarity = split!.matchedFaces.length > 0
                  ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
                  "%")
                  : "error");
              print("_similarity--------2------${_similarity.split('%')[0]}");

              if(_similarity!='error'){
                if(double.parse(_similarity.split('%')[0])>90){

                  Provider.of<GlobalModal>(context, listen: false).loadingShow();


                  showPop('');
                  /// now image store at storage
                  addtoStorage();
                }
              }

              else{
                showSnackbar(context, "Face is not match with your registered face.Please try again or contact to your admin!!");

              }

            });
          });
        // }
        }
      }catch(err){print("errr-------------${err}");
      final newpath = await getExternalStorageDirectory();
      var filePathAndName = newpath!.path + '/'+'liveness.png';
      var  file = await File(filePathAndName).writeAsBytes(currentFile);
      print("file------------${file}  ${file.runtimeType}");
      final imgBase64Str = await networkImageToBase64(Uri.parse(att_detail['data']['userData']['face_image']));
      print("image--------------");
      print(imgBase64Str);
      setImage(false, imgBase64Str,
          Regula.ImageType.LIVE);
      print("image for match-1----obj-------${image1.bitmap}-------------");
      print("image for match-2-----obj-----${image2.bitmap}----------");
      setState(() => _similarity = "Processing...");
      var request = new Regula.MatchFacesRequest();

      request.images = [image1, image2];

      Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
        print("value---------------${value}");
        var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
        print("response---------------${response}");

        Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
            jsonEncode(response!.results), 0.75)
            .then((str) {
          print("str---------------${str}");

          var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
              json.decode(str));
          setState(() => _similarity = split!.matchedFaces.length > 0
              ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
              "%")
              : "error");
          print("_similarity-------3-------${_similarity.split('%')[0]}");
          if(_similarity!='error'){
            if(double.parse(_similarity.split('%')[0])>90){

               Provider.of<GlobalModal>(context, listen: false).loadingShow();


              showPop('');
              addtoStorage();
            }
          }

          else{
            showSnackbar(context, "Face is not match with your registered face.Please try again or contact to your admin!!");

          }

        });
      });
      // showPop(file);
      }

    }

    else{
      print("face attendance by other people-------------");
      print("${widget.phone} ----- ${att_detail['data']['userData']['face_image']}");
      final imgBase64Str = await networkImageToBase64(Uri.parse(att_detail['data']['userData']['face_image']));
      print("image--------------");
      print(imgBase64Str);
      // File file = File(att_detail['data']['userData']['face_image']);
      // Uint8List uint8list = await file.readAsBytesSync();

      setImage(false, imgBase64Str,
          Regula.ImageType.LIVE);

      setState(() => _similarity = "Processing...");
      var request = new Regula.MatchFacesRequest();
      print("  ankiya-2------------------------");
      request.images = [image1, image2];
      Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
        print("value---------------${value}");
        var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
        print("response---------------${response}");

        Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
            jsonEncode(response!.results), 0.75)
            .then((str) {
          print("str---------------${str}");

          var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
              json.decode(str));
          setState(() => _similarity = split!.matchedFaces.length > 0
              ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
              "%")
              : "error");
          print("_similarity--------2------${_similarity.split('%')[0]}");

          if(_similarity!='error'){
            if(double.parse(_similarity.split('%')[0])>90){

               Provider.of<GlobalModal>(context, listen: false).loadingShow();


              showPop('');
            }
          }

          else{
            showSnackbar(context, "Face is not match with your registered face.Please try again or contact to your admin!!");

          }

        });
      });
    }

    // else{
    //   showPop(image1);
    // }

  }
  Future<Uint8List?> networkImageToBase64(imageUrl) async {
    http.Response response = await http.get(imageUrl);
    final bytes = response?.bodyBytes;
    return bytes;
    // return (bytes != null ? base64Encode(bytes) : null);
  }
  liveness() async{
    await  Provider.of<GlobalModal>(context, listen: false).loadingShow();
    Regula.FaceSDK.startLiveness().then((value) async{
      print("value from liveness---------------$value");
      var result = Regula.LivenessResponse.fromJson(json.decode(value));
      print("result from LivenessResponse---------------$result");
      setImage(true, base64Decode(result!.bitmap!.replaceAll("\n", "")),
          Regula.ImageType.LIVE);
      try{
        if(result.liveness == 0 ){
          matchFaces(base64Decode(result!.bitmap!.replaceAll("\n", "")));
        }
        else{
          showSnackbar(context,"Something went wrong Please try again later!");
        }

      }catch(err){
        print("error from match img-----------$err");
      }
      print("_liveness from ---------------${result.liveness}");
      print("image from ---------------${img1.image.runtimeType}");

      setState(() {
        print("_liveness from ---------------${result.liveness}");

        _liveness = result.liveness == 0 ? "passed" : "unknown";
      });

    });
  }



  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   _flashModeControlRowAnimationController.dispose();
  //   _exposureModeControlRowAnimationController.dispose();
  //   super.dispose();
  // }

  // #docregion AppLifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }
  // #enddocregion AppLifecycle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Attendance'),
      ),
      body:Provider.of<GlobalModal>(context, listen: false).load==true?CustomLoader(): SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 0),
              height: MediaQuery.of(context).size.height - 161,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    vSizedBox4,
                    // if (attendance)
                    Column(
                      children: [
                        // vSizedBox2,
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DigitalClock(
                              areaDecoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              hourMinuteDigitTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                              ),
                              amPmDigitTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              areaWidth: 250,
                              secondDigitTextStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 50,
                              ),
                            ),

                          ],
                        ),
                        // MainHeadingText(text: '08:54:45 AM', fontSize: 32,),
                        vSizedBox05,
                        ParagraphText(
                          text:
                          '${DateFormat.EEEE().format(DateTime.parse(DateTime.now().toString()))}, ${DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()))}',
                        ),

                        vSizedBox4,
                        // GestureDetector(
                        //   onTap: () async {
                        //     // liveness();
                        //   },
                        //   child: Container(
                        //     height: 260,
                        //     width: 298,
                        //     // child: _buildQrView(context),
                        //     decoration: BoxDecoration(
                        //         borderRadius:
                        //         BorderRadius.circular(16),
                        //         color: Color(0xFFD9D9D9)
                        //       ),
                        //     child:
                        //
                        //     createImage(img1.image, () {
                        //       if(att_detail['data']['today_attendance']['outTime']==null ||att_detail['data']['today_attendance']['outTime']=='' || att_detail['data']['today_attendance']['inTime']==null ||att_detail['data']['today_attendance']['inTime']=='' ){
                        //         liveness();
                        //       }
                        //       else{
                        //         showSnackbar(context, "Already you punched");
                        //       }
                        //     })
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: (){
                            if(att_detail['data']['today_attendance']['outTime']==null ||att_detail['data']['today_attendance']['outTime']=='' || att_detail['data']['today_attendance']['inTime']==null ||att_detail['data']['today_attendance']['inTime']=='' ){
                              liveness();
                            }
                            else{
                              showSnackbar(context, "Already you punched");
                            }
                          },
                          child: Container(
                                height: 260,
                                width: 298,
                            // child: _buildQrView(context),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    16),
                                color: Colors.grey),
                          ),
                        ),
                        vSizedBox,
                        // GestureDetector(
                        //   onTap: () async {
                        //
                        //     globalModal.loadingShow();
                        //     is_scan = true;
                        //     globalModal.loadingHide();
                        //     Future.delayed(
                        //         Duration(milliseconds: 100))
                        //         .then((value) {
                        //       controller?.resumeCamera();
                        //       // setState(() {
                        //       // });
                        //     });
                        //     try {
                        //       Future.delayed(Duration(seconds: 2))
                        //           .then((value) {
                        //         controller?.resumeCamera();
                        //         // setState(() {
                        //         // });
                        //       });
                        //     } catch (e) {
                        //       print('Error in catch block $e');
                        //     } // Barcode? result = await push(context: MyGlobalKeys.navigatorKey.currentContext!, screen: ScanQrToJoinGroupPage());
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(4.0),
                        //     child: Text('Click here to scan QR'),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: ()async{
                            liveness();




                            // File file = File(att_detail['data']['userData']['face_image']);
                            // Uint8List uint8list = await file.readAsBytesSync();
                          },
                          child: Image.asset(
                            MyImages.camera_turn,
                            height: 24,
                          ),
                        ),
                        // vSizedBox4,

                        Row(
                          children: [
                            hSizedBox,

                          ],
                        ),
                        vSizedBox4,
                        vSizedBox4,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  MainHeadingText(
                                    text: att_detail['data']['today_attendance']['inTime']??'--:--',
                                    fontSize: 24,
                                    color: MyColors.primaryColor,
                                  ),
                                  GestureDetector(

                                    child: ParagraphText(
                                      text: 'Punch In',
                                      fontFamily: 'bold',
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  MainHeadingText(
                                    text: att_detail['data']['today_attendance']['outTime']??'--:--',

                                    fontSize: 24,
                                    color: MyColors.primaryColor,
                                  ),
                                  GestureDetector(
                                    child: ParagraphText(
                                      text: 'Punch Out',
                                      fontFamily: 'bold',
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  MainHeadingText(
                                    text: workingHours=="" || workingHours=="0"?'--:--':workingHours,

                                    fontSize: 24,
                                    color: MyColors.primaryColor,
                                  ),
                                  ParagraphText(
                                    text: 'Working Hrs',
                                    fontFamily: 'bold',
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
            ),
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(
            //         color:
            //         controller != null && controller!.value.isRecordingVideo
            //             ? Colors.redAccent
            //             : Colors.grey,
            //         width: 3.0,
            //       ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(1.0),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text('wait for a minute...'),
            //           ),
            //           Center(
            //             child: _cameraPreviewWidget(),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // // _captureControlRowWidget(),
            // // _modeControlRowWidget(),
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Row(
            //     children: <Widget>[
            //       // _cameraTogglesRowWidget(),
            //       // _thumbnailWidget(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onScaleStart: _handleScaleStart,
                  onScaleUpdate: _handleScaleUpdate,
                  onTapDown: (TapDownDetails details) =>
                      onViewFinderTap(details, constraints),
                );
              }),
        ),
      );
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller!.setZoomLevel(_currentScale);
  }

  /// Display the thumbnail of the captured image or video.
  Widget _thumbnailWidget() {
    final VideoPlayerController? localVideoController = videoController;

    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (localVideoController == null && imageFile == null)
              Container()
            else
              SizedBox(
                width: 64.0,
                height: 64.0,
                child: (localVideoController == null)
                    ? (
                    // The captured image on the web contains a network-accessible URL
                    // pointing to a location within the browser. It may be displayed
                    // either with Image.network or Image.memory after loading the image
                    // bytes to memory.
                    kIsWeb
                        ? Image.network(imageFile!.path)
                        : Image.file(File(imageFile!.path)))
                    : Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink)),
                  child: Center(
                    child: AspectRatio(
                        aspectRatio:
                        localVideoController.value.size != null
                            ? localVideoController.value.aspectRatio
                            : 1.0,
                        child: VideoPlayer(localVideoController)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Display a bar with buttons to change the flash and exposure modes
  Widget _modeControlRowWidget() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.flash_on),
              color: Colors.blue,
              onPressed: controller != null ? onFlashModeButtonPressed : null,
            ),
            // The exposure and focus mode are currently not supported on the web.
            ...!kIsWeb
                ? <Widget>[
              IconButton(
                icon: const Icon(Icons.exposure),
                color: Colors.blue,
                onPressed: controller != null
                    ? onExposureModeButtonPressed
                    : null,
              ),
              IconButton(
                icon: const Icon(Icons.filter_center_focus),
                color: Colors.blue,
                onPressed:
                controller != null ? onFocusModeButtonPressed : null,
              )
            ]
                : <Widget>[],
            IconButton(
              icon: Icon(enableAudio ? Icons.volume_up : Icons.volume_mute),
              color: Colors.blue,
              onPressed: controller != null ? onAudioModeButtonPressed : null,
            ),
            IconButton(
              icon: Icon(controller?.value.isCaptureOrientationLocked ?? false
                  ? Icons.screen_lock_rotation
                  : Icons.screen_rotation),
              color: Colors.blue,
              onPressed: controller != null
                  ? onCaptureOrientationLockButtonPressed
                  : null,
            ),
          ],
        ),
        _flashModeControlRowWidget(),
        _exposureModeControlRowWidget(),
        _focusModeControlRowWidget(),
      ],
    );
  }

  Widget _flashModeControlRowWidget() {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.flash_off),
              color: controller?.value.flashMode == FlashMode.off
                  ? Colors.orange
                  : Colors.blue,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_auto),
              color: controller?.value.flashMode == FlashMode.auto
                  ? Colors.orange
                  : Colors.blue,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.flash_on),
              color: controller?.value.flashMode == FlashMode.always
                  ? Colors.orange
                  : Colors.blue,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always)
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.highlight),
              color: controller?.value.flashMode == FlashMode.torch
                  ? Colors.orange
                  : Colors.blue,
              onPressed: controller != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _exposureModeControlRowWidget() {
    final ButtonStyle styleAuto = TextButton.styleFrom(
      // TODO(darrenaustin): Migrate to new API once it lands in stable: https://github.com/flutter/flutter/issues/105724
      // ignore: deprecated_member_use
      primary: controller?.value.exposureMode == ExposureMode.auto
          ? Colors.orange
          : Colors.blue,
    );
    final ButtonStyle styleLocked = TextButton.styleFrom(
      // TODO(darrenaustin): Migrate to new API once it lands in stable: https://github.com/flutter/flutter/issues/105724
      // ignore: deprecated_member_use
      primary: controller?.value.exposureMode == ExposureMode.locked
          ? Colors.orange
          : Colors.blue,
    );

    return SizeTransition(
      sizeFactor: _exposureModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text('Exposure Mode'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: styleAuto,
                    onPressed: controller != null
                        ? () =>
                        onSetExposureModeButtonPressed(ExposureMode.auto)
                        : null,
                    onLongPress: () {
                      if (controller != null) {
                        controller!.setExposurePoint(null);
                        showInSnackBar('Resetting exposure point');
                      }
                    },
                    child: const Text('AUTO'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () =>
                        onSetExposureModeButtonPressed(ExposureMode.locked)
                        : null,
                    child: const Text('LOCKED'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () => controller!.setExposureOffset(0.0)
                        : null,
                    child: const Text('RESET OFFSET'),
                  ),
                ],
              ),
              const Center(
                child: Text('Exposure Offset'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(_minAvailableExposureOffset.toString()),
                  Slider(
                    value: _currentExposureOffset,
                    min: _minAvailableExposureOffset,
                    max: _maxAvailableExposureOffset,
                    label: _currentExposureOffset.toString(),
                    onChanged: _minAvailableExposureOffset ==
                        _maxAvailableExposureOffset
                        ? null
                        : setExposureOffset,
                  ),
                  Text(_maxAvailableExposureOffset.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _focusModeControlRowWidget() {
    final ButtonStyle styleAuto = TextButton.styleFrom(
      // TODO(darrenaustin): Migrate to new API once it lands in stable: https://github.com/flutter/flutter/issues/105724
      // ignore: deprecated_member_use
      primary: controller?.value.focusMode == FocusMode.auto
          ? Colors.orange
          : Colors.blue,
    );
    final ButtonStyle styleLocked = TextButton.styleFrom(
      // TODO(darrenaustin): Migrate to new API once it lands in stable: https://github.com/flutter/flutter/issues/105724
      // ignore: deprecated_member_use
      primary: controller?.value.focusMode == FocusMode.locked
          ? Colors.orange
          : Colors.blue,
    );

    return SizeTransition(
      sizeFactor: _focusModeControlRowAnimation,
      child: ClipRect(
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text('Focus Mode'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: styleAuto,
                    onPressed: controller != null
                        ? () => onSetFocusModeButtonPressed(FocusMode.auto)
                        : null,
                    onLongPress: () {
                      if (controller != null) {
                        controller!.setFocusPoint(null);
                      }
                      showInSnackBar('Resetting focus point');
                    },
                    child: const Text('AUTO'),
                  ),
                  TextButton(
                    style: styleLocked,
                    onPressed: controller != null
                        ? () => onSetFocusModeButtonPressed(FocusMode.locked)
                        : null,
                    child: const Text('LOCKED'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    final CameraController? cameraController = controller;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt),
          // color: Colors.red,
          onPressed: cameraController != null &&
              cameraController.value.isInitialized &&
              !cameraController.value.isRecordingVideo
              ? null
              : null,
        ),
        // IconButton(
        //   icon: const Icon(Icons.videocam),
        //   color: Colors.blue,
        //   onPressed: cameraController != null &&
        //       cameraController.value.isInitialized &&
        //       !cameraController.value.isRecordingVideo
        //       ? onVideoRecordButtonPressed
        //       : null,
        // ),
        // IconButton(
        //   icon: cameraController != null &&
        //       cameraController.value.isRecordingPaused
        //       ? const Icon(Icons.play_arrow)
        //       : const Icon(Icons.pause),
        //   color: Colors.blue,
        //   onPressed: cameraController != null &&
        //       cameraController.value.isInitialized &&
        //       cameraController.value.isRecordingVideo
        //       ? (cameraController.value.isRecordingPaused)
        //       ? onResumeButtonPressed
        //       : onPauseButtonPressed
        //       : null,
        // ),
        // IconButton(
        //   icon: const Icon(Icons.stop),
        //   color: Colors.red,
        //   onPressed: cameraController != null &&
        //       cameraController.value.isInitialized &&
        //       cameraController.value.isRecordingVideo
        //       ? onStopButtonPressed
        //       : null,
        // ),
        // IconButton(
        //   icon: const Icon(Icons.pause_presentation),
        //   color:
        //   cameraController != null && cameraController.value.isPreviewPaused
        //       ? Colors.red
        //       : Colors.blue,
        //   onPressed:
        //   cameraController == null ? null : onPausePreviewButtonPressed,
        // ),
      ],
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    final List<Widget> toggles = <Widget>[];

    void onChanged(CameraDescription? description) {
      if (description == null) {
        return;
      }

      onNewCameraSelected(description);
    }

    if (cameras.isEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        showInSnackBar('No camera found.');
      });
      return const Text('None');
    } else {
      for (final CameraDescription cameraDescription in cameras) {
        toggles.add(
          SizedBox(
            width: 90.0,
            child: RadioListTile<CameraDescription>(
              title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
              groupValue: controller?.description,
              value: cameraDescription,
              onChanged:

              controller != null && controller!.value.isRecordingVideo
                  ? null
                  : onChanged,
              //   CameraDescription(1, CameraLensDirection.front, 270)
              // onChanged:(value){
              //   print('value---------$value');
              // },
            ),
          ),
        );
      }
    }

    return Row(children: toggles);
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final CameraController? oldController = controller;
    if (oldController != null) {
      // `controller` needs to be set to null before getting disposed,
      // to avoid a race condition when we use the controller that is being
      // disposed. This happens when camera permission dialog shows up,
      // which triggers `didChangeAppLifecycleState`, which disposes and
      // re-creates the controller.
      controller = null;
      await oldController.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        // The exposure mode is currently not supported on the web.
        ...!kIsWeb
            ? <Future<Object?>>[
          cameraController.getMinExposureOffset().then(
                  (double value) => _minAvailableExposureOffset = value),
          cameraController
              .getMaxExposureOffset()
              .then((double value) => _maxAvailableExposureOffset = value)
        ]
            : <Future<Object?>>[],
        cameraController
            .getMaxZoomLevel()
            .then((double value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((double value) => _minAvailableZoom = value),
      ]);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
        // iOS only
          showInSnackBar('Please go to Settings app to enable camera access.');
          break;
        case 'CameraAccessRestricted':
        // iOS only
          showInSnackBar('Camera access is restricted.');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
        // iOS only
          showInSnackBar('Please go to Settings app to enable audio access.');
          break;
        case 'AudioAccessRestricted':
        // iOS only
          showInSnackBar('Audio access is restricted.');
          break;
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) async{
      File n = await File(file!.path);
      if (mounted) {
        setState(() {
          imageFile = file;
          videoController?.dispose();
          videoController = null;
        });
        if (file != null) {
  print('object--file');
          // showPop(n);
  await showCustomDialogBox(
      context:context,
      child: Column(
        children: [
          vSizedBox,
          ParagraphText(
            text: 'Are you sure?',
            color: MyColors.black,
            fontFamily: 'bold',
          ),
          vSizedBox,
          CircleAvatarcustom(
            isnetwork:true,
            image:
            '${Provider.of<GlobalModal>(context, listen: false).userData!.profileImg}',
          ),
          vSizedBox2,
          Row(
            children: [
              Image.asset(
                MyImages.time,
                height: 20,
                width: 20,
              ),
              hSizedBox,
              Expanded(
                  child: ParagraphText(
                    text: '${DateFormat.Hms().format(DateTime.parse(DateTime.now().toString()))}, ${DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()))}',
                    fontSize: 16,
                    color: MyColors.labelcolor,
                  ))
            ],
          ),
          vSizedBox,
          Row(
            children: [
              Image.asset(
                MyImages.map_green,
                height: 24,
                width: 24,
              ),
              hSizedBox,
              Expanded(
                  child: ParagraphText(
                    text: '${Provider.of<GlobalModal>(context, listen: false).location!.addressString}',
                    fontSize: 16,
                    color: MyColors.labelcolor,
                  ))
            ],
          ),
          vSizedBox2,
          Row(
            children: [
              Expanded(
                child: RoundEdgedButton(
                  text: 'CANCEL',
                  color: MyColors.disabledcolor,
                  textColor: MyColors.black,
                  height: 40,
                  onTap: () {

                    Future.delayed(Duration(seconds: 3)).then((value) async {

                      final CameraController? cameraController = controller;
                      if( cameraController != null &&
                          cameraController.value.isInitialized &&
                          !cameraController.value.isRecordingVideo
                      ){
                        onTakePictureButtonPressed();

                      }
                      else{

                      }
                    });
                    Navigator.of(context, rootNavigator: true).pop();


                    // Navigator.pop(context);
                    // is_popup=false;

                  },
                ),
              ),
              hSizedBox,
              Expanded(
                child: RoundEdgedButton(
                  text: att_detail['data']['today_attendance']['inTime'] ==
                      null &&
                      att_detail['data']['today_attendance']['outTime'] ==
                          null
                      ? 'PUNCH IN'
                      : att_detail['data']['today_attendance']['inTime'] !=
                      null &&
                      att_detail['data']['today_attendance']
                      ['outTime'] ==
                          null
                      ? 'PUNCH OUT'
                      : '',
                  height: 40,
                  onTap: () async {
                    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    var androidDeviceInfo = await deviceInfo.androidInfo;
                    var id = androidDeviceInfo.androidId;
                    // String? deviceId = await _getId();
                    Map<String, dynamic> data = {
                      'lat':
                      Provider.of<GlobalModal>(context, listen: false)
                          .location!
                          .Lat
                          .toString(),
                      'lang':
                      Provider.of<GlobalModal>(context, listen: false)
                          .location!
                          .Lng
                          .toString(),
                      'location':
                      Provider.of<GlobalModal>(context, listen: false)
                          .location!
                          .addressString,
                      'device_id': id.toString()
                    };
                    print(data);
                    Map<String, dynamic> files = {'image': n};
                    print('files-----------55------$files');
                    var res = await Webservices.postDataWithImageFunction(
                        apiUrl: ApiUrls.faceattendanceStore,
                        body: data,
                        context: context,
                        files: files);
                    // setState(() {
                    //   load=false;
                    // });
                    log("res --------------$res");
                    if (res['success'].toString() == 'true') {
                      // permissionModal.showLoading();
                      var res1 = await Webservices.postData(
                          apiUrl: ApiUrls.faceattendance,
                          body: {},
                          context: context);
                      if (res1['success'].toString() == 'true') {
                        faceAtt = res1;
                        // workingHours =
                        // '${faceAtt['data']['today_attendance']['workinHours']}';
                        // Navigator.pop(context);
                        Navigator.of(context, rootNavigator: true).pop();

                        getDetails();
                        // setState(() {
                        //
                        // });
                      }
                    }


                  },
                ),
              ),
            ],
          ),
          vSizedBox2,
        ],
      ));




















          // push(context: context, screen: Face_Recognition_Processing_Page(image: n,));
          // showInSnackBar('Picture saved to ${file.path}');
        }
      }
    });
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
      _exposureModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  void onExposureModeButtonPressed() {
    if (_exposureModeControlRowAnimationController.value == 1) {
      _exposureModeControlRowAnimationController.reverse();
    } else {
      _exposureModeControlRowAnimationController.forward();
      _flashModeControlRowAnimationController.reverse();
      _focusModeControlRowAnimationController.reverse();
    }
  }

  void onFocusModeButtonPressed() {
    if (_focusModeControlRowAnimationController.value == 1) {
      _focusModeControlRowAnimationController.reverse();
    } else {
      _focusModeControlRowAnimationController.forward();
      _flashModeControlRowAnimationController.reverse();
      _exposureModeControlRowAnimationController.reverse();
    }
  }

  void onAudioModeButtonPressed() {
    enableAudio = !enableAudio;
    if (controller != null) {
      onNewCameraSelected(controller!.description);
    }
  }

  Future<void> onCaptureOrientationLockButtonPressed() async {
    try {
      if (controller != null) {
        final CameraController cameraController = controller!;
        if (cameraController.value.isCaptureOrientationLocked) {
          await cameraController.unlockCaptureOrientation();
          showInSnackBar('Capture orientation unlocked');
        } else {
          await cameraController.lockCaptureOrientation();
          showInSnackBar(
              'Capture orientation locked to ${cameraController.value.lockedCaptureOrientation.toString().split('.').last}');
        }
      }
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  void onSetExposureModeButtonPressed(ExposureMode mode) {
    setExposureMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Exposure mode set to ${mode.toString().split('.').last}');
    });
  }

  void onSetFocusModeButtonPressed(FocusMode mode) {
    setFocusMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Focus mode set to ${mode.toString().split('.').last}');
    });
  }

  void onVideoRecordButtonPressed() {
    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) {
      if (mounted) {
        setState(() {});
      }
      if (file != null) {
        showInSnackBar('Video recorded to ${file.path}');
        videoFile = file;
        _startVideoPlayer();
      }
    });
  }

  Future<void> onPausePreviewButtonPressed() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isPreviewPaused) {
      await cameraController.resumePreview();
    } else {
      await cameraController.pausePreview();
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Video recording paused');
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      showInSnackBar('Video recording resumed');
    });
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.pauseVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.resumeVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setExposureMode(ExposureMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setExposureMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setExposureOffset(double offset) async {
    if (controller == null) {
      return;
    }

    setState(() {
      _currentExposureOffset = offset;
    });
    try {
      offset = await controller!.setExposureOffset(offset);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> setFocusMode(FocusMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFocusMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<void> _startVideoPlayer() async {
    if (videoFile == null) {
      return;
    }

    final VideoPlayerController vController = kIsWeb
        ? VideoPlayerController.network(videoFile!.path)
        : VideoPlayerController.file(File(videoFile!.path));

    videoPlayerListener = () {
      if (videoController != null && videoController!.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) {
          setState(() {});
        }
        videoController!.removeListener(videoPlayerListener!);
      }
    };
    vController.addListener(videoPlayerListener!);
    await vController.setLooping(true);
    await vController.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imageFile = null;
        videoController = vController;
      });
    }
    await vController.play();
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
  showPop(file) async {

      Provider.of<GlobalModal>(context, listen: false).loadingHide();

    // var btn=false;
    await showCustomDialogBox(
        context:context,
        child: Column(
          children: [
            vSizedBox,
            ParagraphText(
              text: 'Are you sure?',
              color: MyColors.black,
              fontFamily: 'bold',
            ),
            vSizedBox,
            CircleAvatarcustom(
              isnetwork:true,
              image:
              '${Provider.of<GlobalModal>(context, listen: false).userData!.profileImg}',
            ),
            vSizedBox2,
            Row(
              children: [
                Image.asset(
                  MyImages.time,
                  height: 20,
                  width: 20,
                ),
                hSizedBox,
                Expanded(
                    child: ParagraphText(
                      text: '${DateFormat.Hms().format(DateTime.parse(DateTime.now().toString()))}, ${DateFormat.yMMMd().format(DateTime.parse(DateTime.now().toString()))}',
                      fontSize: 16,
                      color: MyColors.labelcolor,
                    ))
              ],
            ),
            vSizedBox,
            Row(
              children: [
                Image.asset(
                  MyImages.map_green,
                  height: 24,
                  width: 24,
                ),
                hSizedBox,
                Expanded(
                    child: ParagraphText(
                      text: '${Provider.of<GlobalModal>(context, listen: false).location!.addressString}',
                      fontSize: 16,
                      color: MyColors.labelcolor,
                    ))
              ],
            ),
            vSizedBox2,
            Row(
              children: [
                Expanded(
                  child: RoundEdgedButton(
                    text: 'CANCEL',
                    color: MyColors.disabledcolor,
                    textColor: MyColors.black,
                    height: 40,
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.of(context, rootNavigator: true).pop();
                      // is_popup=false;

                    },
                  ),
                ),
                hSizedBox,
                Expanded(
                  child: RoundEdgedButton(
                    text: att_detail['data']['today_attendance']['inTime'] ==
                        null &&
                        att_detail['data']['today_attendance']['outTime'] ==
                            null
                        ? 'PUNCH IN'
                        : att_detail['data']['today_attendance']['inTime'] !=
                        null &&
                        att_detail['data']['today_attendance']
                        ['outTime'] ==
                            null
                        ? 'PUNCH OUT'
                        : '',
                    height: 40,
                    onTap: () async {

                     await Provider.of<GlobalModal>(context, listen: false).loadingShow();

                      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                      var androidDeviceInfo = await deviceInfo.androidInfo;
                      var id = androidDeviceInfo.androidId;
                      // String? deviceId = await _getId();
                      Map<String, dynamic> data = {
                        'lat': Provider.of<GlobalModal>(context, listen: false)
                            .location!
                            .Lat
                            .toString(),
                        'lang': Provider.of<GlobalModal>(context, listen: false)
                            .location!
                            .Lng
                            .toString(),
                        'location': Provider.of<GlobalModal>(context, listen: false)
                            .location!
                            .addressString,
                        'device_id': id.toString(),
                        'mobile_number':att_detail['data']['userData']['mobile'].toString()
                      };
                      print(data);
                      Map<String, dynamic> files = {};
                      // if(file!=''){
                      //   files['image']=file;
                      // }

                      print('files-----------55------$files');
                      var res = await Webservices.postDataWithImageFunction(
                          apiUrl: ApiUrls.faceattendanceStore,
                          body: data,
                          context: context,
                          files: files);
                     await Provider.of<GlobalModal>(context, listen: false).loadingHide();


                      log("res --------------$res");
                      if (res['success'].toString() == 'true') {
                        // permissionModal.showLoading();
                        var res1 = await Webservices.postData(
                            apiUrl: ApiUrls.faceattendance,
                            body: {},
                            context: context);
                        if (res1['success'].toString() == 'true') {
                          faceAtt = res1;
                          // workingHours =
                          // '${faceAtt['data']['today_attendance']['workinHours']}';
                          // Navigator.pop(context);
                          Navigator.of(context, rootNavigator: true).pop();
                          getDetails();

                          // setState(() {
                          //
                          // });
                        }
                        else{
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                      }


                    },
                  ),
                ),
              ],
            ),
            vSizedBox2,
          ],
        ));

    print("hello'-------------");
    // is_popup=false;
  }
}

/// CameraApp is the Main Application.
class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: FaceCameraAttendance(phone: '${ Provider.of<GlobalModal>(context, listen: false).userData!.phone}',),
    );
  }

}

// List<CameraDescription> _cameras = <CameraDescription>[];