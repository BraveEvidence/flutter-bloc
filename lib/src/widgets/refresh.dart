import 'package:flutter/material.dart';
import 'package:blocprojectcopiedstephengrider/src/blocs/students_provider.dart';

class Refresh extends StatelessWidget {

  final Widget child;
  final String disciplineId,schoolId,year_id,lastIndex;

  const Refresh({Key key, this.disciplineId, this.schoolId, this.year_id, this.lastIndex, this.child}) : super(key: key);


  Widget build(context) {
    final bloc = StudentsProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchStudents(disciplineId, schoolId, year_id, lastIndex);
      },
    );
  }
}
