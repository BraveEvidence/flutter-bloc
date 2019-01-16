import 'package:blocprojectcopiedstephengrider/src/blocs/students_bloc.dart';
import 'package:blocprojectcopiedstephengrider/src/blocs/students_provider.dart';
import 'package:blocprojectcopiedstephengrider/src/widgets/loading_container.dart';
import 'package:blocprojectcopiedstephengrider/src/widgets/refresh.dart';
import 'package:flutter/material.dart';
import 'package:blocprojectcopiedstephengrider/src/models/student_model.dart';

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = StudentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StudentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.students,
      builder: (context, AsyncSnapshot<StudentModel> snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(snapshot.data!=null){
          return Refresh(
            year_id: "2",
            schoolId: "1",
            lastIndex: "0",
            disciplineId: "1",
            child: ListView.builder(
              itemBuilder: (context, int index) {
                return buildTile(
                    snapshot.data.studentModelData.studentData[index]);
              },
              itemCount: snapshot.data.studentModelData.studentData.length,
            ),
          );
        }

      },
    );
  }

  Widget buildTile(StudentData item) {
    return Column(
      children: [
        ListTile(
          onTap: () {
//            Navigator.pushNamed(context, '/${item.id}');
          },
          title: Text(item.studName),
          subtitle: Text('${item.studentEmail} '),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text('${item.classCode}'),
            ],
          ),
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }
}

/*





















































 */
