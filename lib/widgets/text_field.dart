import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/common/const.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.enabled = true,
      this.keyboardType,
      this.alignLabelWithHint = true,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.controller});
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool alignLabelWithHint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      controller: controller,
      onTapOutside: Constants.dismisTextField,
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    ).marginSymmetric(vertical: Constants.primaryPadding / 2);
  }
}
