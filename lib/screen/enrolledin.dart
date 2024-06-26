import 'package:first_assignment/model/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../techer_controller.dart';

class EnrolledInScreen extends StatelessWidget {
   EnrolledInScreen({super.key});
   final TeacherListController controller = Get.find(); // Access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enrolled In Screen'),),
      body:controller.teachers.length ==0?Center(child: Text('List is Empty'),):  ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: controller.teachers.length,
        itemBuilder: (context,index){
          Teacher item = controller.teachers[index];
        return Card(
          child: ListTile(title: Text(item.name),
          subtitle: Text(item.course),),
        );
      }),
    );
  }
}