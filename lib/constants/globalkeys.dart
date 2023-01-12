import 'package:flutter/material.dart';

import '../packages/lib/widget/search_widget.dart';
import '../pages/tabbarscreen.dart';
import '../pages/temp/dashboard_page.dart';
import '../pages/temp/tab_page_man.dart';


Map<String, String> globalHeaders = {
 // 'Authorization': 'Bearer '
};
int globalCount = 0;

class MyGlobalKeys{
 static GlobalKey<TabbarscreenState> tabbarKey = GlobalKey<TabbarscreenState>();
 static GlobalKey<ManishHomePageState> manishHomePageKey = GlobalKey<ManishHomePageState>();
 static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 static final GlobalKey<SearchLocationState> searchLocationKey = new GlobalKey<SearchLocationState>();
 static final GlobalKey<DashboardPageNewState> dashboardPageNewState = new GlobalKey<DashboardPageNewState>();
}

Map user={};
String usertoken='';
Map faceAtt={};