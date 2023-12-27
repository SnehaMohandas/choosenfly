import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/booking_d_inner.dart';
import 'package:choose_n_fly/view/calender/controller/calender_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
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
                Obx(
                  () {
                    final events = calenderController.events;
                    final selectedDate = calenderController.selectedDate.value;

                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TableCalendar(
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
                        focusedDay: calenderController.selectedDate.value,
                        selectedDayPredicate: (date) =>
                            isSameDay(date, selectedDate),
                        eventLoader: (date) {
                          // Load events for the given date
                          List<EventModel> dayEvents =
                              _getEventsForDay(date, events);

                          // Check if there are more than 1 event for the day
                          return dayEvents.length > 1
                              ? [dayEvents[0]]
                              : dayEvents;
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
                                  style: const TextStyle(
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
                                    color: const Color.fromARGB(43, 75, 75,
                                        73), // Set border color for selected day
                                    width: 2.0, // Set border width
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  focusedDay.day.toString(),
                                  style: const TextStyle(
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
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Bookings for the day",
                        style: TextStyle(
                            color: ColorConstant.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )),
                Obx(() {
                  for (int i = 0; i < calenderController.events.length; i++) {
                    bookingList
                        .addAll([calenderController.events[i].eventName]);
                  }
                  final selectedDate = calenderController.selectedDate.value;
                  final events = calenderController.events
                      .where((event) => isSameDay(event.date, selectedDate))
                      .toList();

                  if (events.isEmpty)
                    return const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "There is no bookings for the day",
                              style: TextStyle(
                                color: ColorConstant.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  return Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => BookingInnerpage(
                                        bookingId: "76",
                                        bookingCode: "CNF_BOOK455444",
                                        agentName: "Ali Homoud",
                                        bookingDate: "10/11/2023",
                                        checKin: "Nov-20-2023",
                                        checkOut: "Nov-23-2023",
                                        // customerName: "Zhang Liou",
                                        deadlineDate: "20/11/2023",
                                        hotelName: "Jumerah Creekside Hotel",
                                        paymentStatus: "PAID",
                                        refCode: "455554445555543322222",
                                        totalMount: "159 AED",
                                      ),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              //height: MediaQuery.of(context).size.height * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: const Offset(0, 1),
                                        spreadRadius: 2,
                                        blurRadius: 10),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.white),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   margin: const EdgeInsets.symmetric(
                                  //       horizontal: 10, vertical: 10),
                                  //   height:
                                  //       MediaQuery.of(context).size.height * 0.08,
                                  //   width: MediaQuery.of(context).size.width * 0.18,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       image: const DecorationImage(
                                  //           image: NetworkImage(
                                  //               "https://cf.bstatic.com/xdata/images/hotel/max1024x768/232963819.jpg?k=444eace50a71e6717882b22b905ff5cd9d83f0ec76061f10c85fd2f9218e83fc&o=&hp=1"),
                                  //           fit: BoxFit.cover)),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CachedNetworkImage(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                      imageUrl:
                                          "https://cf.bstatic.com/xdata/images/hotel/max1024x768/232963819.jpg?k=444eace50a71e6717882b22b905ff5cd9d83f0ec76061f10c85fd2f9218e83fc&o=&hp=1",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.531),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                        child: Lottie.asset(
                                            "assets/animation/Animation - 1700807305736.json",
                                            fit: BoxFit.cover),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "JW Mariott Marquis Hotel",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 7),
                                          child: Text(
                                            "Dubai-United Arab Emirates",
                                            style: TextStyle(
                                                color: ColorConstant.lightBlue2,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              //color: Colors.amber,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.43,
                                              child: Text(
                                                DateFormat('MMM-dd-yyyy')
                                                    .format(DateTime.parse(
                                                        events[index]
                                                            .date
                                                            .toString())),
                                                style: const TextStyle(
                                                    color:
                                                        ColorConstant.lightBlue,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // height: 39,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ));
                })
              ],
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }

  List<EventModel> _getEventsForDay(DateTime date, RxList<EventModel> events) {
    return events.where((event) => isSameDay(event.date, date)).toList();
  }
}
