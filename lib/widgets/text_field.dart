import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';

class MyTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool alignLabelWithHint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final FormFieldValidator<String>? validator;

  const MyTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.alignLabelWithHint = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: Constants.dismisTextField,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        alignLabelWithHint: alignLabelWithHint,
      ),
      validator: validator,
    ).marginSymmetric(vertical: Constants.primaryPadding / 2);
  }
}
