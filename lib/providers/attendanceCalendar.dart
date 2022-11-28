import 'package:flutter/material.dart';
class AttendanceCalendarModal extends ChangeNotifier{
  List attendanceData=[];
  getData(data){
    attendanceData=data;
    notifyListeners();
  }
}