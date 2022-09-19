import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';

import '../../../utils/WidgetUtils/app_button.dart';
import '../../../utils/WidgetUtils/app_text_form_field.dart';
import '../../controller/encryption_controller.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({Key? key}) : super(key: key);

  @override
  State<EncryptionScreen> createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  EncryptionController? _encryptionController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _encryptionController =
        Provider.of<EncryptionController>(context, listen: true);

    return Scaffold(
      body: _buildEncryptionView(),
    );
  }

  ListView _buildEncryptionView() {
    return ListView(
      padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
      children: [
        _formView(),
        _buttonsView(),
        const SizedBox(
          height: 50,
        ),
        _resultCardView(),
      ],
    );
  }

  Widget _resultCardView(){
    return  Column(children: [
      _resultTextView('Encrypt Data',_encryptionController!.encryptedValue),
      const SizedBox(
        height: 15,
      ),
      _resultTextView('Decrypt Data',_encryptionController!.decryptedValue),

    ],);
  }

  Row _buttonsView() {
    return Row(
        children: [

          Expanded(child: AppButton(buttonText: 'Encrypt',onPressed: (){
            if (_encryptionController!.formKey.currentState!
                .validate()) {
              FocusManager.instance.primaryFocus?.unfocus();

              _encryptionController?.encryptMyData();
            }
          },),),

          const SizedBox(
            width: 15,
          ),

           Expanded(child: AppButton(buttonText: 'Decrypt',onPressed: (){
            if (_encryptionController!.formKey.currentState!
                .validate()) {
              FocusManager.instance.primaryFocus?.unfocus();

              _encryptionController?.decryptMyData();
            }
          },))
        ],
      );
  }

  Form _formView() {
    return Form(
        key: _encryptionController?.formKey,
        child: Column(
          children: [

            AppTextFormField(
              label: 'Message',
              minLines: 8,
              maxLines: 15,
              controller: _encryptionController!.messageController,
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
              label: 'Secret Key',
              maxLength: 16,
              controller: _encryptionController!.secretController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Field Cannot be empty';
                }
                if (value.isNotEmpty && value.length == 15) {
                  return 'secret key minimum length should be 16  ';
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
  
  Widget _resultTextView(String labelCard,String labelValue){
   return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16, top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                   child: Center(
                     child: Text(
                      '$labelCard',
                      style: const TextStyle(
                        fontSize: AppTextSize.LABEL_MEDIUM_18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.75
                      ),
            ),
                   ),
                 ),
               ],
             ),
            const SizedBox(height: 15),
            Visibility(
              visible:labelValue.trim().isNotEmpty?true:false,
              child: Column(children: [
                SelectableText(
                  labelValue,
                  style:  const TextStyle(
                      fontSize: AppTextSize.LABEL_SMALL_16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.75
                  ),
                  toolbarOptions:
                  const ToolbarOptions(copy: true, selectAll: true),
                ),
                const SizedBox(height: 15),
              ],),
            )

          ],
        ),
      ),
    );
  }
}



