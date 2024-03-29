import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.fetchCourses(Constants.allFilter),
        builder: (context, snapshot) {
          final courses = snapshot.data;
          if (courses == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(courses.toString()),
          );
        });
  }
}
