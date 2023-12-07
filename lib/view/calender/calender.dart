import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/calender/controller/calender_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
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
              height: MediaQuery.of(context).size.height * 0.16,
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
                    calendarStyle: CalendarStyle(
                        markerDecoration: BoxDecoration(
                            color: ColorConstant.lightBlue,
                            shape: BoxShape.circle)),
                    headerStyle: HeaderStyle(formatButtonVisible: false),
                    calendarFormat: CalendarFormat.month,
                    firstDay: DateTime.now().subtract(Duration(days: 365)),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: calenderController.selectedDate.value,
                    selectedDayPredicate: (date) =>
                        isSameDay(date, selectedDate),
                    eventLoader: (date) {
                      // Load events for the given date
                      List<EventModel> dayEvents =
                          _getEventsForDay(date, events);

                      // Check if there are more than 1 event for the day
                      return dayEvents.length > 1 ? [dayEvents[0]] : dayEvents;
                    },
                    //  eventLoader: (date) => _getEventsForDay(date, events),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //       onPressed: () {},
            //       child: Text('Cancel'),
            //     ),
            //     SizedBox(
            //       width: 124,
            //     ),
            //     ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor:
            //               MaterialStateProperty.all<Color>(Color(0xFF353BA3)),
            //         ),
            //         onPressed: () {},
            //         child: Text(
            //           'Done',
            //         ))
            //   ],
            // ),
            Obx(() {
              for (int i = 0; i < calenderController.events.length; i++) {
                bookingList.addAll([calenderController.events[i].eventName]);
              }
              final selectedDate = calenderController.selectedDate.value;
              final events = calenderController.events
                  .where((event) => isSameDay(event.date, selectedDate))
                  .toList();
              print("evennnntttt${events}");

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
                        style: TextStyle(
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
                            style: TextStyle(
                              color: ColorConstant.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    // Expanded(
                    //   child: ListView.builder(
                    //       itemCount: events.length,
                    //       itemBuilder: (context, index) {
                    //         return Text(index.toString());
                    //       }),
                    // )

                    // Expanded(
                    //   child: ListView.builder(
                    //       itemCount: 1,
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           child: Text("data"),
                    //         );
                    //       }),
                    // )
                    // for (var event in events)
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //     // child: Text(event.eventName),

                    //     child: Container(
                    //       margin: const EdgeInsets.all(12),
                    //       //height: MediaQuery.of(context).size.height * 0.15,
                    //       width: double.infinity,
                    //       decoration: BoxDecoration(boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.grey.withOpacity(0.2),
                    //             offset: const Offset(0, 1))
                    //       ], color: ColorConstant.white),
                    //       child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             margin: const EdgeInsets.symmetric(
                    //                 horizontal: 10, vertical: 10),
                    //             height:
                    //                 MediaQuery.of(context).size.height * 0.08,
                    //             width: MediaQuery.of(context).size.width * 0.18,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 image: DecorationImage(
                    //                     image: NetworkImage(""),
                    //                     fit: BoxFit.cover)),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.symmetric(vertical: 13),
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   "Grand Hyatt Dubai",
                    //                   style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding:
                    //                       EdgeInsets.symmetric(vertical: 7),
                    //                   child: Text(
                    //                     "Dubai-United Arab Emirates",
                    //                     style: TextStyle(
                    //                         color: ColorConstant.lightBlue2,
                    //                         fontSize: 12),
                    //                   ),
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceBetween,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Container(
                    //                       //color: Colors.amber,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.43,
                    //                       child: Text(
                    //                         "20-Nov-2023",
                    //                         style: TextStyle(
                    //                             color: ColorConstant.lightBlue,
                    //                             fontSize: 12,
                    //                             fontWeight: FontWeight.bold),
                    //                       ),
                    //                       // height: 39,
                    //                     ),
                    //                     SizedBox(
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.03,
                    //                     ),
                    //                   ],
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
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
