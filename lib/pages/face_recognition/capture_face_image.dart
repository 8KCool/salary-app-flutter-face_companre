import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_api_beta/face_api.dart' as Regula;
import 'dart:convert';
import 'dart:typed_data';

import 'package:salaryredesign/services/webservices.dart';
import 'package:path_provider/path_provider.dart';
import '../../services/api_urls.dart';
class CaptureFacePage extends StatefulWidget {
  const CaptureFacePage({Key? key}) : super(key: key);

  @override
  State<CaptureFacePage> createState() => _CaptureFacePageState();
}

class _CaptureFacePageState extends State<CaptureFacePage> {

  var image1 = new Regula.MatchFacesImage();
  var image2 = new Regula.MatchFacesImage();
  var img1 = Image.asset('assets/images/portrait.png');
  var img2 = Image.asset('assets/images/portrait.png');
  String _similarity = "nil";
  String _liveness = "nil";
  String text456 = "nil";
  File? file;

  setImage(bool first, Uint8List? imageFile, int type) {
    // log("bitmap from ---------------${base64Decode(result!.bitmap!.replaceAll("\n", ""))}");
    // log("imageFile----------${imageFile}");
    if (imageFile == null) return;
    setState(() => _similarity = "nil");
    if (first) {
      image1.bitmap = base64Encode(imageFile);
      image1.imageType = type;
      setState(() {
        img1 = Image.memory(imageFile);
        _liveness = "nil";
      });
    }  else {
      image2.bitmap = base64Encode(imageFile);
      image2.imageType = type;
      setState(() => img2 = Image.memory(imageFile));
    }
    print("imageFile--------------------$imageFile");
  }

  liveness() => Regula.FaceSDK.startLiveness().then((value) async {
    print("value from liveness---------------$value");
    var result = Regula.LivenessResponse.fromJson(json.decode(value));
    print("result from LivenessResponse---------------$result");

    setImage(true, base64Decode(result!.bitmap!.replaceAll("\n", "")),
        Regula.ImageType.LIVE);
    // text456=(base64Decode(result!.bitmap!.replaceAll("\n", ""))).toString();
    get();
    // print("_liveness from ---------------${result.liveness}");
    // log("_liveness from -------2525--------${result.bitmap!.runtimeType}");
    // String bs64str1 = base64Url.encode(text456.codeUnits);
    // log("bs64str1bs64str1-------------${bs64str1}");
    // final encoded = base64.encode(text456.asUint8List());
    // String bs4str = bs64str1;
    // Uint8List decodedbytes = base64.decode(bs64str1);
    // final path = await getExternalStorageDirectory();
    // var filePathAndName = path!.path + '/'+'signature.png';
    // try{
    //   file = await File(filePathAndName).writeAsBytes(base64Decode(result!.bitmap!.replaceAll("\n", "")));
    //   print('---file ankita----- ${file}');
    // }catch(err){
    //   print("error ------------------ankita---------------$err");
    // }




    // var imagesss='${result.bitmap!.replaceAll("\n", "")}';
    // if(result.liveness.toString()=='1'){
    //   print('result.liveness.toString()--------------${result.liveness.toString()}');
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   var androidDeviceInfo = await deviceInfo.androidInfo;
    //   var id = androidDeviceInfo.androidId;
    //   Map<String , dynamic>request={
    //     'image':imagesss,
    //     'device_id':id.toString()
    //   };
    //   Map<String , dynamic>files={
    //     'image':file,
    //
    //   };
    //   var res=await Webservices.postDataWithImageFunction(apiUrl: ApiUrls.facereconizationnew, body: request, context: context, files: files);
    // print("res from res--------------$res");
    //
    // }
    // else{
    //   print('elseelseelseelses--------------${result.liveness.toString()}');
    //   print('result.liveness.toString()--------------${result.liveness.toString()}');
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   var androidDeviceInfo = await deviceInfo.androidInfo;
    //   var id = androidDeviceInfo.androidId;
    //   Map<String , dynamic>request={
    //     'image':imagesss,
    //     'device_id':id.toString()
    //   };
    //   log("rererererer-------------$request");
    //   var res=await Webservices.postData(apiUrl: ApiUrls.facereconizationnew, body: request, context: context);
    //   print("res from res--------------$res");
    //
    // }



    setState(() {
      print("_liveness from ---------------${result.liveness}");

      _liveness = result.liveness == 0 ? "passed" : "unknown";
    });
  });
  Widget createImage(image, VoidCallback onPress) => Material(
      child: InkWell(
        onTap: onPress,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(height: 150, width: 150, image: image),
          ),
        ),
      ));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get();

    liveness();
  }
  get()async{
    print("get () called----------------");
    String bs4str = text456;
    Uint8List decodedbytes = base64.decode(bs4str);
    print("decodedbytes-------2525------${decodedbytes}-");
    File decodedimgfile = await File("assets/images/22.jpg").writeAsBytes(decodedbytes);
    String decodedpath = decodedimgfile.path;

    print("decodedpath----------------------${decodedpath}");
  }
  matchFaces() {
    if (image1.bitmap == null ||
        image1.bitmap == "" ||
        image2.bitmap == null ||
        image2.bitmap == "") return;
    setState(() => _similarity = "Processing...");
    var request = new Regula.MatchFacesRequest();
    request.images = [image1, image2];
    Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
      var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
      Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
          jsonEncode(response!.results), 0.75)
          .then((str) {
        var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
            json.decode(str));
        setState(() => _similarity = split!.matchedFaces.length > 0
            ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
            "%")
            : "error");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Color(0xff2563EB),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Text("${text456}",style: TextStyle(fontSize: 25),),
              createImage(img1.image, () {

              }),
              createImage(
                  img2.image, () {

              }),
              SizedBox(
                height: 100,
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    matchFaces();
                  },
                    child: Text("match")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
