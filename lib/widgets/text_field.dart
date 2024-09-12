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
      this.controller});
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: Constants.dismisTextField,
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    ).marginSymmetric(vertical: Constants.primaryPadding / 2);
  }
}
