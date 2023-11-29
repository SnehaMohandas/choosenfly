import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RoomController extends GetxController {
  var isInteriorClicked = true.obs;
  var interiorIndex = "1".obs;
  var exteriorIndex = "1".obs;
  var interior = [
    "https://www.decorilla.com/online-decorating/wp-content/uploads/2023/02/Interior-design-trends-2023-imagined-by-Decorilla.jpg",
    "https://www.decorilla.com/online-decorating/wp-content/uploads/2022/08/2023-interior-design-trends-Dina-H.jpeg",
    "https://essentialhome.eu/inspirations/wp-content/uploads/2017/01/The-Importance-Of-Interior-Design-4.jpg"
  ];
  var exterior = [
    "https://amazingarchitecture.com/storage/1488/moder_house_night_illumination.jpg",
    "https://static.asianpaints.com/content/dam/asianpaintsbeautifulhomes/202209/20-exterior-house-designs/home-exterior-design.jpg",
    "https://st.hzcdn.com/simgs/c4413d9e05478f4a_16-4133/home-design.jpg",
    "https://allurausa.com/uploads/image/file/113/home-design_22.jpg"
  ];
  List<List<String>> rooms = [
    ["Deluxe Room", "1"],
    [
      "Single",
      "2",
    ],
    ["Family", "3"]
  ];
  var selectedRoom = ''.obs;
  void onRoomSelected(String value) {
    selectedRoom.value = value;
  }

  List<List<String>> courtesy = [
    ["Mr.", "1"],
    [
      "Mrs.",
      "2",
    ],
    ["Ms", "3"]
  ];
  var selectedcourtesy = '1'.obs;
  void oncourtesySelected(String value) {
    selectedcourtesy.value = value;
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

  Future<void> selectCheckin(
      BuildContext context, AccomodationController acController) async {
    print("this is difff${difference}");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: checkInDate.value != ""
            ? checkin!
            : acController.checkInDate.value != ""
                ? acController.checkin!
                : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: checkOutDate.value != ""
            ? checkout!.subtract(Duration(days: 1))
            : acController.checkOutDate.value != ""
                ? acController.checkout!.subtract(Duration(days: 1))
                : DateTime(3000));
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

  Future<void> selectCheckout(
      BuildContext context, AccomodationController acController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate.value != ""
          ? checkout!
          : acController.checkOutDate.value != ""
              ? acController.checkout!
              : checkInDate.value != ""
                  ? checkin!.add(Duration(days: 1))
                  : acController.checkInDate.value != ""
                      ? acController.checkin!.add(Duration(days: 1))
                      : DateTime.now().add(Duration(
                          days: 1)), // initialDate: checkInDate.value != ""
      //     ?checkin!.add(Duration(days: 1))
      //     : DateTime.now(),
      firstDate: checkInDate.value != ""
          ? checkin!.add(Duration(days: 1))
          : acController.checkInDate.value != ""
              ? acController.checkin!.add(Duration(days: 1))
              : DateTime.now().add(Duration(days: 1)),

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

//room&guest dropdown values
  var isSubLoading = true.obs;

  var roomCount = "".obs;

  var selectedChildIndex = "".obs;
  List selectedDdindex = <String>[].obs;
  var adultDdnum = [].obs;
  var guestTotal;

  var childDdnum = [].obs;
  List<List<dynamic>> ageTextControllers = [];
}
