
import 'package:intl/intl.dart';
class WeekOffListModal {
  int id;
  String day;
  List departmentId;
  List branchId;
  String weeks;
  int employerId;
  int type;

  // id: 68,
  // day: Sunday,
  // branch_id: 32,
  // 35,
  // department_id: 8,18,
  // weeks: Week 1, Week 2, Week 4,
  // type: 2,
  // employer_id: 78,
  // created_at: 2022-09-26T13:35:33.000000Z,
  // updated_at: 2022-09-26T13:35:33.000000Z

  WeekOffListModal({
    required this.id,
    required this.day,
    required this.departmentId,
    required this.branchId,
    required this.employerId,
    required this.weeks,
    required this.type

  });
  factory WeekOffListModal.fromJson(Map weekoffData) {

    return WeekOffListModal(
      id:weekoffData['id'],
      departmentId:weekoffData['department_id']==null?[]:weekoffData['department_id'].toString().split(','),
      branchId:weekoffData['branch_id']==null?[]:weekoffData['branch_id']==0?[]:weekoffData['branch_id'].toString().split(','),
      employerId:weekoffData['employer_id'],
      day:weekoffData['day'].toString(),
      weeks:weekoffData['weeks'].toString(),
      type: weekoffData['type'],



    );
  }


}