import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/booking_details/booking_d_inner.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_d_controller.dart';
import 'package:choose_n_fly/view/booking_details/req_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math';

class BookingDetail extends StatelessWidget {
  BookingDetail({super.key});
  final NetworkController networkController = Get.find<NetworkController>();
  final TextEditingController searchController = TextEditingController();

  List images = [
    "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
    "https://www.ahstatic.com/photos/c096_ho_00_p_1024x768.jpg",
    "https://m.economictimes.com/thumb/msid-73023854,width-1200,height-900,resizemode-4,imgsize-235513/hotel-agencies.jpg",
    "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aG90ZWxzfGVufDB8fDB8fHww"
  ];

  // List images = [
  //   "assets/images/hotel1.jpg",
  //   "assets/images/hotel2.jpg",
  //   "assets/images/hotel3.jpg",
  //   "assets/images/hotel4.jpg"
  // ];
  List names = [
    "Jumerah Creekside Hotel",
    "Six Senses Zighy Bay",
    "Grand Hyatt Dubai",
    "JW Mariott Marquis Hotel"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<BookingDController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          final BookingDController bookingdController =
              Get.put(BookingDController());

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<BookingDController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: Text(
                'All Bookings',
                style: TextStyle(
                    color: ColorConstant.white,
                    fontSize: MediaQuery.of(context).size.height * 0.023),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)))),
            ),
            body:
                // Obx(
                //   () => bookingdController.isLoading.value == true
                //       ? Center(
                //           child: CircularProgressIndicator(),
                //         )
                //       :
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: DropdownButtonFormField(
                      value: bookingdController.selectedStatus.value == ""
                          ? null
                          : bookingdController.selectedStatus.value,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 6, bottom: 6, left: 14, right: 14),
                          hintStyle: TextingStyle.font14normalLb,
                          hintText: 'Select Status',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.grey),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorConstant.grey),
                              borderRadius: BorderRadius.circular(10))),
                      items: bookingdController.status.map((item) {
                        return DropdownMenuItem(
                            value: item[1],
                            child: Text(
                              item[0],
                              style: TextStyle(fontSize: 14),
                            ));
                      }).toList(),
                      onChanged: (v) async {
                        bookingdController.selectedStatus.value =
                            await v.toString();
                        await bookingdController
                            .fetchAllBOokings(searchController.text);

                        // print(bookingdController.selectedStatus.value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select type";
                        }
                        return null;
                      },
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     _buildRadioButton('Upcoming', context),
                  //     _buildRadioButton('Completed', context),
                  //     _buildRadioButton('Cancelled', context)
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showMonthPicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: bookingdController
                                                  .selectedStatus.value ==
                                              "1"
                                          ? DateTime.now()
                                          : DateTime.now()
                                              .subtract(Duration(days: 3650)),
                                      lastDate: bookingdController
                                                  .selectedStatus.value ==
                                              "2"
                                          ? DateTime.now()
                                          : bookingdController
                                                      .selectedStatus.value ==
                                                  "3"
                                              ? DateTime.now()
                                              : DateTime.now()
                                                  .add(Duration(days: 3650)))
                                  .then((date) async {
                                if (date != null) {
                                  var selctddate = date;

                                  bookingdController.timePeriod.value =
                                      await DateFormat('MMM/yyyy')
                                          .format(selctddate);
                                  await bookingdController
                                      .fetchAllBOokings(searchController.text);
                                  //  print(bookingdController.timePeriod.value);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: ColorConstant.grey)
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.2),
                                  //     blurRadius: 4,
                                  //     offset: const Offset(0, 1),
                                  //   ),
                                  // ],
                                  ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.primaryColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),
                                  ),
                                  //Spacer(),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Center(
                                      child: Obx(
                                    () => Text(
                                      " ${bookingdController.timePeriod.value}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                                controller: searchController,
                                onChanged: (value) async {
                                  print("valueeiishereeee==>${value}");
                                  print(
                                      "stattusss===>${bookingdController.selectedStatus.value}");
                                  print(
                                      "timeeeee==>${bookingdController.timePeriod.value}");
                                  await bookingdController
                                      .fetchAllBOokings(value);
                                },
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    suffixIcon: GestureDetector(
                                      onTap: () async {
                                        await bookingdController
                                            .fetchAllBOokings(
                                                searchController.text);
                                      },
                                      child: const Icon(
                                        Icons.search,
                                        size: 18,
                                      ),
                                    ),
                                    hintStyle: const TextStyle(fontSize: 13),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ColorConstant.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ColorConstant.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    contentPadding: const EdgeInsets.all(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => bookingdController.isLoading.value == true
                        ? Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  loader(),
                                ],
                              ),
                            ),
                          )
                        : bookingdController.noBooking.value == true
                            ? Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 40, bottom: 10),
                                        child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Lottie.asset(
                                              "assets/animation/no_search_results.json",
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Text(
                                        "No Bookings",
                                        style: TextStyle(
                                            color: ColorConstant.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : bookingdController.exceptionCatched.value == true
                                ? Center(
                                    child: Text(
                                      "SERVER  ERROR",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorConstant.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Expanded(
                                    child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: bookingdController
                                            .allBookingsModel!.data.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => BookingInnerpage(
                                                        bookingId:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .bookingId,
                                                        hotelName:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .hotelname,
                                                        agentName:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .agentName,
                                                        bookingCode:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .bookingCode,
                                                        checKin:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .checkIn,
                                                        bookingDate:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .bookingdate,
                                                        checkOut:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .checkOut,
                                                        paymentStatus:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .paymentStatus,
                                                        deadlineDate:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .deadlineTime,
                                                        refCode:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .clientrefernce,
                                                        totalMount:
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .totalprice,
                                                        selectedStatus:
                                                            bookingdController
                                                                .selectedStatus
                                                                .value,
                                                      ),
                                                  transition: Transition
                                                      .rightToLeftWithFade);
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 7),
                                              //height: MediaQuery.of(context).size.height * 0.15,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        offset:
                                                            const Offset(0, 1),
                                                        spreadRadius: 2,
                                                        blurRadius: 10)
                                                  ],
                                                  color: ColorConstant.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.all(10.0),
                                                  //   child: CachedNetworkImage(
                                                  //     height: MediaQuery.of(context)
                                                  //             .size
                                                  //             .height *
                                                  //         0.08,
                                                  //     width: MediaQuery.of(context)
                                                  //             .size
                                                  //             .width *
                                                  //         0.17,
                                                  //     imageUrl:
                                                  //         "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
                                                  //     imageBuilder: (context,
                                                  //             imageProvider) =>
                                                  //         Container(
                                                  //       height:
                                                  //           MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .height *
                                                  //               0.08,
                                                  //       width:
                                                  //           MediaQuery.of(context)
                                                  //                   .size
                                                  //                   .width *
                                                  //               0.17,
                                                  //       decoration: BoxDecoration(
                                                  //         borderRadius:
                                                  //             BorderRadius.circular(
                                                  //                 8.531),
                                                  //         image: DecorationImage(
                                                  //             image: imageProvider,
                                                  //             fit: BoxFit.cover),
                                                  //       ),
                                                  //     ),
                                                  //     placeholder: (context, url) =>
                                                  //         Center(
                                                  //       child: Lottie.asset(
                                                  //           "assets/animation/Animation - 1700807305736.json",
                                                  //           fit: BoxFit.cover),
                                                  //     ),
                                                  //     errorWidget:
                                                  //         (context, url, error) =>
                                                  //             Center(
                                                  //                 child: Icon(
                                                  //                     Icons.error)),
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 13,
                                                            horizontal: 13),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          //color: Colors.yellow,
                                                          height: 22,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                          //with img
                                                          // width: MediaQuery.of(
                                                          //             context)
                                                          //         .size
                                                          //         .width *
                                                          //     0.6,
                                                          //=============
                                                          child: Text(
                                                            bookingdController
                                                                .allBookingsModel!
                                                                .data[index]
                                                                .hotelname,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 7),
                                                          child: Text(
                                                            bookingdController
                                                                    .allBookingsModel!
                                                                    .data[index]
                                                                    .totalprice ??
                                                                "",
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .red,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                          height: 20,
                                                          //  color: Colors.red,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                // color: Colors
                                                                //     .amber,
                                                                //===========with img
                                                                // width: MediaQuery.of(
                                                                //             context)
                                                                //         .size
                                                                //         .width *
                                                                //  0.43,
                                                                //==============
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.34,
                                                                child: Text(
                                                                  bookingdController
                                                                      .allBookingsModel!
                                                                      .data[
                                                                          index]
                                                                      .bookingdate,
                                                                  style: TextStyle(
                                                                      color: ColorConstant
                                                                          .lightBlue,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                // height: 39,
                                                              ),
                                                              SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      //    with img
                                                                      // 0.03,
                                                                      0.01),
                                                              Visibility(
                                                                visible: bookingdController.selectedStatus.value ==
                                                                            "2" ||
                                                                        bookingdController.selectedStatus.value ==
                                                                            "3"
                                                                    ? false
                                                                    : true,
                                                                child:
                                                                    Container(
                                                                  // color: Colors
                                                                  //     .amber,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      //with img
                                                                      //   0.15,
                                                                      0.21,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          showDialogue(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              35,
                                                                          //with img
                                                                          // 30,
                                                                          // color:
                                                                          //     Colors.black,
                                                                          child:
                                                                              Icon(
                                                                            Icons.delete,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                Colors.red[800],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Get.to(
                                                                              () => ReqConfirmScreen(
                                                                                    bookingId: bookingdController.allBookingsModel!.data[index].bookingId,
                                                                                    hotelbookingId: bookingdController.allBookingsModel!.data[index].hotelbookingId,
                                                                                    bookingstatus: bookingdController.selectedStatus.value,
                                                                                    hotelbookingidPriceRef: bookingdController.allBookingsModel!.data[index].hotelbookingId,
                                                                                    apiType: bookingdController.allBookingsModel!.data[index].apitype,
                                                                                    hotelNmae: bookingdController.allBookingsModel!.data[index].hotelname,
                                                                                  ),
                                                                              transition: Transition.rightToLeftWithFade);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              //with img
                                                                              // 22,
                                                                              35,
                                                                          // color:
                                                                          //     Colors.blue,
                                                                          child:
                                                                              Icon(
                                                                            Icons.email,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                ColorConstant.signBlue,
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  // height: 39,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                  )
                ],
              ),
            ),
            //),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  showDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title:
                const Text('Cancel Booking?', style: TextStyle(fontSize: 17)),
            content: const Text('Are you sure want to cancel?',
                style: TextStyle(fontSize: 14)),
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0)))),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 219, 61, 61))),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Booking Cancelled");
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
