import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/booking/booking_page.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:choose_n_fly/view/room_detail/date_dialogue.dart';
import 'package:choose_n_fly/view/room_detail/guest_dtail2.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../network/network_controller.dart';

class RoomDetails2 extends StatelessWidget {
  RoomDetails2(
      {super.key,
      this.nights,
      this.roomCount,
      this.adultCount,
      this.childCount,
      //this.childAge,
      this.hotelCode,
      this.hotelName,
      this.hotelDetails,
      this.starRating,
      this.platform,
      this.hotelId,
      this.hotelcodeForDetail});
  final NetworkController networkController = Get.find<NetworkController>();

  String? hotelcodeForDetail;

  var nights;
  var roomCount;
  List? adultCount;
  List? childCount;
  //List? childAge;
  String? hotelCode;
  String? hotelName;
  String? hotelDetails;
  String? starRating;
  String? platform;
  int? hotelId;
  int itemLimit = 1;
  List<List<TextEditingController>> controllersList = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List amIons = [
    Icons.wifi,
    Icons.restaurant,
    Icons.local_parking,
    Icons.tv,
    Icons.support_agent_rounded,
    Icons.bathtub_rounded,
  ];
  List amTitle = [
    "Free Wifi",
    "Restaurant",
    "Free Parking",
    "Television",
    "24 hour front desk",
    "Bathdub"
  ];

  String? formattedfromDate;
  String? formattedtoDate;
  String? type;
  @override
  Widget build(BuildContext context) {
    // var acController = Get.find<AccomodationController>();

    // var roomController = Get.put(RoomController2(nights ?? "", acController));
    var childAgeList = [];
    return WillPopScope(
      onWillPop: () async {
        Get.delete<RoomController2>();

        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var acController = Get.find<AccomodationController>();

          var roomController = Get.put(RoomController2(
              nights ?? "",
              acController,
              hotelCode!,
              platform,
              hotelcodeForDetail.toString()));
          print("rrrrrroooommm--${roomController.isRoomtypeLoading.value}");
          print("imgggggg${roomController.hotelimg.value}");

          return Scaffold(
            bottomSheet: Obx(
              () => roomController.isRoomtypeLoading.value == true ||
                      roomController.hoteldetailLoading.value == true ||
                      roomController.isNoRoomAvailable.value == true ||
                      platform == "11"
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          if (roomController.isDateShown.value == false &&
                              acController.isSearchtapped.value == false) {
                            Fluttertoast.showToast(msg: "Please enter date");
                          } else if (roomController.accommodationDetails ==
                                  null &&
                              acController.isSearchtapped.value == false) {
                            Fluttertoast.showToast(
                                msg: "Please enter room details");
                          } else {
                            Get.to(
                                () => BookingPage(
                                      roomController: roomController,
                                      acController: acController,
                                      checkinD:
                                          roomController.newCheckinDate.value,
                                      checkoutD:
                                          roomController.newCheckoutDate.value,
                                      roomDetail:
                                          roomController.accommodationDetails,
                                      platForm: platform,
                                      hotelId: hotelId,
                                      totalPrice: roomController
                                          .selectedRoomCategoryRate.value,
                                      selectedRoomCategoryData:
                                          roomController.selectedRoomData,
                                      hotelName: hotelName,
                                      // sellingPrice: roomController
                                      //     .selectedSellingPrice.value,

                                      // roomCategoryId: roomController
                                      //     .selectedRoomcategoryId.value,
                                      // roomTypeId: roomController
                                      //     .selectedRoomTypeId.value,
                                      // occupationId: roomController
                                      //     .selectedOccupationId.value,
                                    ),
                                transition: Transition.rightToLeftWithFade);
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomButton(
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Get.delete<RoomController2>();
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.black,
                  )),
            ),
            body: Obx(() => roomController.isRoomtypeLoading.value == true ||
                    roomController.hoteldetailLoading.value == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: loader(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(" Checking availability...")
                    ],
                  )
                : SingleChildScrollView(
                    // physics: BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Obx(
                                () => roomController.hotelimg.length == 0
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.32,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.531),
                                        ),
                                        child: const Icon(Icons.error),
                                      )
                                    : CarouselSlider(
                                        options: CarouselOptions(
                                            enableInfiniteScroll: true,
                                            aspectRatio: 18 / 5,
                                            viewportFraction: 1.0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32,
                                            autoPlay: roomController
                                                        .hotelimg.length ==
                                                    1
                                                ? false
                                                : true),
                                        items: roomController.hotelimg.map((e) {
                                          return Builder(
                                              builder: (BuildContext context) {
                                            return CachedNetworkImage(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.32,
                                              imageUrl: platform == "0"
                                                  ? "$imgUrl${e.toString()}"
                                                  : e.toString(),
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.32,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Center(
                                                child: Lottie.asset(
                                                    "assets/animation/Animation - 1700807305736.json",
                                                    fit: BoxFit.cover),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  roomController
                                                          .hotelimg.isEmpty
                                                      ? const Center(
                                                          child:
                                                              Icon(Icons.error))
                                                      : const Center(
                                                          child: Icon(
                                                              Icons.error)),
                                            );
                                          });
                                        }).toList(),
                                      ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 16, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4),
                                          child: Text(
                                            hotelName!,
                                            maxLines: 2,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.024,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        hotelDetails != ""
                                            ? Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 3),
                                                      child: Text(
                                                        "  ${hotelDetails!}",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.018,
                                                            color: Colors
                                                                .grey.shade400),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Colors.orange,
                                                  ),
                                                  Container(
                                                    height: 24,
                                                    width: 48,
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${starRating}/5',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Obx(
                                                () => roomController
                                                            .selectedRoomCategoryRate
                                                            .value ==
                                                        ""
                                                    ? const SizedBox()
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 13,
                                                                top: 7),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                              'Best Offer    ',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: ColorConstant
                                                                    .lightBlue,
                                                              ),
                                                            ),
                                                            Obx(
                                                              () => Text(
                                                                "${roomController.selectedRoomCategoryRate.value.toString()}  ${roomController.selectedCurrCode.value}",
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0xFF149AED),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.025),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 5),
                            //========

                            child: Obx(
                              () => roomController.isNoRoomAvailable.value ==
                                      true
                                  ? const Text(
                                      "No Rooms Available",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 148, 34, 26)),
                                    )
                                  : DropdownButtonFormField<dynamic>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 6,
                                              bottom: 6,
                                              left: 14,
                                              right: 14),
                                          hintStyle:
                                              TextingStyle.font14normalLb,
                                          hintText: 'Select Room',
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: ColorConstant.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: ColorConstant.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      value: roomController
                                          .SelecteddropdownIndex.value,
                                      onChanged: (newValue) async {
                                        if (newValue != null) {
                                          roomController.SelecteddropdownIndex
                                              .value = newValue;
                                          int selectedIndex =
                                              int.parse(newValue);
                                          if (selectedIndex >= 0 &&
                                              selectedIndex <
                                                  roomController
                                                      .roomcategorydata
                                                      .length) {
                                            roomController.selectedRoomData =
                                                roomController.roomcategorydata[
                                                    selectedIndex];
                                            if (platform == "0" ||
                                                platform == "10") {
                                              roomController
                                                      .selectedRoomCategory
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          'roomCategory']
                                                      .toString();

                                              roomController
                                                      .selectedRoomCategoryId
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          'intoken']
                                                      .toString();

                                              roomController.hotelIdForInJumerah
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          'hotel_id']
                                                      .toString();
                                              if (platform == "10") {
                                                if (roomController.selectedRoomData!["breakfast_included"] == true &&
                                                    roomController.selectedRoomData!["lunch_included"] ==
                                                        true &&
                                                    roomController.selectedRoomData!["dinner_included"] ==
                                                        true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With BreakFast, Lunch And Dinner Included";
                                                } else if (roomController
                                                                .selectedRoomData![
                                                            "breakfast_included"] ==
                                                        true &&
                                                    roomController.selectedRoomData!["lunch_included"] ==
                                                        true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With BreakFast And Lunch Included";
                                                } else if (roomController
                                                                .selectedRoomData![
                                                            "breakfast_included"] ==
                                                        true &&
                                                    roomController.selectedRoomData!["dinner_included"] ==
                                                        true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With BreakFast And Dinner Included";
                                                } else if (roomController
                                                                .selectedRoomData![
                                                            "lunch_included"] ==
                                                        true &&
                                                    roomController.selectedRoomData![
                                                            "dinner_included"] ==
                                                        true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With Lunch And Dinner Included";
                                                } else if (roomController
                                                            .selectedRoomData![
                                                        "breakfast_included"] ==
                                                    true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With BreakFast Included";
                                                } else if (roomController
                                                            .selectedRoomData![
                                                        "lunch_included"] ==
                                                    true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With Lunch Included";
                                                } else if (roomController
                                                        .selectedRoomData!["dinner_included"] ==
                                                    true) {
                                                  roomController
                                                          .selectedMealType
                                                          .value =
                                                      "Room With Dinner Included";
                                                } else {
                                                  roomController
                                                      .selectedMealType
                                                      .value = "Room Only";
                                                  roomController
                                                      .selectedCurrCode
                                                      .value = roomController
                                                              .selectedRoomData![
                                                          'cancellation_policy']
                                                      ["currency_code"];
                                                }
                                              } else {
                                                roomController.selectedMealType
                                                    .value = roomController
                                                        .selectedRoomData![
                                                    "roomType"];
                                                roomController.selectedCurrCode
                                                    .value = "";
                                              }
                                              roomController
                                                  .cancellationPolicy();
                                            } else if (platform == "12") {
                                              roomController
                                                      .selectedRoomCategory
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          'roomType']
                                                      .toString();
                                              roomController
                                                      .selectedRoomRatePlanId
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          "ratePlanId"]
                                                      .toString();
                                              roomController
                                                      .selectedRoomTypeCode
                                                      .value =
                                                  roomController
                                                      .selectedRoomData![
                                                          "roomTypeCode"]
                                                      .toString();
                                              roomController.selectedCurrCode
                                                  .value = roomController
                                                      .selectedRoomData![
                                                  "currCode"];
                                              roomController.selectedMealType
                                                  .value = roomController
                                                      .selectedRoomData![
                                                  "mealPlan"];

                                              for (var room in roomController
                                                  .cancelPolicyRoomsiwtx) {
                                                if (room['ratePlanId']
                                                            .toString() ==
                                                        roomController
                                                            .selectedRoomRatePlanId
                                                            .value &&
                                                    room['roomTypeCode']
                                                            .toString() ==
                                                        roomController
                                                            .selectedRoomTypeCode
                                                            .value) {
                                                  roomController.desiredRoom =
                                                      await room;
                                                  print(roomController
                                                      .desiredRoom);

                                                  break;
                                                }
                                              }

                                              // Check if the desired room was found
                                              if (roomController.desiredRoom !=
                                                      null &&
                                                  roomController.desiredRoom![
                                                              "cancellationPolicyDetails"]
                                                          ["cancellation"] !=
                                                      null) {
                                                print("oi");
                                                // Extract cancellation policy details
                                                roomController.cancelPolicy
                                                    .value = roomController
                                                            .desiredRoom![
                                                        'cancellationPolicyDetails']
                                                    ['cancellation'];
                                                print(
                                                    "policyyhere===${roomController.cancelPolicy.value}");
                                              } else {
                                                print("pp");
                                                roomController
                                                    .cancelPolicy.value = [];

                                                print(roomController
                                                    .cancelPolicy.value);
                                              }
                                            }

                                            roomController
                                                .selectedRoomCategoryRate
                                                .value = double.parse(
                                                    roomController
                                                        .selectedRoomData![
                                                            'totalRate']
                                                        .toString())
                                                .round()
                                                .toString();
                                          }
                                        }
                                      },
                                      items: roomController.roomcategorydata
                                          .asMap()
                                          .entries
                                          .map<DropdownMenuItem<String>>(
                                              (entry) {
                                        int index = entry.key;

                                        Map<String, dynamic> item = entry.value;

                                        return DropdownMenuItem<String>(
                                          value: index.toString(),
                                          child: platform == "0" ||
                                                  platform == "10"
                                              ? Text(item["roomCategory"])
                                              : platform == "12"
                                                  ? Text(item["roomType"])
                                                  : const Text(""),
                                        );
                                      }).toList(),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return "Please select room type";
                                        }
                                      },
                                    ),
                            ),

                            //====================
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012),
                          Padding(
                            padding: const EdgeInsets.only(left: 26, right: 26),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: ColorConstant.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 58,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      dateDialogue(context, roomController,
                                          acController);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 16, top: 10),
                                            child: Text(
                                              'Date',
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.lightBlue2,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                            ),
                                            child: Text(
                                              '${roomController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${roomController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                              style: const TextStyle(
                                                  color:
                                                      ColorConstant.lightBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  //const Spacer(),
                                  const VerticalDivider(
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => GuestDetail2(
                                              roomController: roomController,
                                              acController: acController,
                                              adultCounts: adultCount!,
                                              childCounts: childCount!,
                                              childAgeLists: childAgeList),
                                          transition:
                                              Transition.rightToLeftWithFade);
                                    },
                                    child: Container(
                                      width: 160,
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 16, top: 10),
                                            child: Text(
                                              'Room & Guests',
                                              style: TextStyle(
                                                  color: Color(0XFF7699A5),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    roomController.newRoomCount
                                                                .value ==
                                                            "1"
                                                        ? "${roomController.newRoomCount.value} Room - "
                                                        : "${roomController.newRoomCount.value} Rooms - ",

                                                    //"${roomController.newRoomCount.value} Rooms - ${roomController.guestTotal} Guests",
                                                    style: const TextStyle(
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    roomController.guestTotal!
                                                                .value ==
                                                            1
                                                        ? "${roomController.guestTotal!.value} Guest"
                                                        : "${roomController.guestTotal!.value} Guests",

                                                    //"${roomController.newRoomCount.value} Rooms - ${roomController.guestTotal} Guests",
                                                    style: const TextStyle(
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 0, bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                roomController.hotelDescription.value == ""
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Description",
                                              style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ReadMoreText(
                                            roomController
                                                .hotelDescription.value,
                                            // "Monteverde Country Lodge is a quiet, comfortable hotel located near the Ecological Sanctuary and the Monteverde Butterfly Gardens in an area called Cerro Plano, an ideal location half way between the Monteverde Cloud Forest reserve and the main village of the Monteverde area (Santa Elena), in close proximity to several restaurants and activities. All rooms have private bathrooms with hot water.",
                                            style:
                                                const TextStyle(fontSize: 13),
                                            trimLines: 2,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: 'Show more',
                                            trimExpandedText: 'Show less',
                                            lessStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: ColorConstant.lightBlue,
                                                fontSize: 13),
                                            moreStyle: const TextStyle(
                                                color: ColorConstant.lightBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                roomController.selectedMealType.value == ""
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text("Meal Type",
                                              style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            roomController
                                                .selectedMealType.value
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                Obx(
                                  () => roomController
                                              .isRoomtypeLoading.value ==
                                          false
                                      ? roomController.platform == "0"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Amenities",
                                                    style: TextStyle(
                                                        color:
                                                            ColorConstant.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                GridView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing: 0,
                                                            mainAxisExtent: 40,
                                                            mainAxisSpacing: 0),
                                                    //itemCount: amIons.length,
                                                    itemCount: roomController
                                                        .hotelDetailsModel!
                                                        .data[0]
                                                        .inhouseHotelDetails!
                                                        .data
                                                        .hotelAmenitiesMainDtoList
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        height: 15,
                                                        // color: Colors.yellow,
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      0),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 22,
                                                                width: 22,
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            "assets/images/failities.png"),
                                                                        fit: BoxFit
                                                                            .cover)),
                                                              ),
                                                              // Icon(
                                                              //   FontAwesomeIcons
                                                              //       .servicestack,
                                                              //   color:
                                                              //       ColorConstant
                                                              //           .grey,
                                                              // ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                  roomController
                                                                          .hotelDetailsModel!
                                                                          .data[
                                                                              0]
                                                                          .inhouseHotelDetails!
                                                                          .data
                                                                          .hotelAmenitiesMainDtoList[
                                                                              index]
                                                                          .localName
                                                                          .toString() ??
                                                                      "",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          13))
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ],
                                            )
                                          : const SizedBox()
                                      : const SizedBox(),
                                ),
                                roomController.cancelPolicy.length == 0
                                    ? const SizedBox()
                                    : const Text("Cancellation Policies",
                                        style: TextStyle(
                                            color: ColorConstant.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),

                                // GetBuilder<RoomController2>(
                                //   builder: (controller) {
                                //     return Text(controller.desiredRoom![
                                //             "cancellationPolicyDetails"]
                                //             ["cancellation"]
                                //         .toString());
                                //   },
                                // )
                                Obx(() {
                                  print(platform);
                                  print(
                                      roomController.cancePolicyloading.value);
                                  if (platform == "0" || platform == "10") {
                                    if (roomController
                                            .cancePolicyloading.value ==
                                        true) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }
                                  return ListView.builder(
                                      padding: const EdgeInsets.only(
                                          bottom: 60, top: 10),
                                      itemCount: roomController
                                          .cancelPolicy.value.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        print("wrkeddd");
                                        print(
                                            "desiredroom==>${roomController.desiredRoom}");
                                        if (platform == "12") {
                                          var cancelIndex = roomController
                                              .cancelPolicy[index];
                                          String fyear = cancelIndex["fromDate"]
                                              .toString()
                                              .substring(0, 4);
                                          String fmonth =
                                              cancelIndex["fromDate"]
                                                  .toString()
                                                  .substring(4, 6);
                                          String fday = cancelIndex["fromDate"]
                                              .toString()
                                              .substring(6, 8);

                                          formattedfromDate =
                                              '$fyear/$fmonth/$fday';
                                          String tyear = cancelIndex["toDate"]
                                              .toString()
                                              .substring(0, 4);
                                          String tmonth = cancelIndex["toDate"]
                                              .toString()
                                              .substring(4, 6);
                                          String tday = cancelIndex["toDate"]
                                              .toString()
                                              .substring(6, 8);

                                          formattedtoDate =
                                              '$tyear/$tmonth/$tday';

                                          type =
                                              cancelIndex["percentOrAmt"] == "P"
                                                  ? "%"
                                                  : "AED";
                                        } else if (platform == "0" ||
                                            platform == "10") {}

                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          minLeadingWidth: 10,
                                          titleAlignment: ListTileTitleAlignment
                                              .titleHeight,
                                          leading: const Icon(
                                            Icons.circle_rounded,
                                            size: 7,
                                          ),
                                          title: platform == "12"
                                              ? Text(
                                                  "Cancellation between ${formattedfromDate} to ${formattedtoDate} will be charged AED ${roomController.selectedRoomCategoryRate.value}/- (${roomController.cancelPolicy[index]["value"] ?? "".toString()}  ${type})",
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                )
                                              : Text(
                                                  roomController
                                                          .cancelPolicy[index]
                                                      ["policyRemark"],
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                        );
                                      });
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }
}
//

