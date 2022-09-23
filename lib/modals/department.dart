import 'package:salaryredesign/services/api_urls.dart';

class DepartmentModal {
  int id;
  String departmentName;
  String depBranch;
  String? depBranchId;
  int? depheadId;
  List images;
  String u_image;




  DepartmentModal({
    required this.departmentName,
    required this.depBranch,
    required  this.depBranchId,

    required this.id,
    required this.depheadId,
   required this.images,
    required this.u_image,


  });
  factory DepartmentModal.fromJson(Map ShiftData) {
    return DepartmentModal(
      departmentName: ShiftData['name'],
      depBranch: ShiftData['b_name'],
      depBranchId: ShiftData['b_id'].toString(),
      depheadId: ShiftData['e_id'],
      id: ShiftData['id']??0,
      images: ShiftData['users']??[],
      u_image:ShiftData['u_image']!=null?ShiftData['u_image'].toString():'',





    );
  }


}