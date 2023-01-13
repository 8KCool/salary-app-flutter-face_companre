import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:salaryredesign/constants/globalkeys.dart';

import '../../constants/global_data.dart';
import '../../providers/clock.dart';
import '../../services/api_urls.dart';

class MyAccountPage extends StatefulWidget {

  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
          initialUrlRequest: URLRequest(url:Uri.parse(
              (Provider.of<GlobalModal>(context,listen: false).userData!.userId!=1)?'${ApiUrls.webBaseUrl}UserEditemployee':
              '${ApiUrls.webBaseUrl}my_account'
          ),headers: globalHeaders),
          onLoadStop: (c,a){
            if(accountViewController!=null)
            accountViewController!.injectCSSCode(source: ".webviewhide{display:none !important}");
          },
          onWebViewCreated: (controller) async{
          accountViewController = controller;
          print(await controller.getUrl());
           },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
