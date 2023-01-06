class DashboardModal {
  DashboardModal({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final Data data;

  DashboardModal.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.profileImage,
    required this.name,
    required this.companyName,
    required this.type,
    required this.attendancemenu,
    required this.myattendancemenu,
    required this.employeDetailmenu,
    required this.profileemenu,
    required this.myrequestemenu,
    required this.approvalmenu,
    required this.salaryprocessmenu,
    required this.reportmenu,
    required this.announcemenu,
    required this.Bankmenu,
    required this.workmenu,
    required this.faceattendancemenu,
    required this.qrattendancemenu,
  });
  late final int id;
  late final String profileImage;
  late final String name;
  late final String companyName;
  late final String type;
  late final String attendancemenu;
  late final String myattendancemenu;
  late final String employeDetailmenu;
  late final String profileemenu;
  late final String myrequestemenu;
  late final String approvalmenu;
  late final String salaryprocessmenu;
  late final String reportmenu;
  late final String announcemenu;
  late final String Bankmenu;
  late final String workmenu;
  late final String faceattendancemenu;
  late final String qrattendancemenu;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    profileImage = json['profileImage'];
    name = json['name'];
    companyName = json['company_name'];
    type = json['type'];
    attendancemenu = json['attendancemenu'];
    myattendancemenu = json['myattendancemenu'];
    employeDetailmenu = json['employeDetailmenu'];
    profileemenu = json['profileemenu'];
    myrequestemenu = json['myrequestemenu'];
    approvalmenu = json['approvalmenu'];
    salaryprocessmenu = json['salaryprocessmenu'];
    reportmenu = json['reportmenu'];
    announcemenu = json['announcemenu'];
    Bankmenu = json['Bankmenu'];
    workmenu = json['workmenu'];
    faceattendancemenu = json['faceattendancemenu'];
    qrattendancemenu = json['qrattendancemenu'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profileImage'] = profileImage;
    _data['name'] = name;
    _data['company_name'] = companyName;
    _data['type'] = type;
    _data['attendancemenu'] = attendancemenu;
    _data['myattendancemenu'] = myattendancemenu;
    _data['employeDetailmenu'] = employeDetailmenu;
    _data['profileemenu'] = profileemenu;
    _data['myrequestemenu'] = myrequestemenu;
    _data['approvalmenu'] = approvalmenu;
    _data['salaryprocessmenu'] = salaryprocessmenu;
    _data['reportmenu'] = reportmenu;
    _data['announcemenu'] = announcemenu;
    _data['Bankmenu'] = Bankmenu;
    _data['workmenu'] = workmenu;
    _data['faceattendancemenu'] = faceattendancemenu;
    _data['qrattendancemenu'] = qrattendancemenu;
    return _data;
  }
}