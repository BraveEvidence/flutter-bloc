import 'package:blocprojectcopiedstephengrider/src/resources/repository.dart';
import 'package:blocprojectcopiedstephengrider/src/resources/student_db_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:blocprojectcopiedstephengrider/src/models/student_model.dart';

class StudentsBloc {

  final _repository = Repository();
  final _students = PublishSubject<StudentModel>();

  Observable<StudentModel> get students => _students.stream;

  fetchStudents(String disciplineId,String schoolId,String year_id,String lastIndex) async {

    await studentDbProvider.init();

    final student = await _repository.fetchStudents(disciplineId, schoolId, year_id, lastIndex);
    _students.sink.add(student);
  }

  clearCache(){
    return _repository.clearCache();
  }

  dispose(){
    _students.close();
  }


}









































