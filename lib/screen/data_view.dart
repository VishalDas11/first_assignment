import 'package:first_assignment/model/teacher_model.dart';
import 'package:flutter/material.dart';

class AllocatedCourse extends StatefulWidget {
   AllocatedCourse({super.key, required this.list});

  List<Teacher> list;

  @override
  State<AllocatedCourse> createState() => _AllocatedCourseState();
}

class _AllocatedCourseState extends State<AllocatedCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Allocted"),),
      body: ListView.builder(
        itemCount: widget.list.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          print("length is ${widget.list}");
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("heelo"),
          Text(widget.list[index].course)
        ],);
      })
    );
  }
}