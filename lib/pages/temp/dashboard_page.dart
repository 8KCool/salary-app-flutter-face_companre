import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../providers/newProvider.dart';

import '../../widgets/CustomLoader.dart';
import '../tab_pages/dashboard.dart';
class DashboardPageNew extends StatefulWidget {
  final WebViewController controller;
  // final WebViewController newController;

  const DashboardPageNew({required Key key, required this.controller}) : super(key: key);

  @override
  State<DashboardPageNew> createState() => DashboardPageNewState();
}

class DashboardPageNewState extends State<DashboardPageNew> with AutomaticKeepAliveClientMixin {
  bool isWebView=false;
  ValueNotifier<bool> isWeb=ValueNotifier(false);
  ValueNotifier<bool> isLoad=ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(isWebView){
          if(await widget.controller.canGoBack()){
            widget.controller.goBack();
          }else{
            isWeb.value = false;
          }



          return false;

        }
        if(isLoad.value==true){
          isLoad.value=false;
        }
        return false;
      },
      child: Stack(
        children: [
          // if(isWebView)
            WebViewWidget(controller:widget.controller),
          // if(!isWebView)
          ValueListenableBuilder(
            valueListenable:isWeb ,
            builder: (context,bool value,_) {
              print('i am getting rebuild with value ${value} ${isWeb.value}');
              if(value==false)
              return Positioned(
                left: 0,right: 0,top: 0, bottom: 0,
                child: Dashboard_Page(controller: widget.controller,onTap: (url)async{
                 isLoad.value=true;
                  // await widget.controller.loadRequest(Uri.parse(url));
                 await widget.controller.runJavaScript("window.open('$url')");
                  widget.controller.setNavigationDelegate(NavigationDelegate(onPageFinished:(str){
                    isWeb.value=true;
                    isLoad.value=false;
                  isWebView=true;}));

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
