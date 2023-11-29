import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccomodationController extends GetxController {
  List<List<String>> native = [
    ["India", "1"],
    ["Dubai", "2"]
  ];
  var selectedNative = ''.obs;
  void onNatSelected(String value) {
    selectedNative.value = value;
  }

  List<List<String>> destination = [
    ["Maldives", "1"],
    ["New Zealand", "2"],
    ["Thailand", "3"],
    ["Singapore", "4"],
  ];
  var selectedDestinaion = ''.obs;
  void onDesSelected(String value) {
    selectedDestinaion.value = value;
  }

  var checkInDate = "".obs;
  DateTime? checkin;
  var checkOutDate = "".obs;
  DateTime? checkout;
  DateTime? dateforCal1;
  DateTime? dateforCal2;
  Rx<Duration> difference = Duration(seconds: 0).obs;
  final TextEditingController nitController = TextEditingController();
  var isDateShown = false.obs;
  var ischeckInError = false.obs;
  var ischeckOutError = false.obs;
  var isnightError = false.obs;

  Future<void> selectCheckin(BuildContext context) async {
    print("this is difff${difference}");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate.value != "" ? checkin! : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: checkOutDate.value == ""
          ? DateTime(3000)
          : checkout!.subtract(Duration(days: 1)),
    );
    if (picked != null) {
      checkin = picked;
      checkInDate.value =
          DateFormat('MMM-dd-yyyy').format(DateTime.parse(picked.toString()));
      ischeckInError.value = false;
      dateforCal1 = DateFormat('MMM-dd-yyyy').parse(checkInDate.value);
      if (checkOutDate.value != "") {
        nigtCalculate();
      }
      print("checkindateeeee===${checkInDate}");
    } else {
      print("not pickedd");
    }
  }

  nigtCalculate() {
    difference.value = dateforCal2!.difference(dateforCal1!.toUtc());
    print("difffvalueee${difference.value}");
    if (difference.value != Duration(seconds: 0)) {
      nitController.text = difference.value.inDays.toString();
    }
    print("nightttt${difference.value.inDays}");
  }

  Future<void> selectCheckout(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate.value != ""
          ? checkout!
          : checkInDate.value != ""
              ? checkin!.add(Duration(days: 1))
              : DateTime.now().add(
                  Duration(days: 1)), // initialDate: checkInDate.value != ""
      //     ?checkin!.add(Duration(days: 1))
      //     : DateTime.now(),
      firstDate: checkInDate.value == ""
          ? DateTime.now().add(Duration(days: 1))
          : checkin!.add(Duration(days: 1)),
      lastDate: DateTime(3000),
    );
    if (picked != null) {
      checkout = picked;

      checkOutDate.value =
          DateFormat('MMM-dd-yyyy').format(DateTime.parse(picked.toString()));
      ischeckOutError.value = false;
      dateforCal2 = DateFormat('MMM-dd-yyyy').parse(checkOutDate.value);
      if (checkInDate.value != "") {
        nigtCalculate();
      }

      print("checkindateeeee===${checkOutDate}");
    } else {
      print("not pickd");
    }
  }

  void updateCheckoutDate(int nights) {
    if (dateforCal1 != null) {
      // Calculate the new checkout date based on the number of nights
      DateTime newCheckoutDate = dateforCal1!.add(Duration(days: nights));
      checkout = newCheckoutDate;
      checkOutDate.value = DateFormat('MMM-dd-yyyy').format(newCheckoutDate);
      dateforCal2 = newCheckoutDate;
      nigtCalculate();
    }
  }

  //room and guest dropdown values
  var isSubLoading = true.obs;

  var roomCount = "".obs;

  var selectedChildIndex = "".obs;
  List selectedDdindex = <String>[].obs;
  var adultDdnum = [].obs;
  var guestTotal;

  var childDdnum = [].obs;
  List<List<dynamic>> ageTextControllers = [];
  var isValidate = false.obs;
  var isSearchtapped = false.obs;
}
