import 'package:flutter/material.dart';

import '../app/models/task_model.dart';
import '../theme/app_colors.dart';
class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  const TaskCard({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0,top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.05),
                offset: const Offset(0, 25),
                blurRadius: 50
            ),
          ],
          color: AppColors.primarySwatchColor.shade800,
          borderRadius: BorderRadius.circular(15),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.task,style: const TextStyle(fontSize: 18,color: AppColors.whiteColor,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
             Divider(thickness: 1,color: AppColors.blackColor.withOpacity(0.5),),
            const SizedBox(height: 10,),

            Text(taskModel.dateAndTime,style: const TextStyle(fontSize: 14,color: AppColors.whiteColor,fontWeight: FontWeight.w500),),

          ],
        ),
      ),
    );;
  }
}
