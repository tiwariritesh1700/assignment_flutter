import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType textInput;
  final bool readOnly;
  final Function()? onTap;

  const AppTextFormField(
      {Key? key,
        required this.label,
        required this.controller,
        required this.validator,
        this.maxLength,
        this.maxLines,
        this.minLines,
        this.textInput = TextInputType.text,
        this.readOnly = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: textInput,
      validator: validator,
    );
  }
}
