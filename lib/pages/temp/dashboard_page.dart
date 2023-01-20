import 'package:flutter/material.dart';
import 'package:salaryredesign/widgets/showSnackbar.dart';
import '../../widgets/CustomLoader.dart';
import '../tab_pages/dashboard.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:salaryredesign/constants/globalkeys.dart';

import '../../constants/global_data.dart';
import '../../services/api_urls.dart';

class DashboardPageNew extends StatefulWidget {
  Function(InAppWebViewController,Uri?) loadStop;

  DashboardPageNew({required Key key, required this.loadStop}) : super(key: key);

  @override
  State<DashboardPageNew> createState() => DashboardPageNewState();
}

class DashboardPageNewState extends State<DashboardPageNew> with AutomaticKeepAliveClientMixin {
  // bool isWebView=false;
  int m=0;
  ValueNotifier<bool> isWeb=ValueNotifier(false);
  ValueNotifier<bool> isLoad=ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{

            // print("m-------");
          if(dashBoardViewController!=null){
            // print("m-------1");
            if(await dashBoardViewController!.canGoBack()){
              // dashBoardViewController.get
              // print("m-------2");
              dashBoardViewController!.goBack();

            }else{
              isWeb.value = false;
            }
          }

        if(isLoad.value==true){
          isLoad.value=false;
        }
        return false;
      },
      child: Stack(
        children: [
          // if(isWebView)
          InAppWebView(
            initialUrlRequest: URLRequest(url:Uri.parse('${ApiUrls.siteBaseUrl}'),headers: globalHeaders),
            onWebViewCreated: (controller) async{
              dashBoardViewController = controller;
              // dashBoardViewController!.injectCSSCode(source: ".webviewhide{display:none !important}");
              // showSnackbar(context, "webviewcreated");
              print(await controller.getUrl());
            },
              androidOnPermissionRequest: (a,b, c)async{
                print('hello world ${a}  .........${b} .......${c}');
              },
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(

                )
              ),


              onLoadStart:(controller,uri){
                print('dashboard loadstart---${uri?.path}');
                if(uri!=null){
                  if(uri.path=="/staff/dashboard"){
                    isWeb.value=false;
                  }

                }

               },
            onLoadStop: (a,b){
              isLoad.value=false;

              if(b!=null){
                if(b.path=="/staff/dashboard"){
                  print('dashboard loadstop---'+b.path);
                  isWeb.value=false;
                }

              }
              dashBoardViewController!.injectCSSCode(source: ".webviewhide{display:none !important}");
              widget.loadStop(a,b);
            }
          ),
          // if(!isWebView)
          ValueListenableBuilder(
            valueListenable:isWeb ,
            builder: (context,bool value,_) {
              print('i am getting rebuild with value ${value} ${isWeb.value}');
              if(value==false)
              return Positioned(
                left: 0,right: 0,top: 0, bottom: 0,
                child: Dashboard_Page(onTap: (url)async{
                 isLoad.value=true;
                 isWeb.value=true;
                 if(dashBoardViewController!=null){
                   await dashBoardViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse(url), headers: globalHeaders));

                   // await dashBoardViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
                 }


                  print('value from ()-----------${isWeb.value}');

                },),
              );
              return Container();
            }
          ),
          ValueListenableBuilder(
              valueListenable:isLoad ,
              builder: (context,bool value,_) {
                print('i am getting rebuild with is loading value ${value} ${isLoad.value}');
                if(value==true)
                  return Positioned(
                    left: 0,right: 0,top: 0, bottom: 0,
                    child:Container(
                      height: 500,
                        color: Colors.white,
                        child: Center(child: CustomLoader(),))
                  );
                return Container();
              }
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
