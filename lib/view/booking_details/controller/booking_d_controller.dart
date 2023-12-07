import 'package:get/get.dart';

class BookingDController extends GetxController {
  var selectedValue = 'Upcoming'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  var timePeriod = "".obs;
  List<List<String>> status = [
    ["All", "1"],
    ["Upcoming", "2"],
    ["Completed", "3"],
    ["Cancelled", "4"]
  ];
  var selectedStatus = '1'.obs;
}
