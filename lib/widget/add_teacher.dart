import 'package:flutter/material.dart';

class AddTeacherDialog extends StatefulWidget {
  final Function(String teacherName, String course) onAdd;

  const AddTeacherDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddTeacherDialogState createState() => _AddTeacherDialogState();
}

class _AddTeacherDialogState extends State<AddTeacherDialog> {
  final _formKey = GlobalKey<FormState>();
  final _teacherNameController = TextEditingController();
  final _courseController = TextEditingController();

  @override
  void dispose() {
    _teacherNameController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Teacher'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _teacherNameController,
              decoration: InputDecoration(
                hintText: 'Teacher Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter teacher name.';
                }
                return null;
              },
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _courseController,
              decoration: InputDecoration(
                hintText: 'Course Allocated',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter course allocated.';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String teacherName = _teacherNameController.text;
              String course = _courseController.text;
              widget.onAdd(teacherName, course);
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Map<String, String>> teachers = []; // List to store teacher data

//   void addTeacher(String teacherName, String course) {
//     setState(() {
//       teachers.add({
//         'teacherName': teacherName,
//         'course': course,
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Teacher List'),
//         ),
//         body: ListView.builder(
//           itemCount: teachers.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(teachers[index]['teacherName']! + ' - ' + teachers[index]['course']!),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AddTeacherDialog(onAdd: addTeacher);
//               },
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

