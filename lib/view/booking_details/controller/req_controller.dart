import 'package:get/get.dart';

class ReqConfirmController extends GetxController {
  var selectedValue = 'Voucher'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  var timePeriod = "".obs;
}
