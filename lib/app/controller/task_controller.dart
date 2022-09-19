import 'package:assignment_flutter/app/models/task_model.dart';
import 'package:flutter/material.dart';

import '../../repositiory/local_storage.dart';

class TaskController extends ChangeNotifier {
  TextEditingController taskEditingController = TextEditingController();
  TextEditingController dateAndTimeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LocalStorageService localStorage = LocalStorageService();

  List<TaskModel> get items => localStorage.getAllTasks();


  setDateTimeController(BuildContext context) async{
    try {
      DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2050),
      );

      if (datePicker == null) return;
      TimeOfDay? timeOfDayPicker = await showTimePicker(
          context: context, initialTime: TimeOfDay.now());
      if(timeOfDayPicker==null) return;


      String dateTimeValue ="Date ${datePicker.year}:${datePicker.month}:${datePicker.day}   Time ${timeOfDayPicker.hour.toString().padLeft(2,'0')}: ${timeOfDayPicker.minute.toString().padLeft(2,'0')}";

      dateAndTimeController.text =
          dateTimeValue;
    } catch (e) {
      print(e);
    }
  }
  void addTask(TaskModel item) {
    localStorage.saveTaskItem(item);
    notifyListeners();
  }

  void deleteTask(TaskModel item) {
    localStorage.deleteTask(item);
    notifyListeners();
  }
}
