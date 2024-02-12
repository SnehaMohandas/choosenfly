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

  cancelBooking(bookinId, type) async {
    try {
      // isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}/custom/singleCancelBookingAPIout?bookingId=${bookinId}&apiType=${type}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print(response.statusCode);

        Fluttertoast.showToast(msg: "Booking Cancelled");
        //Get.back();
        print(response.body);
        await fetchAllBOokings("");
      }
    } catch (e) {
    } finally {
      //isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchAllBOokings("");

    super.onInit();
  }
}
