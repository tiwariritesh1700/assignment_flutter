
import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel{

  @HiveField(0)
  String task;
  @HiveField(1)
  String dateAndTime;


  TaskModel({required this.task, required this.dateAndTime,});
}