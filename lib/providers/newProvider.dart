import 'package:flutter/material.dart';
class PermissionModal extends ChangeNotifier {
  bool load=false;
  Map dashboardMenuPermission={};
  getPermission(Map data){
    load=true;
    print('true-----------$load');
    dashboardMenuPermission=data;
    load=false;
    print('dashboardMenuPermission-----------$dashboardMenuPermission');

    notifyListeners();
  }
   showLoading(){
    load=true;
    notifyListeners();
   }
  hideLoading(){
    load=false;
    notifyListeners();
   }
}