import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/booking_d_inner.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_d_controller.dart';
import 'package:choose_n_fly/view/calender/controller/calender_controller.dart';
import 'package:choose_n_fly/view/coming_soon/coming_soon.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPAge extends StatelessWidget {
  CalenderPAge({super.key});
  final NetworkController networkController = Get.find<NetworkController>();

  DateTime today = DateTime.now();
  List bookingList = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (networkController.isConnected.value) {
        var calenderController = Get.put(CalenderController());
        var homeController = Get.find<HomeController>();
        return WillPopScope(
          onWillPop: () async {
            homeController.selecedTab.value = 0;
            return true;
          },
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  height: MediaQuery.of(context).size.height * 0.17,
                  // height: 148,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      IconButton(
                          onPressed: () {
                            homeController.selecedTab.value = 0;
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ColorConstant.white,
                            //size: 25,
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  homeController.selecedTab.value = 0;
                                  Get.off(() => HomeScreen());
                                },
                                child: tabbar1(
                                    homeController, 0, "New Booking", context),
                              ),
                              GestureDetector(
                                onTap: () {
                                  homeController.selecedTab.value = 1;
                                  Get.to(() => ComingSoon());
                                },
                                child: tabbar1(
                                    homeController, 1, "Accounts", context),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  homeController.selecedTab.value = 2;
                                  Get.to(() => CalenderPAge(),
                                      transition:
                                          Transition.rightToLeftWithFade);
                                },
                                child: tabbar1(
                                    homeController, 2, "Calender", context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      TableCalendar(
                        calendarStyle: const CalendarStyle(
                            markerDecoration: BoxDecoration(
                                color: ColorConstant.lightBlue,
                                shape: BoxShape.circle)),
                        headerStyle:
                            const HeaderStyle(formatButtonVisible: false),
                        calendarFormat: CalendarFormat.month,
                        firstDay:
                            DateTime.now().subtract(const Duration(days: 365)),
                        lastDay: DateTime.now().add(const Duration(days: 365)),
                        focusedDay: calenderController.selectedDay.value,
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              calenderController.selectedDay.value, day);
                        },

                        onDaySelected: (date, events) {
                          calenderController.selectedDay.value = date;
                          calenderController.calenderBookingLst(
                              DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                  calenderController.selectedDay.value
                                      .toString())));

                          print(calenderController.selectedDay.value);
                        },

                        // Other configurations...
                      ),
                      Obx(() => calenderController.isLoading.value == true
                          ? Expanded(
                              child: Center(
                                child: loader(),
                              ),
                            )
                          : calenderController.CalenderbookingLists.length == 0
                              ? Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 120,
                                        width: 120,
                                        child: Lottie.asset(
                                            "assets/animation/no_calender.json",
                                            fit: BoxFit.cover),
                                      ),
                                      const Text(
                                        "No Bookings for the day",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorConstant.lightBlue,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      "Bookings for the day",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                            padding: const EdgeInsets.all(8),
                                            itemCount: calenderController
                                                .CalenderbookingLists.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => BookingInnerpage(
                                                            bookingId: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "booking_id"] ??
                                                                "",
                                                            bookingCode: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "booking_code"] ??
                                                                "",
                                                            apiType: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "api_id"] ??
                                                                "",
                                                            agentName: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "agentname"] ??
                                                                "",
                                                            bookingDate: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "booking_date"] ??
                                                                "",
                                                            deadlineDate:
                                                                calenderController
                                                                            .CalenderbookingLists[index]
                                                                        [
                                                                        "cancelTime"] ??
                                                                    "",
                                                            hotelName: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "hotelname"] ??
                                                                "",
                                                            paymentStatus:
                                                                calenderController
                                                                            .CalenderbookingLists[index]
                                                                        [
                                                                        "paymentStatus"] ??
                                                                    "",
                                                            refCode: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "clientrefernce"] ??
                                                                "",
                                                            totalMount: calenderController
                                                                            .CalenderbookingLists[
                                                                        index][
                                                                    "total_cost"] ??
                                                                "",
                                                            selectedStatus: "0",
                                                          ),
                                                      transition: Transition
                                                          .rightToLeftWithFade);
                                                },
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(8),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                            spreadRadius: 2,
                                                            blurRadius: 10),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorConstant.white),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          FontAwesomeIcons
                                                              .hotel,
                                                          color: Color.fromARGB(
                                                            255,
                                                            238,
                                                            177,
                                                            177,
                                                          ),
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          calenderController
                                                                          .CalenderbookingLists[
                                                                      index][
                                                                  "booking_code"] ??
                                                              "",
                                                          style: const TextStyle(
                                                              fontSize: 13.3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: ColorConstant
                                                                  .lightBlue),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }))
                                  ],
                                )))
                    ],
                  ),
                ),
                // )
              ],
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }
}

//==================

// import 'package:choose_n_fly/view/calender/controller/calender_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalenderPAge extends StatelessWidget {
//   // Initialize your calendar controller
//   final CalendarController calendarController = Get.put(CalendarController(
//     unavailableDates: [
//       DateTime.now().add(Duration(days: 5)), // Example unavailable date
//       DateTime.now().add(Duration(days: 10)), // Another example
//     ],
//   ));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Calendar with Unavailability"),
//       ),
//       body: Obx(() => TableCalendar(
//             headerStyle: const HeaderStyle(formatButtonVisible: false),
//             firstDay: DateTime.utc(2010, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14),
//             focusedDay: calendarController.selectedDay.value,
//             selectedDayPredicate: (day) =>
//                 isSameDay(calendarController.selectedDay.value, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               if (!calendarController.isDayUnavailable(selectedDay)) {
//                 print("ppppppppp");
//                 // Update observable variables
//                 calendarController.selectedDay.value = selectedDay;
//               }
//             },
//             calendarBuilders: CalendarBuilders(
//               // Custom builder to mark unavailable days
//               defaultBuilder: (context, day, focusedDay) {
//                 if (calendarController.isDayUnavailable(day)) {
//                   return Container(
//                     height: 35,
//                     width: 35,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.red),
//                     child: Center(
//                       child: Text(
//                         day.day.toString(),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   );
//                 }
//                 // Return null for all other days to use the default builder.
//                 return null;
//               },
//             ),
//           )),
//     );
//   }
// }
