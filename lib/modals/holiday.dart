// "holiday_name": "fridayd",
// "holiday_date": "2022-06-16",
// "id": 1,
// "Source": "user",
// "e_d": "0",
// "department": "9,8",
// "branch": "0",
// "employer": 78
import 'package:intl/intl.dart';
class HolidayModal {
  String holiday_name;
  String holiday_date;
  String? Source;
  String e_d;
  int id;
  List departmentId;
  List branchId;
  int employerId;



  HolidayModal({
    required this.holiday_name,
    required this.holiday_date,
    required  this.Source,
    required this.e_d,
    required this.id,
    required this.departmentId,
    required this.branchId,
    required this.employerId,

  });
  factory HolidayModal.fromJson(Map HolidayData) {

    return HolidayModal(

      holiday_name:HolidayData['holiday_name'],
      holiday_date:'${ DateFormat.yMMMMd('en_US').format(DateTime.parse('${HolidayData['holiday_date']} 17:08:45' ))} , ${ DateFormat.E().format(DateTime.parse('${HolidayData['holiday_date']} 17:08:45' ))}',
      Source:HolidayData['Source'],
      e_d:HolidayData['e_d'].toString(),
      id:HolidayData['id'],
      departmentId:HolidayData['department']==null?[]:HolidayData['department'].toString().split(','),
      branchId:HolidayData['branch']==null?[]:HolidayData['branch']=='0'?[]:HolidayData['branch'].toString().split(','),
      employerId:HolidayData['employer'],



    );
  }


}