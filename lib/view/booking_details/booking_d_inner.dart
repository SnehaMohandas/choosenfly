import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_inn_controller.dart';
import 'package:choose_n_fly/view/booking_details/guest_dtail_edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BookingInnerpage extends StatelessWidget {
  BookingInnerpage({
    super.key,
    required this.bookingId,
    required this.hotelName,
    required this.agentName,
    required this.refCode,
    required this.bookingDate,
    required this.bookingCode,
    required this.checKin,
    required this.checkOut,
    required this.deadlineDate,
    required this.paymentStatus,
    required this.totalMount,
  });
  final bookingId;
  final hotelName;
  final agentName;
  final refCode;
  final bookingCode;
  final bookingDate;
  final deadlineDate;
  final checKin;
  final checkOut;
  final totalMount;
  final paymentStatus;
  // final customerName;
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
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
                  ? Center(
                      child: loader(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   height: 5,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.only(
                            //         topLeft: Radius.circular(10),
                            //         topRight: Radius.circular(10)),
                            //     color: Colors.yellow,
                            //   ),
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(10),
                                //     topRight: Radius.circular(10)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF98C3EC),
                                      Color(0xFF7788E0),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      spreadRadius: 1)
                                ],
                              ),
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Text(
                                  hotelName,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConstant.white),
                                ),
                              )),
                              // child: Row(
                              //   children: [
                              // Container(
                              //   height: 65, width: 68,

                              //   // height: MediaQuery.of(context).size.height * 0.08,
                              //   margin: const EdgeInsets.only(
                              //       top: 12,
                              //       bottom: 12,
                              //       left: 13,
                              //       right: 10),
                              //   //width: MediaQuery.of(context).size.width * 0.2,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8),
                              //     // color: ColorConstant.white,
                              //   ),
                              //   child: CachedNetworkImage(
                              //     //  width: MediaQuery.of(context).size.width * 0.2,
                              //     imageBuilder: (context, imageProvider) {
                              //       return Container(
                              //         // height: 108,
                              //         // width: MediaQuery.of(context).size.width * 0.2,
                              //         decoration: BoxDecoration(
                              //           borderRadius:
                              //               BorderRadius.circular(8),
                              //           image: DecorationImage(
                              //               image: imageProvider,
                              //               fit: BoxFit.cover),
                              //         ),
                              //       );
                              //     },
                              //     placeholder: (context, url) => Center(
                              //       child: Lottie.asset(
                              //           "assets/animation/Animation - 1700807305736.json"),
                              //     ),
                              //     imageUrl:
                              //         "https://23c133e0c1637be1e07d-be55c16c6d91e6ac40d594f7e280b390.ssl.cf1.rackcdn.com/u/gpch/Park-Hotel-Group---Explore---Grand-Park-City-Hall-Facade.jpg",
                              //     fit: BoxFit.cover,
                              //     errorWidget: (context, url, error) =>
                              //         Center(
                              //             child: Icon(
                              //       Icons.error,
                              //       color: ColorConstant.white,
                              //     )),
                              //   ),
                              // ),
                              //     const Expanded(
                              //         child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Text(
                              //           "Jumerah creekside Hotel",
                              //           style: TextStyle(
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.bold,
                              //               color: ColorConstant.white),
                              //         ),
                              //         SizedBox(
                              //           height: 5,
                              //         ),
                              //         Text(
                              //           "Dubai-United Arab Emirates",
                              //           style: TextStyle(
                              //               fontSize: 13,
                              //               // fontWeight: FontWeight.bold,
                              //               color: ColorConstant.white),
                              //         ),
                              //       ],
                              //     ))
                              //   ],
                              // ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 199, 239, 250),
                                  Color.fromARGB(255, 218, 237, 241)
                                ]),

                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      offset: Offset(0, 1),
                                      blurRadius: 10,
                                      spreadRadius: 2)
                                ],
                                // color: Color.fromARGB(255, 167, 162, 231)
                                //color: Color.fromARGB(255, 212, 233, 239),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorConstant.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.person,
                                                  color: ColorConstant.white,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    agentName,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13.5),
                                                  ),
                                                  Text(
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorConstant.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons
                                                      .arrow_circle_up_outlined,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    refCode,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13.5),
                                                  ),
                                                  Text(
                                                    "Reference Code",
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: ColorConstant.lightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.book_online_outlined,
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bookingCode,
                                                    //"CNF_BOOK454332233",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13.5),
                                                  ),
                                                  Text(
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
                                                    BorderRadius.circular(10)),
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
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Icon(
                                                        Icons.calendar_month,
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
                                                          bookingDate,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 13.5),
                                                        ),
                                                        Text(
                                                          "Booking Date",
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
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Icon(
                                                        Icons.calendar_month,
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
                                                          deadlineDate ?? "",
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 13.5),
                                                        ),
                                                        Text(
                                                          "Deadline Date",
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
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              //  height: MediaQuery.of(context).size.height * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 234, 236, 236),

                                //  color: Color.fromARGB(255, 231, 230, 230),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: Offset(0, 1),
                                      blurRadius: 10,
                                      spreadRadius: 2)
                                ],
                                // color: Color.fromARGB(255, 238, 238, 239),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      //height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 17),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      color: ColorConstant
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
                                                  checKin ?? "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.016),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   width: 80,
                                            // ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        "  Check-Out",
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
                                                    checkOut ?? "",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Accommodation Details   ",
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.lightBlue,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.017),
                                              ),
                                              const Icon(
                                                Icons.info_outline,
                                                color: ColorConstant.lightBlue,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Text(
                                        bookInnController
                                                .hoteldetailModel!
                                                .hotelBookingDtoList[0]
                                                .hotelRoomBookingDtoList[0]
                                                .roomCategoryName ??
                                            "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17, vertical: 8),
                                      child: Text(
                                        bookInnController
                                                .hoteldetailModel!
                                                .hotelBookingDtoList[0]
                                                .hotelRoomBookingDtoList[0]
                                                .roomtypeName ??
                                            "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015),
                                      ),
                                    ),
                                    //===========
                                    //expansion tile
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: GestureDetector(
                                        // onTap: () {
                                        //   bookInnController.isTapped.value =
                                        //       !bookInnController.isTapped.value;
                                        // },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfRooms ?? "0"} Room - ${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfAdult ?? "0"} Adult, ${bookInnController.hoteldetailModel!.hotelBookingDtoList[0].hotelRoomBookingDtoList[0].noOfChild ?? "0"} Children",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "Plus Jakarta Sans",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.016,
                                                  color: ColorConstant.black),
                                            ),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     bookInnController
                                            //             .isTapped.value =
                                            //         !bookInnController
                                            //             .isTapped.value;
                                            //   },
                                            //   child: const Icon(
                                            //     Icons.keyboard_arrow_down,
                                            //     size: 30,
                                            //     color: ColorConstant.lightBlue,
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                    //=============
                                    // Obx(() =>
                                    //     bookInnController.isTapped.value == true
                                    //         ? ListView.builder(
                                    //             shrinkWrap: true,
                                    //             physics:
                                    //                 const NeverScrollableScrollPhysics(),
                                    //             itemCount: 4,
                                    //             itemBuilder: (context, index) {
                                    //               return Column(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   const Divider(),
                                    //                   Padding(
                                    //                     padding:
                                    //                         const EdgeInsets
                                    //                             .symmetric(
                                    //                             horizontal: 17),
                                    //                     child: Column(
                                    //                       crossAxisAlignment:
                                    //                           CrossAxisAlignment
                                    //                               .start,
                                    //                       children: [
                                    //                         Text(
                                    //                           "Room ${index + 1}",
                                    //                           style: TextStyle(
                                    //                               fontFamily:
                                    //                                   "Plus Jakarta Sans",
                                    //                               color: ColorConstant
                                    //                                   .lightBlue,
                                    //                               fontSize: MediaQuery.of(
                                    //                                           context)
                                    //                                       .size
                                    //                                       .height *
                                    //                                   0.017),
                                    //                         ),
                                    //                         SizedBox(
                                    //                           height: MediaQuery.of(
                                    //                                       context)
                                    //                                   .size
                                    //                                   .height *
                                    //                               0.005,
                                    //                         ),
                                    //                         Text(
                                    //                           "1 Adult, 0 Children",
                                    //                           style: TextStyle(
                                    //                               fontFamily:
                                    //                                   "Plus Jakarta Sans",
                                    //                               fontSize: MediaQuery.of(
                                    //                                           context)
                                    //                                       .size
                                    //                                       .height *
                                    //                                   0.016),
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //                   )
                                    //                 ],
                                    //               );
                                    //             },
                                    //           )
                                    //         : const SizedBox())
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Text(
                              "Payment Summary",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.lightBlue,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Status",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  paymentStatus,
                                  style: TextStyle(
                                      color: paymentStatus == "PAID"
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height * 0.006,
                            // ),
                            // const Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text("GST(10 %)",
                            //         style: TextStyle(fontSize: 10)),
                            //     Text("10 AED",
                            //         style: TextStyle(
                            //             color: ColorConstant.black,
                            //             fontSize: 11))
                            //   ],
                            // ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.006,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(totalMount,
                                    style: TextStyle(
                                        color: ColorConstant.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Text(
                              "Customer Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.lightBlue,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: ColorConstant.grey)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name                         : ",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: ColorConstant.lightBlue2),
                                        ),
                                        Expanded(
                                          child: Text(
                                            bookInnController.hoteldetailModel!
                                                    .firstName ??
                                                "demo name",
                                            maxLines: 2,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Contact No         : ",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            bookInnController.hoteldetailModel!
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
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "E-mail                       : ",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: ColorConstant.lightBlue2),
                                        ),
                                        Text(
                                          bookInnController.hoteldetailModel!
                                                          .mailId ==
                                                      null ||
                                                  bookInnController
                                                          .hoteldetailModel!
                                                          .mailId ==
                                                      ""
                                              ? "demo@gmail.com"
                                              : bookInnController
                                                  .hoteldetailModel!.mailId,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Passport No       : ",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    ColorConstant.lightBlue2),
                                          ),
                                          Text(
                                            bookInnController.hoteldetailModel!
                                                    .passportNo ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13)),
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorConstant.white)),
                                  onPressed: () {
                                    cancelDialogue(context);
                                  },
                                  child: const Text("Cancel Booking",
                                      style: TextStyle(
                                          color: ColorConstant.primaryColor,
                                          fontWeight: FontWeight.bold))),
                            )
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

  cancelDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
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
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.primaryColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
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
