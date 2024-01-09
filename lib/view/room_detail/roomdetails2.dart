import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
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
import 'package:readmore/readmore.dart';

import '../../network/network_controller.dart';

class RoomDetails2 extends StatelessWidget {
  RoomDetails2(
      {super.key,
      this.nights,
      this.roomCount,
      this.adultCount,
      this.childCount,
      this.childAge,
      this.hotelCode,
      this.hotelName,
      this.hotelDetails});
  final NetworkController networkController = Get.find<NetworkController>();

  var nights;
  var roomCount;
  List? adultCount;
  List? childCount;
  List? childAge;
  String? hotelCode;
  String? hotelName;
  String? hotelDetails;
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

          var roomController =
              Get.put(RoomController2(nights ?? "", acController, hotelCode!));
          return Scaffold(
            bottomSheet: Obx(
              () => roomController.isRoomtypeLoading.value == true ||
                      roomController.isNoRoomAvailable.value == true
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
                                      checkinD: roomController
                                                  .isDateShown.value ==
                                              true
                                          ? roomController.newCheckinDate.value
                                          // : acController.isDateShown.value == true
                                          //     ? acController.newCheckinDate.value
                                          : acController.orgnewChekin.value !=
                                                  ""
                                              ? acController.orgnewChekin.value
                                              : acController.isSearchtapped
                                                          .value ==
                                                      true
                                                  ? acController
                                                      .newCheckinDate.value
                                                  : "",
                                      checkoutD: roomController
                                                  .isDateShown.value ==
                                              true
                                          ? roomController.newCheckoutDate.value
                                          : acController.orgnewChekout.value !=
                                                  ""
                                              ? acController.orgnewChekout.value
                                              : acController.isSearchtapped
                                                          .value ==
                                                      true
                                                  ? acController
                                                      .newCheckoutDate.value
                                                  // : acController.isDateShown.value == true
                                                  //     ? acController.newCheckoutDate.value
                                                  : "",
                                      roomDetail: roomController
                                                  .accommodationDetails !=
                                              null
                                          ? roomController.accommodationDetails
                                          : acController
                                                      .orgAccomodationDetails !=
                                                  null
                                              ? acController
                                                  .orgAccomodationDetails
                                              : acController.isSearchtapped
                                                          .value ==
                                                      true
                                                  ? acController
                                                      .accommodationDetails
                                                  //============
                                                  // : acController.accommodationDetails != null
                                                  //     ? acController.accommodationDetails
                                                  //=======
                                                  : [],
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
                    color: ColorConstant.white,
                  )),
            ),
            body: Obx(
              () => roomController.isRoomtypeLoading.value == true
                  ? Center(
                      child: loader(),
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
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.37,
                                    child: Obx(
                                      () => CarouselSlider.builder(
                                        itemCount: roomController
                                                    .isInteriorClicked.value ==
                                                true
                                            ? roomController.interior.length
                                            : roomController.exterior.length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          return roomController
                                                      .isInteriorClicked
                                                      .value ==
                                                  true
                                              ? Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.37,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              roomController
                                                                      .interior[
                                                                  index]),
                                                          fit: BoxFit.cover)),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.37,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              roomController
                                                                      .exterior[
                                                                  index]),
                                                          fit: BoxFit.cover)),
                                                );
                                        },
                                        options: CarouselOptions(
                                            onPageChanged: (index, reason) {
                                              if (roomController
                                                      .isInteriorClicked
                                                      .value ==
                                                  true) {
                                                roomController.interiorIndex
                                                    .value = "${index + 1}";
                                              } else {
                                                roomController.exteriorIndex
                                                    .value = "${index + 1}";
                                              }
                                            },
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.37,
                                            // enlargeCenterPage: true,
                                            // aspectRatio: 1,
                                            //  autoPlayCurve: Curves.elasticIn,
                                            enableInfiniteScroll: true,
                                            viewportFraction: 1,
                                            autoPlay: true),
                                      ),
                                    )),
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.3,
                                  left: 20,
                                  child: Obx(
                                    () => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              roomController.isInteriorClicked
                                                  .value = true;
                                            },
                                            child: Text(
                                              'Interior',
                                              style: TextStyle(
                                                  color: roomController
                                                              .isInteriorClicked
                                                              .value ==
                                                          true
                                                      ? ColorConstant
                                                          .primaryColor
                                                      : ColorConstant.darkgrey,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const Spacer(),
                                          const VerticalDivider(
                                            thickness: 1,
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              roomController.isInteriorClicked
                                                  .value = false;
                                            },
                                            child: Text(
                                              'Exterior',
                                              style: TextStyle(
                                                  color: roomController
                                                              .isInteriorClicked
                                                              .value ==
                                                          true
                                                      ? ColorConstant.darkgrey
                                                      : ColorConstant
                                                          .primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const Spacer()
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.3,
                                    left: MediaQuery.of(context).size.width *
                                        0.77,
                                    child: Obx(
                                      () => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.035,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17,
                                        decoration: BoxDecoration(
                                            color: const Color(0XFF161616),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/material-symbols_image-outline-rounded.png',
                                              height: 100,
                                              filterQuality: FilterQuality.high,
                                            ),
                                            roomController.isInteriorClicked
                                                        .value ==
                                                    true
                                                ? Text(
                                                    "${roomController.interiorIndex.value}/${roomController.interior.length}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    "${roomController.exteriorIndex.value}/${roomController.exterior.length}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
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
                                        Text(
                                          hotelDetails!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              color: Colors.grey.shade400),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 12,
                                                color: Colors.orange,
                                              ),
                                              Container(
                                                height: 20,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '4.3/5',
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 13,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'Best Offer',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: ColorConstant.lightBlue,
                                          ),
                                        ),
                                        Obx(
                                          () => Text(
                                            roomController
                                                .selectedRoomCategoryRate.value
                                                .toString(),
                                            style: TextStyle(
                                                color: const Color(0xFF149AED),
                                                fontWeight: FontWeight.w700,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025),
                                          ),
                                        ),
                                        Text(
                                          '250AED',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.014,
                                              color: const Color(0xFF5E5E5E)),
                                        ),
                                        // Text(
                                        //   '+ 10AED taxes and fee',
                                        //   style: TextStyle(
                                        //       fontWeight: FontWeight.w500,
                                        //       fontSize: MediaQuery.of(context)
                                        //               .size
                                        //               .height *
                                        //           0.014,
                                        //       color: const Color(0xFF5E5E5E)),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.012),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 5),

                              child: Obx(
                                () => roomController.isNoRoomAvailable.value ==
                                        true
                                    ? const Text(
                                        "No Rooms Available",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 148, 34, 26)),
                                      )
                                    : DropdownButtonFormField<dynamic>(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
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
                                                    .selectedRoomCategoryId
                                                    .value !=
                                                ""
                                            ? int.parse(roomController
                                                .selectedRoomCategoryId.value)
                                            : null,
                                        onChanged: (newValue) {
                                          print(newValue);
                                          List<dynamic> selecteddes =
                                              roomController
                                                  .roomCategory
                                                  .firstWhere((item) =>
                                                      item[1] == newValue);

                                          roomController.selectedRoomCategory
                                              .value = selecteddes[0];
                                          roomController.selectedRoomCategoryId
                                                  .value =
                                              selecteddes[1].toString();
                                          roomController
                                                  .selectedRoomCategoryRate
                                                  .value =
                                              selecteddes[2].toString();
                                          print(selecteddes);
                                        },
                                        items: roomController.roomCategory
                                            .map((item) {
                                          return DropdownMenuItem(
                                            child: Text(item[0]),
                                            value: item[1],
                                          );
                                        }).toList(),
                                      ),
                              ),

                              //====================
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.012),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 26, right: 26),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: ColorConstant.grey),
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
                                                    color: ColorConstant
                                                        .lightBlue2,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Obx(
                                                  () => roomController
                                                                  .newCheckinDate
                                                                  .value !=
                                                              "" &&
                                                          roomController
                                                                  .newCheckoutDate
                                                                  .value !=
                                                              "" &&
                                                          roomController
                                                                  .isDateShown
                                                                  .value ==
                                                              true
                                                      ? Text(
                                                          '${roomController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${roomController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                          style: const TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .lightBlue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14),
                                                        )
                                                      : acController.orgnewChekin
                                                                      .value !=
                                                                  "" &&
                                                              acController
                                                                      .orgnewChekout
                                                                      .value !=
                                                                  ""
                                                          ? Text(
                                                              '${acController.orgnewChekin.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.orgnewChekout.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                              style: const TextStyle(
                                                                  color: ColorConstant
                                                                      .lightBlue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14),
                                                            )
                                                          : acController
                                                                      .isSearchtapped
                                                                      .value ==
                                                                  true

                                                              //=======
                                                              //  acController
                                                              //                 .newCheckinDate.value !=
                                                              //             "" &&
                                                              //         acController.newCheckoutDate
                                                              //                 .value !=
                                                              //             "" &&
                                                              //         acController
                                                              //                 .isDateShown.value ==
                                                              //             true
                                                              //========
                                                              ? Text(
                                                                  '${acController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                                  style: const TextStyle(
                                                                      color: ColorConstant
                                                                          .lightBlue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14),
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: ColorConstant
                                                                      .lightBlue,
                                                                  size: 28,
                                                                ),
                                                ))
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
                                              child: Obx(
                                                () => roomController
                                                            .isSubLoading
                                                            .value ==
                                                        false
                                                    ? Text(
                                                        "${roomController.newRoomCount.value} Rooms - ${roomController.guestTotal} Guests",
                                                        style: const TextStyle(
                                                            color: ColorConstant
                                                                .lightBlue,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14),
                                                      )
                                                    //=========
                                                    // : acController.isSubLoading.value == false
                                                    //============

                                                    : acController.orgRoomcount
                                                                .value !=
                                                            ""
                                                        ? Text(
                                                            "${acController.orgRoomcount.value} Rooms - ${acController.orgguestTotal} Guests",
                                                            style: const TextStyle(
                                                                color: ColorConstant
                                                                    .lightBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14),
                                                          )
                                                        : acController
                                                                    .isSearchtapped
                                                                    .value ==
                                                                true
                                                            ? Text(
                                                                "${acController.newRoomCount.value} Rooms - ${acController.guestTotal} Guests",
                                                                style: const TextStyle(
                                                                    color: ColorConstant
                                                                        .lightBlue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14),
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                color: ColorConstant
                                                                    .lightBlue,
                                                                size: 28,
                                                              ),
                                              ),
                                            )
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
                                  left: 23, right: 23, top: 12, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Description",
                                      style: TextStyle(
                                          color: ColorConstant.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const ReadMoreText(
                                    "ppp",
                                    // roomController.roomModel![0].hotelDetails
                                    //         .toString() ??
                                    //     "",
                                    style: TextStyle(
                                        fontSize:
                                            13), //  style: TextStyle(fontSize: 13),
                                    trimLines: 2,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    lessStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstant.lightBlue,
                                        fontSize: 13),
                                    moreStyle: TextStyle(
                                        color: ColorConstant.lightBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text("Amenities",
                                      style: TextStyle(
                                          color: ColorConstant.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GridView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 0,
                                              mainAxisExtent: 40,
                                              mainAxisSpacing: 0),
                                      itemCount: amIons.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 15,
                                          // color: Colors.yellow,
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  amIons[index],
                                                  color: ColorConstant.grey,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(amTitle[index],
                                                    style: const TextStyle(
                                                        fontSize: 13))
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  const Text("Cancellation Policies",
                                      style: TextStyle(
                                          color: ColorConstant.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 60),
                                      itemCount:
                                          roomController.cancelPolicy.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: const Icon(
                                            Icons.circle_rounded,
                                            size: 7,
                                          ),
                                          title: Text(
                                            roomController.cancelPolicy[index],
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
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
}
//
