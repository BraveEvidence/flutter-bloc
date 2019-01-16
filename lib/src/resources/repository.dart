import 'package:blocprojectcopiedstephengrider/src/models/student_model.dart';
import 'student_db_provider.dart';
import 'student_api_provider.dart';
import 'dart:async';

class Repository {
  List<Source> sources = <Source>[studentDbProvider, StudentApiProvider()];

  List<Cache> caches = <Cache>[studentDbProvider];

  Future<StudentModel> fetchStudents(String disciplineId, String schoolId,
      String year_id, String lastIndex) async {

    StudentModel studentModel;
    var source;

    for (source in sources) {

      studentModel = await source.fetchStudents(
          disciplineId, schoolId, year_id, lastIndex);
      if (studentModel != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) {
        for (var i = 0;
            i < studentModel.studentModelData.studentData.length;
            i++) {
          print(studentModel.studentModelData.studentData[i].studentEmail);
          cache.addStudent(studentModel.studentModelData.studentData[i]);
        }
      }
    }

    return studentModel;

  }

  clearCache() async {
    for(var cache in caches){
      await cache.clear();
    }
  }

}

abstract class Source {


  Future<StudentModel> fetchStudents(
      String disciplineId, String schoolId, String year_id, String lastIndex);

}

abstract class Cache {
  Future<int> addStudent(StudentData studentData);
  Future<int> clear();
}


















