import 'dart:convert';

import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CalenderController extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    selectedDay.value = selectDay;
  }

  var isLoading = false.obs;

  @override
  void onInit() {
    calenderBookingLst(DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(selectedDay.value.toString())));
    super.onInit();
  }

  var bookingList = [].obs;

  var isnoBooking = false.obs;

  var orgnlBookingList = [].obs;
  var CalenderbookingLists = [].obs;
  var jsonString;
  void calenderBookingLst(String date) async {
    try {
      isLoading.value = true;
      CalenderbookingLists.clear();
      var data = {"date": date};

      var response = await http.post(
        Uri.parse("${baseUrl}custom/calenderEventsWithDateAPIout"),
        body: jsonEncode(data),
        headers: {
          "apikey": header,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        jsonString = json.decode(response.body);
        if (jsonString["data"][0]["data"]["hotelBookingDTOList"].isEmpty) {
          isnoBooking.value = true;
          print("emptyyyy");
        } else {
          isnoBooking.value = false;
          CalenderbookingLists.addAll(
              jsonString["data"][0]["data"]["hotelBookingDTOList"]);
          print("vvvvvvvvvv${CalenderbookingLists}");
        }

        isLoading.value = false;
      }
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}

//================

// import 'package:get/get.dart';

// class CalendarController extends GetxController {
//   // Observable variables to update UI reactively
//   final Rx<DateTime> selectedDay = DateTime.now().obs;
//   final List<DateTime> unavailableDates; // List of unavailable dates

//   CalendarController({required this.unavailableDates});

//   // Function to check if a day is unavailable
//   bool isDayUnavailable(DateTime day) {
//     return unavailableDates.any((unavailableDay) =>
//         day.year == unavailableDay.year &&
//         day.month == unavailableDay.month &&
//         day.day == unavailableDay.day);
//   }
// }
