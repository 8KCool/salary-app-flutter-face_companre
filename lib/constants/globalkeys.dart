import 'package:flutter/material.dart';

import '../packages/lib/widget/search_widget.dart';



class MyGlobalKeys{
 static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 static final GlobalKey<SearchLocationState> searchLocationKey = new GlobalKey<SearchLocationState>();
}

Map user={};
String usertoken='';