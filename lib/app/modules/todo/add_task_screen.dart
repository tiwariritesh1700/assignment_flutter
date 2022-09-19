import 'package:assignment_flutter/app/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';
import '../../../utils/WidgetUtils/app_button.dart';
import '../../../utils/WidgetUtils/app_text_form_field.dart';
import '../../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late final TaskController? _taskController;
  @override
  void initState() {

    super.initState();
    _taskController = Provider.of<TaskController>(context, listen: false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.whiteColor),

          title: const Text(
            'Add Task',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppTextSize.HEADING_SMALL_22,
                color: AppColors.whiteColor),
          ),
        ),
        body: _buildAddTaskView(context));
  }

  ListView _buildAddTaskView(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
        children: [
          _formView(context),
          const SizedBox(height: 15,),
          _buttonView(context)
        ],
      );
  }

  Row _buttonView(BuildContext context) {
    return Row(
          children: [
             Expanded(child:  AppButton(buttonText: 'Save',onPressed: (){
              if(_taskController!.formKey.currentState!.validate()){
                FocusManager.instance.primaryFocus?.unfocus();

                _taskController?.addTask(TaskModel(task:_taskController!.taskEditingController.value.text , dateAndTime: _taskController!.dateAndTimeController.value.text));
                _taskController?.clear();
                Navigator.pop(context);

              }
            },)),
            const SizedBox(
              width: 15,
            ),

            Expanded(child:  AppButton(buttonText: 'Clear',onPressed: (){
              FocusManager.instance.primaryFocus?.unfocus();

              _taskController?.clear();

            },)),

          ],
        );
  }

  Form _formView(BuildContext context) {
    return Form(
          key: _taskController?.formKey,
          child: Column(
            children: [

              AppTextFormField(
                label: 'Add Task',

                controller: _taskController!.taskEditingController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Field Cannot be empty';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),
              AppTextFormField(
                label: 'Date and Time',

                onTap: (){
                  _taskController?.setDateTimeController(context);

                },
                controller: _taskController!.dateAndTimeController,
                readOnly: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Field Cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
  }
}
