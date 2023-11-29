import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/calender/controller/calender_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPAge extends StatelessWidget {
  CalenderPAge({super.key});

  DateTime today = DateTime.now();
  List bookingList = [];

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
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
                    height: 23,
                  ),
                  IconButton(
                      onPressed: () {
                        homeController.selecedTab.value = 0;
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorConstant.white,
                        size: 25,
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              homeController.selecedTab.value = 0;
                              Get.offAll(() => HomeScreen());
                            },
                            child: tabbar1(
                                homeController, 0, "New Booking", context),
                          ),
                          GestureDetector(
                            onTap: () {
                              homeController.selecedTab.value = 1;
                            },
                            child:
                                tabbar1(homeController, 1, "Accounts", context),
                          ),
                          GestureDetector(
                            onTap: () async {
                              homeController.selecedTab.value = 2;
                              Get.to(() => CalenderPAge());
                            },
                            child:
                                tabbar1(homeController, 2, "Calender", context),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () {
                final events = calenderController.events;
                final selectedDate = calenderController.selectedDate.value;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCalendar(
                    headerStyle: HeaderStyle(formatButtonVisible: false),
                    calendarFormat: CalendarFormat.month,
                    firstDay: DateTime.now().subtract(Duration(days: 365)),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: calenderController.selectedDate.value,
                    selectedDayPredicate: (date) =>
                        isSameDay(date, selectedDate),
                    eventLoader: (date) => _getEventsForDay(date, events),
                    onDaySelected: (date, events) {
                      if (date != null) {
                        calenderController.selectedDate.value = date;
                      }
                    },
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, event) {
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                color: Colors.black, // Text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      // todayBuilder: (context, day, focusedDay) {
                      //   return Container(
                      //     width: 40,
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //         color: ColorConstant.primaryColor,
                      //         border: Border.all(
                      //           color: Color.fromARGB(43, 75, 75,
                      //               73), // Set border color for selected day
                      //           width: 2.0, // Set border width
                      //         ),
                      //         borderRadius: BorderRadius.circular(12)),
                      //     child: Center(
                      //       child: Text(
                      //         day.day.toString(),
                      //         style: TextStyle(
                      //           color: Colors.white, // Text color
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // },
                      selectedBuilder: (context, day, focusedDay) {
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              border: Border.all(
                                color: Color.fromARGB(43, 75, 75,
                                    73), // Set border color for selected day
                                width: 2.0, // Set border width
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              focusedDay.day.toString(),
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 124,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF353BA3)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Done',
                    ))
              ],
            ),
            Obx(() {
              for (int i = 0; i < calenderController.events.length; i++) {
                bookingList.addAll([calenderController.events[i].eventName]);
              }
              final selectedDate = calenderController.selectedDate.value;
              final events = calenderController.events
                  .where((event) => isSameDay(event.date, selectedDate))
                  .toList();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Bookings for the day:',
                        style: GoogleFonts.plusJakartaSans(
                            color: ColorConstant.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        // style: TextingStyle.font16Normal,
                        //style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (events.isEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "There is no bookings for the day",
                            style: GoogleFonts.plusJakartaSans(
                              color: ColorConstant.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    for (var event in events)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        // child: Text(event.eventName),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color.fromARGB(83, 0, 0, 0)),
                              borderRadius: BorderRadius.circular(8)),
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: double.infinity,
                          // child: Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(event.eventName),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Booking Details")
                              ],
                            ),
                          ),
                          //),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<EventModel> _getEventsForDay(DateTime date, RxList<EventModel> events) {
    return events.where((event) => isSameDay(event.date, date)).toList();
  }
}
