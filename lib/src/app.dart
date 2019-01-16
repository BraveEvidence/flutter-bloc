import 'package:blocprojectcopiedstephengrider/src/screens/student_list.dart';
import 'package:flutter/material.dart';
import 'package:blocprojectcopiedstephengrider/src/blocs/students_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentsProvider(
      child: MaterialApp(
        title: "Student List",
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) {

        final studentsBloc = StudentsProvider.of(context);
        studentsBloc.fetchStudents("1", "1", "2", "0");
        return StudentList();
      });
    }
  }
}
