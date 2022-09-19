
import 'package:hive_flutter/hive_flutter.dart';

import '../app/models/task_model.dart';

class LocalStorageService {
  static const String taskBoxKey = "taskBox";

  static final LocalStorageService _instance = LocalStorageService.internal();


  late Box<TaskModel> taskBox;

  LocalStorageService.internal();

  factory LocalStorageService() {
    return _instance;
  }

  Future<void> initializeHive() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskModelAdapter());
    }

    try {
      taskBox =  await Hive.openBox<TaskModel>(taskBoxKey);

    } catch (e) {
      print(e);
    }
  }

  saveTaskItem(TaskModel taskModel) {
    taskBox.add(taskModel);

  }

  List<TaskModel> getAllTasks() {
    return taskBox.values.toList();
  }





  deleteTask(TaskModel taskModel) async{

    // Create a map out of it
    final Map<dynamic, TaskModel> map = taskBox.toMap();
    dynamic desiredKey;
    // For each key in the map, we check if the transaction is the same as the one we want to delete
    map.forEach((key, value) {
      if (value.task == taskModel.task) desiredKey = key;
    });
    // If we found the key, we delete it
    taskBox.delete(desiredKey);

  }


}
