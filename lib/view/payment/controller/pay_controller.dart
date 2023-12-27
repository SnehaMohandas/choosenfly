import 'package:get/get.dart';

class PayController extends GetxController {
  var selectedValue = 'Wallet'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
