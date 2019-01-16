import 'package:blocprojectcopiedstephengrider/src/models/student_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'repository.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class StudentDbProvider implements Source, Cache {

  Database db;

//  StudentDbProvider(){
//    init();
//  }


  void init() async {
    print("database initialized");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "students.db");
     db =  await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version)  {
       newDb.execute("""
        CREATE TABLE STUDENTS(
          id INTEGER PRIMARY KEY,
          student_id TEXT,
          stud_name TEXT,
          stud_profilepic TEXT,
          student_email TEXT,
          student_mobile TEXT,
          course_name TEXT,
          class_code TEXT,
          minAvg TEXT,
          avg TEXT
        )
       """);
    });


  }

  @override
  Future<int> clear() {
    return db.delete("STUDENTS");
  }

  @override
  Future<StudentModel> fetchStudents(String disciplineId, String schoolId,
      String year_id, String lastIndex) async {

    print("PritishSawant${db==null}");

    final maps =
        await db.query("STUDENTS");

    if (maps.length > 0) {
      return StudentModel.fromDb(maps.first);
    }

    return null;
  }


  @override
  Future<int> addStudent(StudentData studentData) {
    return db.insert("STUDENTS", studentData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}

final studentDbProvider = StudentDbProvider();


























