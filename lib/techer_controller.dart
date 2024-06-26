import 'package:get/get.dart';
import 'model/teacher_model.dart';

class TeacherListController extends GetxController {
  final RxList<Teacher> teachers = RxList<Teacher>([]);

  void addTeacher(String name, String course) {
    teachers.add(Teacher(name: name, course: course));
  }
}
