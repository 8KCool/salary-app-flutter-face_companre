import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_face_api_beta/face_api.dart' as Regula;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';
import '../../services/api_urls.dart';
import '../../services/webservices.dart';
import '../../widgets/CustomLoader.dart';
class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  var image1 = new Regula.MatchFacesImage();
  var image2 = new Regula.MatchFacesImage();
  var img1 = Image.asset('assets/images/face_recog.png');
  var img2 = Image.asset('assets/images/face_recog.png');
  String _similarity = "nil";
  String _liveness = "nil";
  bool load=false;
  Future<void> initPlatformState() async {}
  @override
  void initState() {
    super.initState();
    initPlatformState();
    load=true;
    liveness();
  }
  showAlertDialog(BuildContext context, bool first) => showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(title: Text("Select option"), actions: [
            // ignore: deprecated_member_use
            TextButton(
                child: Text("Use gallery"),
                onPressed: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => {
                    setImage(
                        first,
                        io.File(value!.path).readAsBytesSync(),
                        Regula.ImageType.PRINTED)
                  });
                }),
            // ignore: deprecated_member_use
            TextButton(
                child: Text("Use camera"),
                onPressed: ()async {
                  Regula.FaceSDK.presentFaceCaptureActivity().then((result) async{
                    print("Regula.FaceSDK-----------$result");
                    // setImage(
                    //     first,
                    //     base64Decode(Regula.FaceCaptureResponse.fromJson(
                    //         json.decode(result))!
                    //         .image!
                    //         .bitmap!
                    //         .replaceAll("\n", "")),
                    //     Regula.ImageType.LIVE);
                    final path = await getExternalStorageDirectory();
                    var filePathAndName = path!.path + '/'+DateTime.now().microsecondsSinceEpoch.toString()+'-ankita.png';
                    print("aaaaa-------------${filePathAndName}");
                    try{
                    var  file = await File(filePathAndName).writeAsBytes(base64Decode(Regula.FaceCaptureResponse.fromJson(
                    json.decode(result))!
                        .image!
                        .bitmap!
                        .replaceAll("\n", "")));
                    print('---file ankita----- ${file}');
                    }catch(err){
                    print("error ------------------ankita---------------$err");
                    }
                    Navigator.pop(context);
                  });

                })
          ]));

  setImage(bool first, Uint8List? imageFile, int type) {
    if (imageFile == null) return;
    setState(() => _similarity = "nil");
    if (first) {
      image1.bitmap = base64Encode(imageFile);
      image1.imageType = type;
      setState(() {
        img1 = Image.memory(imageFile);
        _liveness = "nil";

      });
    } else {
      image2.bitmap = base64Encode(imageFile);
      image2.imageType = type;
      setState(() => img2 = Image.memory(imageFile));
    }
  }

  clearResults() {
    setState(() {
      img1 = Image.asset('assets/images/04.jpg.');
      img2 = Image.asset('assets/images/04.jpg');
      _similarity = "nil";
      _liveness = "nil";
    });
    image1 = new Regula.MatchFacesImage();
    image2 = new Regula.MatchFacesImage();
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

  liveness() => Regula.FaceSDK.startLiveness().then((value) async{
    load=false;
    setState(() {

    });
    print("value from liveness---------------$value");
    var result = Regula.LivenessResponse.fromJson(json.decode(value));
    print("result from LivenessResponse---------------$result");
    setImage(true, base64Decode(result!.bitmap!.replaceAll("\n", "")),
        Regula.ImageType.LIVE);
    try{
      final path = await getExternalStorageDirectory();
      var filePathAndName = path!.path + '/'+'liveness.png';
      print("filePathAndName ---------${filePathAndName}");
      if(result.liveness == 0 ){
        try{
          var  file = await File(filePathAndName).writeAsBytes(base64Decode(result!.bitmap!.replaceAll("\n", "")));
          print('---file ankita----- ${file}');
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          var androidDeviceInfo = await deviceInfo.androidInfo;
          var id = androidDeviceInfo.androidId;
          Map<String , dynamic>request={

            'device_id':id.toString()
          };
          Map<String , dynamic>files={
            'image':file,

          };
          setState((){
            load=true;
          });
          var res=await Webservices.postDataWithImageFunction(apiUrl: ApiUrls.facereconizationnew, body: request, context: context, files: files);
          print("res from res--------------$res");
          setState((){
            load=false;
          });
        }catch(err){
          print("error ------------------ankita---------------$err");
        }
      }
      else{
        showSnackbar(context, "Try again later!");
      }

    }catch(err){
      print("error ------------------ankita---------------$err");
    }



    print("_liveness from ---------------${result.liveness}");
    print("image from ---------------${img1.image.runtimeType}");

    setState(() {
      print("_liveness from ---------------${result.liveness}");

      _liveness = result.liveness == 0 ? "passed" : "unknown";
    });

  });

  Widget createButton(String text, VoidCallback onPress) => Container(
    // ignore: deprecated_member_use
    child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: onPress,
        child: Text(text)),
    width: 250,
  );

  Widget createImage(image, VoidCallback onPress) => Material(
      child: InkWell(
        onTap: onPress,
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(image: image,fit: BoxFit.cover,),
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Back'),
      backgroundColor: Color(0xff2563EB),
    ),
    body: load?CustomLoader():SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                    child: createImage(img1.image, (){})),
                    // () => showAlertDialog(context, true)
                // createImage(
                //     img2.image, () => showAlertDialog(context, false)),
                // Container(margin: EdgeInsets.fromLTRB(0, 0, 0, 15)),
                // createButton("Match", () => matchFaces()),
                // createButton("Liveness", () => liveness()),
                // createButton("Clear", () => clearResults()),
                // Text('${image1.bitmap}'),
                // Container(
                //     margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("Similarity: " + _similarity,
                //             style: TextStyle(fontSize: 18)),
                //         Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                //         Text("Liveness: " + _liveness,
                //             style: TextStyle(fontSize: 18))
                //       ],
                //     ))
              ])),
    ),
  );
}
