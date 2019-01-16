class StudentModel {
  int status;
  String msg;
  StudentModelData studentModelData;

  StudentModel({this.status, this.msg, this.studentModelData});

  StudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    studentModelData = json['data'] != null ? new StudentModelData.fromJson(json['data']) : null;
  }

  StudentModel.fromDb(Map<String, dynamic> parsedJson) {
    status = parsedJson['status'];
    msg = parsedJson['msg'];
    studentModelData = parsedJson['data'] != null ? new StudentModelData.fromJson(parsedJson['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.studentModelData != null) {
      data['data'] = this.studentModelData.toJson();
    }
    return data;
  }
}

class StudentModelData {
  int lastIndex;
  List<StudentData> studentData;

  StudentModelData({this.lastIndex, this.studentData});

  StudentModelData.fromJson(Map<String, dynamic> json) {
    lastIndex = json['lastIndex'];
    if (json['studentData'] != null) {
      studentData = new List<StudentData>();
      json['studentData'].forEach((v) {
        studentData.add(new StudentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastIndex'] = this.lastIndex;
    if (this.studentData != null) {
      data['studentData'] = this.studentData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentData {
  String studentId;
  String studName;
  String studProfilepic;
  String studentEmail;
  String studentMobile;
  String courseName;
  String classCode;
  int minAvg;
  int avg;

  StudentData(
      {this.studentId,
        this.studName,
        this.studProfilepic,
        this.studentEmail,
        this.studentMobile,
        this.courseName,
        this.classCode,
        this.minAvg,
        this.avg});

  StudentData.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studName = json['stud_name'];
    studProfilepic = json['stud_profilepic'];
    studentEmail = json['student_email'];
    studentMobile = json['student_mobile'];
    courseName = json['course_name'];
    classCode = json['class_code'];
    minAvg = json['minAvg'];
    avg = json['avg'];
  }

  StudentData.fromDb(Map<String, dynamic> parsedJson){
    studentId = parsedJson['student_id'];
    studName = parsedJson['stud_name'];
    studProfilepic = parsedJson['stud_profilepic'];
    studentEmail = parsedJson['student_email'];
    studentMobile = parsedJson['student_mobile'];
    courseName = parsedJson['course_name'];
    classCode = parsedJson['class_code'];
    minAvg = parsedJson['minAvg'];
    avg = parsedJson['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['stud_name'] = this.studName;
    data['stud_profilepic'] = this.studProfilepic;
    data['student_email'] = this.studentEmail;
    data['student_mobile'] = this.studentMobile;
    data['course_name'] = this.courseName;
    data['class_code'] = this.classCode;
    data['minAvg'] = this.minAvg;
    data['avg'] = this.avg;
    return data;
  }
}