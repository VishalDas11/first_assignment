import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
   CourseScreen({super.key});

  List<String> courselist = [
      'Programming',
      'Database',
      'Discrete Structure',
      'Multivariable Calculus',
      'English',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Screen'),),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: courselist.length,
        itemBuilder: (context,index){
          var item = courselist[index];
        return Card(
          child: ListTile(title: Text(item.toString())),
        );
      }),
    );
  }
}