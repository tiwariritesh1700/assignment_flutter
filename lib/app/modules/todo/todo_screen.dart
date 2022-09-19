import 'package:assignment_flutter/app/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

import '../../../component/task_card.dart';
import '../../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, Routes.ADD_TASK);
      },child: const Icon(Icons.add,color: AppColors.whiteColor,),),
      body:Consumer<TaskController>(builder: (context, value, widget) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return SwipeActionCell(
              key: ValueKey(value.items[index]),
              trailingActions: <SwipeAction>[
                SwipeAction(
                    title: "Delete",

                    performsFirstActionWithFullSwipe: true,


                    onTap: (CompletionHandler handler) async {


                      value.deleteTask(value.items[index]);
                    },
                    color: Colors.red),
              ],
              child: TaskCard(
                  taskModel: value.items[index]),
            );
          },
          itemCount: value.items.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
        );
      }),
    );
  }
}
