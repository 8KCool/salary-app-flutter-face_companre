import 'package:flutter/material.dart';

import '../packages/lib/widget/search_widget.dart';
import '../pages/tabbarscreen.dart';



class MyGlobalKeys{
 static GlobalKey<TabbarscreenState> tabbarKey = GlobalKey<TabbarscreenState>();
 static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 static final GlobalKey<SearchLocationState> searchLocationKey = new GlobalKey<SearchLocationState>();
}

Map user={};
String usertoken='';
Map faceAtt={};