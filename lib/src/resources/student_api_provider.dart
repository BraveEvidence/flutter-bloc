import 'package:blocprojectcopiedstephengrider/src/constants/Constants.dart';
import 'package:blocprojectcopiedstephengrider/src/models/student_model.dart';
import 'dart:convert';
import 'dart:async';
import 'repository.dart';
import 'package:http/http.dart' as http;

class StudentApiProvider implements Source {

  @override
  Future<StudentModel> fetchStudents(String disciplineId, String schoolId,
      String year_id, String lastIndex) async {
    final response = await http.post(GET_STUDENTS, body: {
      "disciplineId": disciplineId,
      "schoolId": schoolId,
      "year_id": year_id,
      "lastIndex": lastIndex
    });

    final parsedJson = json.decode(response.body);

    return StudentModel.fromJson(parsedJson);
  }

}































