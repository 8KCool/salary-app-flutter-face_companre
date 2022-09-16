import 'package:salaryredesign/constants/globalkeys.dart';

class BranchModal {
String branchName;
String branchAdd;
String? branchManager;
int radius;
int id;
String branchLat;
String branchLong;

// Map branchPermissions;
// List branchList;

  BranchModal({
  required this.branchName,
    required this.branchAdd,
    required  this.radius,
     this.branchManager,
    required this.id,
    required this.branchLat,
    required this.branchLong,
    // required this.branchPermissions,
   // required this.branchList,
  });
factory BranchModal.fromJson(Map BranchData) {
  return BranchModal(
    branchName: BranchData['name'],
    branchAdd: BranchData['address'],
    radius: BranchData['radius'],
    id: BranchData['id'],
    branchManager: BranchData['manager_name'],
    branchLat: BranchData['latitude'],
    branchLong: BranchData['longitude'],

    // id:BranchModal['id'],
    // branchPermissions: permission, branchList: []

  );
}


}