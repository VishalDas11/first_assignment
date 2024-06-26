import 'dart:developer';

import 'package:first_assignment/model/teacher_model.dart';
import 'package:first_assignment/screen/resume_screen.dart';
import 'package:first_assignment/widget/add_teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../techer_controller.dart';
import 'course_screen.dart';
import 'data_view.dart';
import 'enrolledin.dart';
import 'teacher_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Teacher> teacherlist =[];

// Add controllers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: Text(
          "Course Allocation System",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBox(
              name: 'View Teacher',
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> TeacherScreen()));
              },
            ),
            CustomBox(
              name: 'Enrolled In',
               ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EnrolledInScreen()));
               },
            ),
            CustomBox(
              name: 'Course',
               ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseScreen()));
               },
            ),
            CustomBox(
              name: 'Recieved Resume',
               ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumeScreen()));
               
               },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(text: "Add", ontap: () => _showMyDialog(context, teacherlist)),
                CustomButtom(text: "View", ontap: () {}),
                CustomButtom(
                  text: "Update",
                  ontap: () {},
                ),
                CustomButtom(
                  text: "Delete",
                  ontap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  CustomBox({super.key, required this.name, required this.ontap});
  String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.18,
        color: Colors.purple.shade100,
        child: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 36),
          ),
        ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  CustomButtom({super.key, required this.text, required this.ontap});

  String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            maximumSize: Size(150, 50),
            backgroundColor: Colors.deepPurple.shade400),
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}

Future<void> _showMyDialog(context, List teacherlist) async {
  final TeacherListController controller = Get.find(); // Access controller

  final TextEditingController teacherNameController = TextEditingController();
  final courseList = [
      'Programming',
      'Database',
      'Discrete Structure',
      'Multivariable Calculus',
      'English',
    ]; // Replace with your actual course list
 String? selectedCourse; // For dropdown selection


return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return  AlertDialog(
      title: const Text('Add Teacher'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: teacherNameController,
              decoration: const InputDecoration(hintText: "Teacher Name"),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCourse, // Pre-selected course if desired
              items: courseList.map((String course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (String? newCourse) {
                selectedCourse = newCourse;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Course',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Save'),
          onPressed: () {
            if (teacherNameController.text.isNotEmpty &&
                selectedCourse != null) {
              controller.addTeacher(
                  teacherNameController.text, selectedCourse!);
              Navigator.of(context).pop();
            } else {
              // Handle empty name or unselected course
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a name and select a course'),
                ),
              );
            }
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
    },
  );
}
