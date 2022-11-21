class EmployeeAttendance {
  List<DateTime> presentDays;
  List fullDays;
  List absentDays;
  List halfDays;
  List paidDays;
  List unpaidDays;
  List dayoffDays;
  List forgotoutDays;
  List earlyoutDays;
  List lateentryDays;
  List publicholidayDays;
  List weekoffDays;
  List leaverequestDays;
  List shortHourDays;

  EmployeeAttendance({
    required this.presentDays,
    required this.fullDays,
    required this.absentDays,
    required this.halfDays,
    required this.paidDays,
    required this.unpaidDays,
    required this.dayoffDays,
    required this.forgotoutDays,
    required this.earlyoutDays,
    required this.lateentryDays,
    required this.publicholidayDays,
    required this.weekoffDays,
    required this.leaverequestDays,
    required this.shortHourDays,
  });
  factory EmployeeAttendance.fromJson(Map data) {
    return EmployeeAttendance(
      presentDays: List.generate((data['1']??[]).length, (index) => DateTime.parse('${data['1'][index]}'),growable: true) ,
      fullDays:List.generate((data['2']??[]).length, (index) => DateTime.parse('${data['2'][index]}'),growable: true),
      absentDays:List.generate((data['3']??[]).length, (index) => DateTime.parse('${data['3'][index]}'),growable: true) ,
      halfDays: List.generate((data['4']??[]).length, (index) => DateTime.parse('${data['4'][index]}'),growable: true),
      paidDays: List.generate((data['5']??[]).length, (index) => DateTime.parse('${data['5'][index]}'),growable: true),

      dayoffDays: data['7'] ?? [],
      forgotoutDays: data['8'] ?? [],
      earlyoutDays: data['9'] ?? [],
      lateentryDays: data['10'] ?? [],
      publicholidayDays: data['11'] ?? [],
      weekoffDays: List.generate((data['12']??[]).length, (index) => DateTime.parse('${data['12'][index]}'),growable: true) ,
      leaverequestDays: data['13'] ?? [],
      shortHourDays: data['14'] ?? [],
      unpaidDays: data['6'] ?? [],
    );
  }
}
