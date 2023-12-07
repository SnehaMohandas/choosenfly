import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingVoucherController extends GetxController {
  final emailController = TextEditingController();
  @override
  void onInit() {
    emailController.text = "agent@gmail.com";
    super.onInit();
  }
}
