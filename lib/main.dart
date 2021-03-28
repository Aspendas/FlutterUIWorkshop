import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'course_app/home_screen.dart';
import 'course_app/model/constants.dart';
import 'course_app/details_screen.dart';
import 'course_app/model/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Course App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: AppList(),
      //DetailScreen(),/// Course detail screen
    );
  }
}

class AppList extends StatelessWidget {
  final List<Widget> projectList = <Widget>[
    CourseHomeScreen(),
    DetailScreen(),
  ];
  final List<String> projectName = <String>[
    "Course App UI",
    "Course App Detail Page"
  ];
  final List<Function> projectRouting = <Function>[];

  @override
  Widget build(BuildContext context) {
    Function pageRouting(route) {
      return () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      };
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Aspendas UI Workshop"),
      ),
      body: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: ListTile(
                leading: FlutterLogo(),
                title: Text(projectName[index]),
                onTap: pageRouting(projectList[index]),
              ),
            );
          }),
    );
  }
}
