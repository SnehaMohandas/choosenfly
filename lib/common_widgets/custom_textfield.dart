import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key,
      required this.hint,
      required this.prefix,
      required this.controller,
      this.suffix});
  final hint;
  final prefix;
  final controller;
  var suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(4),
        prefixIcon: prefix,
        suffixIcon: suffix != null ? suffix : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstant.grey)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorConstant.grey)),
      ),
      validator: (value) {
        if (value == null || value == "") {
          return "Please enter ${hint}";
        }
        return null;
      },
    );
  }
}
