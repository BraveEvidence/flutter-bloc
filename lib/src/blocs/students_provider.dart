import 'package:flutter/material.dart';
import 'students_bloc.dart';

class StudentsProvider extends InheritedWidget {
  final StudentsBloc bloc;

  StudentsProvider({Key key, Widget child})
      : bloc = StudentsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static StudentsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(StudentsProvider)
            as StudentsProvider)
        .bloc;
  }
}
