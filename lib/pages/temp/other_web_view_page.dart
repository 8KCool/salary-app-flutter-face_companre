import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:salaryredesign/constants/globalkeys.dart';

import '../../constants/global_data.dart';
import '../../services/api_urls.dart';

import 'package:permission_handler/permission_handler.dart' as p;
import 'package:location/location.dart';
class OtherWebViewPage extends StatefulWidget {
  final String url;

  const OtherWebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<OtherWebViewPage> createState() => _OtherWebViewPageState();
}

class _OtherWebViewPageState extends State<OtherWebViewPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState

    requestPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InAppWebView(
            // initialData: InAppWebViewInitialData(),
            //   initialUrlRequest: URLRequest(url:Uri.parse('${ApiUrls.webBaseUrl}privacy-policy.html'),headers: globalHeaders),
              initialUrlRequest: URLRequest(url:Uri.parse(widget.url),headers: globalHeaders),
              onLoadStop: (c,a){
                if(otherWebViewController!=null)
                  otherWebViewController!.injectCSSCode(source: ".webviewhide{display:none !important}");
              },
              onWebViewCreated: (controller) async{
                otherWebViewController = controller;
                print(await controller.getUrl());
              },


              androidOnGeolocationPermissionsShowPrompt:
                  (InAppWebViewController controller, String origin) async {


                bool? result = await showDialog<bool>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Allow access location $origin'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Allow access location $origin'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Allow'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text('Denied'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );
                  },
                );
                if(result!=null){
                  if (result) {
                    return Future.value(GeolocationPermissionShowPromptResponse(
                        origin: origin, allow: true, retain: true));
                  } else {
                    return Future.value(GeolocationPermissionShowPromptResponse(
                        origin: origin, allow: false, retain: false));
                  }
                }







              }
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void requestPermission() async {

    Location location = new Location();
    bool ison = await location.serviceEnabled();
    if (!ison) { //if defvice is off
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        request();
      }else{
        print("GPS Device is still OFF");
      }
    }
    else{
      request();
    }


  }

  request() async{

    Map<p.Permission, p.PermissionStatus> statuses =
    await [p.Permission.location].request();
  }
}
