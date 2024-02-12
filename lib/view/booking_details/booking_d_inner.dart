import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/shimmer/all_bookings.dart';
import 'package:choose_n_fly/shimmer/booking_dtail.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_d_controller.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_inn_controller.dart';
import 'package:choose_n_fly/view/booking_details/guest_dtail_edit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class BookingInnerpage extends StatelessWidget {
  BookingInnerpage({
    super.key,
    required this.bookingId,
    required this.hotelName,
    required this.apiType,
    required this.agentName,
    required this.refCode,
    required this.bookingDate,
    required this.bookingCode,
    required this.deadlineDate,
    required this.paymentStatus,
    required this.totalMount,
    required this.selectedStatus,
  });
  final bookingId;
  final hotelName;
  final apiType;
  final agentName;
  final refCode;
  final bookingCode;
  final bookingDate;
  var deadlineDate;

  final totalMount;
  final paymentStatus;
  final selectedStatus;
  // final customerName;
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    print(agentName);
    print(refCode);
    print(bookingCode);
    print(bookingDate);
    print(deadlineDate);

    print(totalMount);
    print(paymentStatus);
    //for testing

    if (deadlineDate == null) {
      deadlineDate = "03/02/2024";
    }

    return WillPopScope(
      onWillPop: () async {
        Get.delete<BookingInnController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var bookInnController =
              Get.put(BookingInnController(bookingId: bookingId));

          return Scaffold(
            backgroundColor: ColorConstant.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              // toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<BookingInnController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              title: Text(
                'Booking Details',
                style: TextStyle(
                    color: ColorConstant.black,
                    fontSize: MediaQuery.of(context).size.height * 0.023),
              ),
            ),
            body: Obx(
              () => bookInnController.isLoading.value == true
                  ? const Center(
                      child: BookingDetailShimmer(),
                    )
                  : bookInnController.exceptionCatched.value == true
                      ? const Center(
                          child: Text(
                            "SERVER  ERROR",
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorConstant.red,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : bookInnController.nodataFound.value == true
                          ? const Center(
                              child: Text("No details found"),
                            )
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF98C3EC),
                                              Color(0xFF7788E0),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Text(
                                          hotelName == ""
                                              ? bookInnController
                                                      .hoteldetailModel!
                                                      .hotelName ??
                                                  bookInnController
                                                      .hoteldetailModel!
                                                      .hotelBookingDtoList[0]
                                                      .hotelname ??
                                                  "DEMO HOTEL"
                                              : hotelName,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: ColorConstant.white),
                                        ),
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(255, 199, 239, 250),
                                          Color.fromARGB(255, 218, 237, 241)
                                        ]),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: ColorConstant
                                                              .white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            agentName == ""
                                                                ? name
                                                                : agentName,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13.5),
                                                          ),
                                                          const Text(
                                                            "Agent Name",
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: ColorConstant
                                                                    .lightBlue2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons
                                                              .book_online_outlined,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            bookingCode,
                                                            //"CNF_BOOK454332233",
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13.5),
                                                          ),
                                                          const Text(
                                                            "Booking Code",
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: ColorConstant
                                                                    .lightBlue2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .lightBlue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  bookingDate ==
                                                                          ""
                                                                      ? bookInnController
                                                                              .hoteldetailModel!
                                                                              .bookingDate ??
                                                                          "10-11-2023"
                                                                      : bookingDate,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          13.5),
                                                                ),
                                                                const Text(
                                                                  "Booking Date",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: ColorConstant
                                                                          .lightBlue2),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .lightBlue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons
                                                                    .confirmation_num_outlined,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  bookInnController
                                                                              .hoteldetailModel!
                                                                              .bookingStatus ==
                                                                          false
                                                                      ? "Not Confirmed"
                                                                      : "Confirmed"
                                                                  // deadlineDate ??
                                                                  //     "",
                                                                  ,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: bookInnController.hoteldetailModel!.bookingStatus ==
                                                                              false
                                                                          ? ColorConstant
                                                                              .red
                                                                          : Colors
                                                                              .green),
                                                                ),
                                                                const Text(
                                                                  "Booking Status",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      color: ColorConstant
                                                                          .lightBlue2),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Container(
                                      //  height: MediaQuery.of(context).size.height * 0.2,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 234, 236, 236),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              //height: 50,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 17),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color:
                                                                  ColorConstant
                                                                      .lightBlue,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              "  Check-In",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .lightBlue,
                                                                  fontSize: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.017),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          bookInnController
                                                                  .hoteldetailModel!
                                                                  .hotelBookingDtoList[
                                                                      0]
                                                                  .checkInText ??
                                                              "",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.016),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: ColorConstant
                                                                    .lightBlue,
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                "  Check-Out",
                                                                style: TextStyle(
                                                                    color: ColorConstant
                                                                        .lightBlue,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.017),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            bookInnController
                                                                    .hoteldetailModel!
                                                                    .hotelBookingDtoList[
                                                                        0]
                                                                    .checkOutText ??
                                                                "",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.016),
                                                          ),
                                                        ]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Divider(
                                              color: ColorConstant.grey,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Accommodation Details   ",
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .lightBlue,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.017),
                                                      ),
                                                      const Icon(
                                                        Icons.info_outline,
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        size: 15,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                              child: Text(
                                                // "",
                                                bookInnController
                                                        .hoteldetailModel!
                                                        .hotelBookingDtoList[0]
                                                        .hotelRoomBookingDtoList[
                                                            0]
                                                        .roomCategoryName ??
                                                    "",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17,
                                                      vertical: 8),
                                              child: Text(
                                                bookInnController
                                                        .hoteldetailModel!
                                                        .hotelBookingDtoList[0]
                                                        .hotelRoomBookingDtoList[
                                                            0]
                                                        .roomtypeName ??
                                                    "",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.015),
                                              ),
                                            ),
                                            //===========

                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 17),
                                              child: GestureDetector(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfRooms ?? "0"} Room - ${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfAdult ?? "0"} Adult, ${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfChild ?? "0"} Children",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Plus Jakarta Sans",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.016,
                                                          color: ColorConstant
                                                              .black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    const Text(
                                      "Payment Summary",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstant.lightBlue,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.006,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Total",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            totalMount == ""
                                                ? bookInnController
                                                        .hoteldetailModel!
                                                        .hotelBookingDtoList[0]
                                                        .totalCost
                                                        .toString() ??
                                                    ""
                                                : totalMount ?? "",
                                            style: const TextStyle(
                                                color:
                                                    ColorConstant.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    const Text(
                                      "Customer Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstant.lightBlue,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: ColorConstant.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Name                         : ",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: ColorConstant
                                                          .lightBlue2),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    bookInnController
                                                            .hoteldetailModel!
                                                            .firstName ??
                                                        "demo name",
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "Contact No         : ",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: ColorConstant
                                                            .lightBlue2),
                                                  ),
                                                  Text(
                                                    bookInnController
                                                                    .hoteldetailModel!
                                                                    .telephone ==
                                                                null ||
                                                            bookInnController
                                                                    .hoteldetailModel!
                                                                    .telephone ==
                                                                ""
                                                        ? ""
                                                        : bookInnController
                                                            .hoteldetailModel!
                                                            .telephone,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "E-mail                       : ",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: ColorConstant
                                                          .lightBlue2),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    bookInnController
                                                                    .hoteldetailModel!
                                                                    .mailId ==
                                                                null ||
                                                            bookInnController
                                                                    .hoteldetailModel!
                                                                    .mailId ==
                                                                ""
                                                        ? "demo@gmail.com"
                                                        : bookInnController
                                                            .hoteldetailModel!
                                                            .mailId,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    selectedStatus == "1" &&
                                            bookInnController
                                                    .isCancelled.value ==
                                                false
                                        // ? DateFormat("dd/MM/yyyy")
                                        //         .parse(deadlineDate)
                                        //         .isAfter(DateTime(
                                        //             DateTime.now().year,
                                        //             DateTime.now().month,
                                        //             DateTime.now().day))
                                        ? Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13)),
                                            child: ElevatedButton(
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            ColorConstant
                                                                .white)),
                                                onPressed: () {
                                                  cancelDialogue(
                                                      context,
                                                      bookInnController
                                                          .hoteldetailModel!
                                                          .hotelBookingDtoList[
                                                              0]
                                                          .hotelId
                                                          .toString(),
                                                      bookInnController);
                                                },
                                                child: const Text(
                                                    "Cancel Booking",
                                                    style: TextStyle(
                                                        color: ColorConstant
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          )
                                        : bookInnController.isCancelled.value ==
                                                true
                                            ? const Center(
                                                child: Text(
                                                "Cancelled",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 185, 45, 34)),
                                              ))
                                            : const SizedBox()
                                    //: SizedBox()
                                  ],
                                ),
                              ),
                            ),
            ),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  cancelDialogue(BuildContext context, String hotelId,
      BookingInnController bookInnController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title:
                const Text('Cancel Booking?', style: TextStyle(fontSize: 16)),
            content: const Text(
              'Are you sure want to cancel this booking?',
              style: TextStyle(fontSize: 13),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.all(Radius.circular(10)))
                      //     ),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.primaryColor)),
                  onPressed: () async {
                    Navigator.pop(context);
                    if (apiType == 0 && hotelId == "291") {
                      var bookingDController = Get.find<BookingDController>();

                      await bookingDController.cancelBooking(
                          bookingId, apiType);
                      bookInnController.isCancelled.value = true;

                      //Get.back();
                    } else {
                      Fluttertoast.showToast(
                          msg: "only test hotels can be canceled");
                    }
                    //else if (apiType == 10) {
                    //   bookingDController.cancelBookingJum(bookingId);
                    // }
                    // else if (apiType == 11) {
                    //   bookingDController.cancelBookingAth(bookingId);
                    // } else {
                    //   bookingDController.cancelBookingIWTX(bookingId);
                    // }
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: ColorConstant.white),
                  ))
            ],
          ),
        );
      },
    );
  }
}
