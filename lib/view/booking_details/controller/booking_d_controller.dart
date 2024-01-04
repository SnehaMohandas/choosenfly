import 'dart:convert';

import 'package:choose_n_fly/model/all_booking_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class BookingDController extends GetxController {
  AllBookingsModel? allBookingsModel;
  //var selectedValue = 'Upcoming'.obs;
  var isLoading = true.obs;

  // void setSelectedValue(String value) {
  //   selectedValue.value = value;
  // }

  var timePeriod = DateFormat('MMM/yyyy').format(DateTime.now()).obs;
  List<List<String>> status = [
    ["Upcoming", "1"],
    ["Completed", "2"],
    ["Cancelled", "3"]
  ];
  var selectedStatus = '1'.obs;
  var exceptionCatched = false.obs;
  var noBooking = false.obs;

  fetchAllBOokings(searchKey) async {
    print("seachkeyyy===>>${searchKey}");
    print("tymmm==>${timePeriod.value}");
    print("stssss==>${selectedStatus.value}");

    try {
      isLoading.value = true;
      exceptionCatched.value = false;
      noBooking.value = false;

      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/bookingListNewAPIout?period=${timePeriod.value}&bookingTypes=${selectedStatus.value}&searchkey=${searchKey}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        print(jsonString);
        List dataList = jsonString["data"];
        print("datlissttttt===>${dataList}");
        if (dataList.isEmpty) {
          noBooking.value = true;
        } else {
          print("object");
          var data = allBookingsModelFromJson(response.body);
          allBookingsModel = data;
          print(allBookingsModel);
        }
      } else {
        exceptionCatched.value = true;
        print("000000");
      }
      isLoading.value = false;
    } catch (e) {
    } finally {
      // isLoading.value = false;
    }
  }

  //cancel booking inhouse

  cancelBookinginH(bookinId) async {
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/cancelInhouseBookingAPIout?id=${bookinId}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Booking Cancelled");
        Get.back();
        print(response.body);
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  //cancel booking jumerah

  cancelBookingJum(bookinId, lastName, email) async {
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/cancelJumeirahBookingAPIout?key=${bookinId}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Booking Cancelled");
        Get.back();
        print(response.body);
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  //cancel booking atharva

  cancelBookingAth(
    bookinId,
  ) async {
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/cancelJumeirahBookingAPIout?key=${bookinId}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Booking Cancelled");
        Get.back();
        print(response.body);
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  //cancel booking iwtx
  cancelBookingIWTX(
    bookinId,
  ) async {
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse("${baseUrl}custom/iwtxCancelBookingAPIout?key=${bookinId}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Booking Cancelled");
        Get.back();
        print(response.body);
      }
      isLoading.value = false;
    } catch (e) {
    } finally {
      // isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchAllBOokings("");

    super.onInit();
  }
}
