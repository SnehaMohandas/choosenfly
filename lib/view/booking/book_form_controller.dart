import 'dart:convert';

import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookFormController extends GetxController {
  var leaddata;
  var guestFormdata;
  var parsedCheckin;
  var parsedCheckout;
  var roomController = Get.find<RoomController2>();
  var acController = Get.find<AccomodationController>();
  //  List<List<TextEditingController>> controllersList = [];

  Future postAccommodation(
      checkinDate, checkoutDate, roomType, roomDetails) async {
    parsedCheckin = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(checkinDate));
    parsedCheckout = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(checkoutDate));
    // print(guestFormdata);

    final Map<String, dynamic> requestData = {
      "CheckInDate": "${parsedCheckin}",
      "CheckOutDate": "${parsedCheckout}",
      "Roomtype": roomType.toString(),
      "HCode": "DXB9892146",
      "CityId": "1",
      "NationalityId": "1",
      "RoomDetail": roomDetails,
      "Lead": leaddata,
      "Guests": guestFormdata == null ? [] : guestFormdata
    };
    print("forms data list is here=====>>>${jsonEncode(requestData)}");
  }

  @override
  void onInit() {
    roomController.selectedcourtesy2.value = List.generate(
        roomController.guestTotal.value != 1 &&
                roomController.guestTotal.value != 0
            ? roomController.guestTotal.value - 1
            : roomController.guestTotal.value == 1
                ? 0
                : acController.orgguestTotal.value != 1 &&
                        acController.orgguestTotal.value != 0
                    ? acController.orgguestTotal.value - 1
                    : acController.guestTotal.value != 1 &&
                            acController.guestTotal.value != 0
                        ? acController.guestTotal.value - 1
                        : 0,
        (index) => "Mr.");
    roomController.selectedGender.value = List.generate(
        roomController.guestTotal.value != 1 &&
                roomController.guestTotal.value != 0
            ? roomController.guestTotal.value - 1
            : roomController.guestTotal.value == 1
                ? 0
                : acController.orgguestTotal.value != 1 &&
                        acController.orgguestTotal.value != 0
                    ? acController.orgguestTotal.value - 1
                    : acController.guestTotal.value != 1 &&
                            acController.guestTotal.value != 0
                        ? acController.guestTotal.value - 1
                        : 0,
        (index) => "");

    super.onInit();
  }
}
