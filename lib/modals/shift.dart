class ShiftModal {
  int id;
  String shiftName;
  String shiftStartTime;
  String? shiftEndTime;
  int shiftGraceTime;




  ShiftModal({
    required this.shiftName,
    required this.shiftStartTime,
    required  this.shiftGraceTime,

    required this.id,
    required this.shiftEndTime,


  });
  factory ShiftModal.fromJson(Map ShiftData) {
    return ShiftModal(
      shiftName: ShiftData['name'],
      shiftStartTime: ShiftData['start_time'],
      shiftEndTime: ShiftData['end_time'],
      shiftGraceTime: ShiftData['grace'],
      id: ShiftData['id']??0,




    );
  }


}