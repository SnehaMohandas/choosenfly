import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/shimmer/req_con_voucher.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/booking_vocher.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_voucher_controller.dart';
import 'package:choose_n_fly/view/booking_details/controller/req_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReqConfirmScreen extends StatelessWidget {
  ReqConfirmScreen(
      {super.key,
      required this.bookingId,
      required this.bookingstatus,
      required this.hotelbookingidPriceRef,
      required this.apiType,
      required this.hotelNmae,
      required this.hotelbookingId});
  final bookingId;
  final hotelbookingId;

  final bookingstatus;
  final hotelbookingidPriceRef;
  final apiType;
  final hotelNmae;
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<ReqConfirmController>();
        Get.delete<BookingVoucherController>();

        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var reqController = Get.put(ReqConfirmController(
              bookingId: bookingId, bookingStatus: bookingstatus));
          var bookingVcontroller = Get.put(BookingVoucherController());

          return Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorConstant.lightBlue,
              onPressed: () async {
                if (reqController.selectedValue.value == "Request") {
                  await bookingVcontroller.fetchRequestPdf(
                      hotelbookingId, bookingId);
                } else if (reqController.selectedValue.value ==
                    "Confirmation") {
                  await bookingVcontroller.fetchConfirmPdf(
                      hotelbookingId, bookingId);
                } else {
                  await bookingVcontroller.fetchVoucherPdf(
                      hotelbookingId, bookingId);
                }

                Get.to(
                    () => BookingVoucher(
                          // hotelBookingId: reqController.selectedValue.value ==
                          //         "Request"
                          //     ? reqController.requestModel![0]
                          //         .hotelBookingDtoList[0].hotelbookingId
                          //     : reqController.selectedValue.value == "Voucher"
                          //         ? reqController.voucherModel![0]
                          //             .hotelBookingDtoList[0].hotelbookingId
                          //         : reqController.confirmModel!.bookingDetails
                          //             .hotelBookingDtoList[0].hotelbookingId,
                          // bookingId: bookingId,
                          hotelName: hotelNmae,
                          hotelbookingId: hotelbookingId,
                          bookingId: bookingId,
                        ),
                    transition: Transition.rightToLeftWithFade);
              },
              child: const Icon(
                Icons.send,
                color: ColorConstant.white,
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<ReqConfirmController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: Text(
                'Request Confirmation Voucher',
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRadioButton(
                          'Request', reqController, bookingId, bookingstatus),
                      _buildRadioButton('Confirmation', reqController,
                          bookingId, bookingstatus),
                      _buildRadioButton(
                          'Voucher', reqController, bookingId, bookingstatus)
                    ],
                  ),
                ),
                Obx(
                  () => reqController.isLoading.value == true
                      ? Expanded(
                          child: ReqVoucherShimmer(),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 23, vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                //height: MediaQuery.of(context).size.height * 0.53,
                                decoration: BoxDecoration(
                                  color: ColorConstant.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    (BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(0, 1),
                                        blurRadius: 10,
                                        spreadRadius: 2))
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: ColorConstant.grey,
                                          gradient: LinearGradient(colors: [
                                            Color.fromARGB(255, 202, 222, 238),
                                            Color.fromARGB(255, 248, 239, 253)
                                          ]),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Icon(
                                          //   FontAwesomeIcons.hotel,
                                          //   color: Color.fromARGB(255, 161, 188, 212),
                                          // ),
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          Expanded(
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  reqController
                                                          .voucherModel![0]
                                                          .hotelBookingDtoList[
                                                              0]
                                                          .hotelname ??
                                                      hotelNmae ??
                                                      "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorConstant
                                                          .lightBlue,
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: Obx(
                                        () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            reqController.selectedValue.value ==
                                                    "Request"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .book_online_outlined,
                                                            size: 16,
                                                            color: ColorConstant
                                                                .primaryColor,
                                                          ),
                                                          Text(
                                                            "   Booking Code ",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.006,
                                                      ),
                                                      Text(reqController
                                                              .requestModel![0]
                                                              .hotelBookingDtoList[
                                                                  0]
                                                              .bookingCode ??
                                                          ""),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.006,
                                                      ),
                                                      const Divider(),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_outlined,
                                                  size: 16,
                                                  color: ColorConstant
                                                      .primaryColor,
                                                ),
                                                Text(
                                                  "   Confirmation Reference",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.006,
                                            ),
                                            reqController.selectedValue.value ==
                                                    "Voucher"
                                                ? Text(reqController
                                                        .voucherModel![0]
                                                        .hotelBookingDtoList[0]
                                                        .clientrefernce ??
                                                    reqController
                                                        .confirmModel!
                                                        .bookingDetails
                                                        .hotelBookingDtoList[0]
                                                        .clientrefernce ??
                                                    "")
                                                // : reqController.selectedValue
                                                //             .value ==
                                                //         "Confirmation"
                                                // ? Text(reqController
                                                //         .confirmationModelClass![
                                                //             0]
                                                //         .bookingConfirmationCode ??
                                                //     "")
                                                : reqController.selectedValue
                                                            .value ==
                                                        "Request"
                                                    ? Text(reqController
                                                            .requestModel![0]
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .clientrefernce ??
                                                        "")
                                                    : Text(reqController
                                                            .confirmModel!
                                                            .bookingDetails
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .clientrefernce ??
                                                        ""),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.006,
                                            ),
                                            const Divider(),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            reqController.selectedValue.value ==
                                                    "Request"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .monetization_on_outlined,
                                                              size: 16,
                                                              color: ColorConstant
                                                                  .primaryColor),
                                                          Text(
                                                            "   Price Reference",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.006,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            // reqController
                                                            //         .requestModel![
                                                            //             0]
                                                            //         .hotelBookingDtoList[
                                                            //             0]
                                                            //         .pricerefernce ??
                                                            //     "",

                                                            reqController
                                                                    .requestModel![
                                                                        0]
                                                                    .hotelBookingDtoList[
                                                                        0]
                                                                    .pricerefernce ??
                                                                "",
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        76,
                                                                        175,
                                                                        167),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                showAddPriceRefDialogue(
                                                                    context,
                                                                    reqController,
                                                                    hotelbookingidPriceRef,
                                                                    apiType,
                                                                    reqController
                                                                            .requestModel![0]
                                                                            .hotelBookingDtoList[0]
                                                                            .pricerefernce ??
                                                                        "");
                                                              },
                                                              child: const Icon(
                                                                  Icons.add))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.006,
                                                      ),
                                                      const Divider(),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                    ],
                                                  )
                                                : reqController.selectedValue
                                                            .value ==
                                                        "Confirmation"
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .supervisor_account_outlined,
                                                                  size: 16,
                                                                  color: ColorConstant
                                                                      .primaryColor),
                                                              Text(
                                                                "   Supplier Reference",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                reqController
                                                                        .confirmModel!
                                                                        .bookingDetails
                                                                        .hotelBookingDtoList[
                                                                            0]
                                                                        .pricerefernce ??
                                                                    "",
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          76,
                                                                          175,
                                                                          167),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    showAddSupplierRefDialogue(
                                                                        context,
                                                                        reqController,
                                                                        hotelbookingidPriceRef,
                                                                        apiType,
                                                                        reqController.confirmModel!.bookingDetails.hotelBookingDtoList[0].pricerefernce ??
                                                                            "");
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .add))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006,
                                                          ),
                                                          const Divider(),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                          ),
                                                        ],
                                                      )
                                                    : Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .supervisor_account_outlined,
                                                                  size: 16,
                                                                  color: ColorConstant
                                                                      .primaryColor),
                                                              Text(
                                                                "   Supplier Reference",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006,
                                                          ),
                                                          Text(
                                                            reqController
                                                                    .confirmModel!
                                                                    .bookingDetails
                                                                    .hotelBookingDtoList[
                                                                        0]
                                                                    .pricerefernce ??
                                                                "",
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006,
                                                          ),
                                                          const Divider(),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                          ),
                                                        ],
                                                      ),
                                            const Row(
                                              children: [
                                                Icon(
                                                    FontAwesomeIcons
                                                        .calendarCheck,
                                                    size: 16,
                                                    color: ColorConstant
                                                        .primaryColor),
                                                Text(
                                                  "   Check-In",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.006,
                                            ),
                                            reqController.selectedValue.value ==
                                                    "Voucher"
                                                ? Text(reqController
                                                        .voucherModel![0]
                                                        .hotelBookingDtoList[0]
                                                        .checkInText ??
                                                    reqController
                                                        .confirmModel!
                                                        .bookingDetails
                                                        .hotelBookingDtoList[0]
                                                        .checkInText ??
                                                    "")
                                                : reqController.selectedValue
                                                            .value ==
                                                        "Request"
                                                    ? Text(reqController
                                                            .requestModel![0]
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .checkInText ??
                                                        "")
                                                    : Text(reqController
                                                            .confirmModel!
                                                            .bookingDetails
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .checkInText ??
                                                        ""),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.006,
                                            ),
                                            const Divider(),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            const Row(
                                              children: [
                                                Icon(
                                                    FontAwesomeIcons
                                                        .calendarXmark,
                                                    size: 16,
                                                    color: ColorConstant
                                                        .primaryColor),
                                                Text(
                                                  "   Check-Out",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.006,
                                            ),
                                            reqController.selectedValue.value ==
                                                    "Voucher"
                                                ? Text(reqController
                                                        .voucherModel![0]
                                                        .hotelBookingDtoList[0]
                                                        .checkOutText ??
                                                    reqController
                                                        .confirmModel!
                                                        .bookingDetails
                                                        .hotelBookingDtoList[0]
                                                        .checkOutText ??
                                                    "")
                                                : reqController.selectedValue
                                                            .value ==
                                                        "Request"
                                                    ? Text(reqController
                                                            .requestModel![0]
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .checkOutText ??
                                                        "")
                                                    : Text(reqController
                                                            .confirmModel!
                                                            .bookingDetails
                                                            .hotelBookingDtoList[
                                                                0]
                                                            .checkOutText ??
                                                        ""),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            reqController.selectedValue.value ==
                                                    "Confirmation"
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Confirmation Status",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Container(
                                                          height:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    76,
                                                                    175,
                                                                    167)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: reqController
                                                                      .confirmModel!
                                                                      .confirmationStatus ==
                                                                  0
                                                              ? const Center(
                                                                  child: Text(
                                                                    "Confirmed",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            76,
                                                                            175,
                                                                            167)),
                                                                  ),
                                                                )
                                                              : const Center(
                                                                  child: Text(
                                                                    "Not Confirmed",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            163,
                                                                            66,
                                                                            66)),
                                                                  ),
                                                                ))
                                                    ],
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  Widget _buildRadioButton(String value, ReqConfirmController reqController,
      bookingId, bookingStatus) {
    return Obx(
      () => Container(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: reqController.selectedValue.value,
              onChanged: (selected) {
                reqController.setSelectedValue(value);
                if (reqController.selectedValue.value == "Voucher") {
                  //  reqController.fetchVoucherDetails();
                } else if (reqController.selectedValue.value ==
                    "Confirmation") {
                  //   reqController.fetchConfirmDetails();
                } else {
                  //  reqController.fetchRequestDetails();
                }
              },
            ),
            Text(value,
                style:
                    const TextStyle(color: ColorConstant.black, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedValue(ReqConfirmController reqController) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Selected Value: ${reqController.selectedValue}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  showAddPriceRefDialogue(
      BuildContext context,
      ReqConfirmController reqController,
      dynamic hotelbookingidPriceRef,
      int apiType,
      dynamic priceRef) {
    final TextEditingController priceController = TextEditingController();
    priceController.text = priceRef;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Form(
            key: formKey,
            child: AlertDialog(
              scrollable: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Text('Add Price Reference',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              content: TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)))),
                validator: (value) {
                  if (value == "" || value == null) {
                    return "please enter price reference";
                  }
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          backgroundColor: MaterialStatePropertyAll(
                              ColorConstant.primaryColor)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pop();

                          await reqController.priceRefChange(
                              hotelbookingidPriceRef,
                              priceController.text,
                              apiType);
                          //Navigator.of(context).pop();
                        }
                      },
                      child: Obx(
                        () => reqController.isAdding.value == true
                            ? const Text(
                                "  Adding...  ",
                                style: TextStyle(color: ColorConstant.white),
                              )
                            : const Text(
                                "  Add  ",
                                style: TextStyle(color: ColorConstant.white),
                              ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showAddSupplierRefDialogue(
      BuildContext context,
      ReqConfirmController reqController,
      dynamic hotelbookingidSupRef,
      int apiType,
      dynamic supplierRef) {
    final TextEditingController supplierController = TextEditingController();
    supplierController.text = supplierRef;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Form(
            key: formKey,
            child: AlertDialog(
              scrollable: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Text('Add Supplier Reference',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              content: TextFormField(
                controller: supplierController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)))),
                validator: (value) {
                  if (value == "" || value == null) {
                    return "please enter supplier reference";
                  }
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          backgroundColor: MaterialStatePropertyAll(
                              ColorConstant.primaryColor)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pop();

                          await reqController.priceRefChange(
                              hotelbookingidPriceRef,
                              supplierController.text,
                              apiType);
                        }
                      },
                      child: Obx(
                        () => reqController.isAdding.value == true
                            ? const Text(
                                "  Adding...  ",
                                style: TextStyle(color: ColorConstant.white),
                              )
                            : const Text(
                                "  Add  ",
                                style: TextStyle(color: ColorConstant.white),
                              ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
