import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RoomController2 extends GetxController {
  String nightCount;
  AccomodationController acController;
  RoomController2(this.nightCount, this.acController);

  var isInteriorClicked = true.obs;
  var interiorIndex = "1".obs;
  var exteriorIndex = "1".obs;
  var interior = [
    "assets/images/int1.jpg",
    "assets/images/int2.jpeg",
    "assets/images/int3.jpg"
  ];
  var exterior = ["assets/images/ext1.jpg", "assets/images/ext2.jpg"];
  List<List<String>> rooms = [
    ["Deluxe Room", "1"],
    [
      "Single",
      "2",
    ],
    ["Family", "3"]
  ];
  var selectedRoom = '1'.obs;

  void onRoomSelected(String value) {
    selectedRoom.value = value;
  }

  List<String> courtesy2 = ["Mr.", "Mrs", "Ms", "Master"];

  // List<List<String>> courtesy2 = [
  //   //  "Mr.", "Mrs", "Ms", "Master"
  //   ["Mr.", "1"],
  //   [
  //     "Mrs.",
  //     "2",
  //   ],
  //   ["Ms", "3"],
  //   ["Master", "4"]
  // ];
  List<String> courtesy1 = [
    "Mr.", "Mrs.", "Ms."
    // ["Mr."],
    // ["Mrs."],
    // ["Ms"]
  ];

  List<String> gender = ["Male", "Female"];
  var selectedcourtesy1 = "Mr.".obs;

  var selectedcourtesy2 = [].obs;
  var selectedGender = [].obs;

  void oncourtesySelected(String value) {
    // selectedcourtesy.value = value;
  }

  var checkInDate = "".obs;
  DateTime? checkin;
  var checkOutDate = "".obs;
  var newCheckinDate = "".obs;
  var newCheckoutDate = "".obs;
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
        initialDate: checkInDate.value != "" ? checkin! : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: checkOutDate.value != ""
            ? checkout!.subtract(Duration(days: 1))
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
    print("ni8 cal");
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
          : checkInDate.value != ""
              ? checkin!.add(Duration(days: 1))
              : DateTime.now().add(
                  Duration(days: 1)), // initialDate: checkInDate.value != ""
      //     ?checkin!.add(Duration(days: 1))
      //     : DateTime.now(),
      firstDate: checkInDate.value != ""
          ? checkin!.add(Duration(days: 1))
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

  void updateCheckoutDate(int nights, AccomodationController acController) {
    if (dateforCal1 != null || acController.dateforCal1 != null) {
      print("its workeddd");
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
  var newRoomCount = "".obs;

  var selectedChildIndex = "".obs;
  List selectedDdindex = <String>[].obs;
  var adultDdnum = [].obs;
  RxInt guestTotal = 0.obs;

  var childDdnum = [].obs;
  List<List<dynamic>> ageTextControllers = [];
  var itemLimit = 1.obs;
  var isValidate = false.obs;
  var isSearchModify = false.obs;
  List<List> allAgeOrgs = [];

  //accomodationdetail post
  var accommodationDetails;

  @override
  void onInit() {
    // if (nightCount != null) {
    //   nitController.text = nightCount;
    //   print(nitController.text);
    // }

    super.onInit();
  }
}
