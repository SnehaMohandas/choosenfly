import 'package:cached_network_image/cached_network_image.dart';
import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/acc_date_dailogue.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/accommodation/guest_detail1.dart';
import 'package:choose_n_fly/view/room_detail/roomdetails2.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class AccommodationScreen extends StatelessWidget {
  AccommodationScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NetworkController networkController = Get.find<NetworkController>();

  var childAgeList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<AccomodationController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var acController = Get.put(AccomodationController());
          var splashController = Get.put(SplashController());

          //print(acController.isSubLoading.value);

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<AccomodationController>();
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: const Text(
                'Accommodation',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)))),
            ),
            body: Obx(
              () => splashController.isLoading.value == true
                  ? Center(child: loader())
                  : acController.exceptionCatched.value == true
                      ? const Center(
                          child: Text(
                            "SERVER  ERROR",
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorConstant.red,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, top: 7),
                                child: CustomDropdown.search(
                                  closedFillColor: Colors.white,
                                  expandedFillColor: Colors.white,
                                  initialItem:
                                      acController.orgNatCountry.value != ""
                                          ? acController.orgNatCountry.value
                                          : acController.selectedNatCountry
                                                      .value ==
                                                  ""
                                              ? null
                                              : acController
                                                  .selectedNatCountry.value,
                                  // initialItem: acController.selectedNative.value == ""
                                  //     ? null
                                  //     : acController.selectedNative.value,
                                  closedBorder:
                                      Border.all(color: ColorConstant.grey),
                                  hintBuilder: (context, hint) {
                                    return Text("Select Native Country",
                                        style: TextingStyle.font14normalLb);
                                  },

                                  items: splashController.native.map((item) {
                                    return item[0];
                                  }).toList(),
                                  excludeSelected: false,
                                  onChanged: (value) {
                                    acController.isNativeNotSelected.value =
                                        false;
                                    print('changing value to: $value');
                                    List<dynamic> selectedNative =
                                        splashController.native.firstWhere(
                                            (item) => item[0] == value);
                                    acController.selectedNatCountry.value =
                                        selectedNative[0];
                                    acController.selectedNativeCode.value =
                                        selectedNative[1].toString();

                                    print(acController.selectedNativeCode.value
                                        .toString());

                                    // acController.onNatSelected(selectedNative[1]);
                                    // acController.onNatCountry(selectedNative[0]);
                                  },
                                ),
                              ),
                              Obx(() =>
                                  acController.isNativeNotSelected.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(left: 28),
                                          child: Text("Please select an option",
                                              style: TextStyle(
                                                  color: ColorConstant.red,
                                                  fontSize: 13)),
                                        )
                                      : const SizedBox()),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: CustomDropdown.search(
                                  closedFillColor: Colors.white,
                                  expandedFillColor: Colors.white,
                                  initialItem:
                                      acController.orgDestination.value != ""
                                          ? acController.orgDestination.value
                                          : acController.selectedDestinaion
                                                      .value ==
                                                  ""
                                              ? null
                                              : acController
                                                  .selectedDestinaion.value,
                                  // initialItem: acController.orgdesCountry.value != ""
                                  //     ? acController.orgdesCountry.value
                                  //     : acController.selectedDesCountry.value == ""
                                  //         ? null
                                  //         : acController.selectedDesCountry.value,
                                  canCloseOutsideBounds: false,
                                  closedBorder:
                                      Border.all(color: ColorConstant.grey),
                                  hintBuilder: (context, hint) {
                                    return Text("Select Destination Country",
                                        style: TextingStyle.font14normalLb);
                                  },
                                  items:
                                      splashController.destination.map((item) {
                                    return item[0];
                                  }).toList(),

                                  excludeSelected: false,
                                  onChanged: (value) {
                                    acController.isDestNotSelected.value =
                                        false;
                                    List<dynamic> selecteddes = splashController
                                        .destination
                                        .firstWhere((item) => item[0] == value);
                                    acController.selectedDestinaion.value =
                                        selecteddes[0];
                                    acController.selectedDesCode.value =
                                        selecteddes[1];
                                    acController.selectedDesType.value =
                                        selecteddes[2];

                                    // print('changing value to: $value');
                                    // acController.selectedDestinaion.value = value;
                                    // print(acController.selectedDestinaion.value);
                                    // List<String> selectedDestination = acController
                                    //     .destination
                                    //     .firstWhere((item) => item[0] == value);
                                    // acController.onDesSelected(selectedDestination[1]);
                                    // acController.onDesCountry(selectedDestination[0]);
                                  },
                                ),
                              ),
                              Obx(() =>
                                  acController.isDestNotSelected.value == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(left: 28),
                                          child: Text("Please select an option",
                                              style: TextStyle(
                                                  color: ColorConstant.red,
                                                  fontSize: 13)),
                                        )
                                      : const SizedBox()),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, top: 7),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: ColorConstant.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 58,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          acDateDialogue(context, acController);
                                        },
                                        child: Container(
                                          color: Colors.transparent,
                                          width: 130,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16, top: 10),
                                                child: Text('Date',
                                                    style: TextingStyle
                                                        .font12blue),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 16,
                                                  ),
                                                  child: Obx(
                                                    () => acController
                                                                    .newCheckinDate
                                                                    .value !=
                                                                "" &&
                                                            acController
                                                                    .newCheckoutDate
                                                                    .value !=
                                                                "" &&
                                                            acController
                                                                    .isDateShown
                                                                    .value ==
                                                                true
                                                        ? Text(
                                                            '${acController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                            style: const TextStyle(
                                                                color: ColorConstant
                                                                    .lightBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14),
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: ColorConstant
                                                                .lightBlue,
                                                            size: 28,
                                                          ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //  Spacer(),
                                      const VerticalDivider(
                                        thickness: 1,
                                        color: ColorConstant.grey,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => GuestDetail1(
                                                  acController: acController),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                          //showBottomSheet(context, acController);
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          width: 160,
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
                                                      color: ColorConstant
                                                          .lightBlue2,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                ),
                                                child: Obx(
                                                  () => acController
                                                              .isSubLoading
                                                              .value ==
                                                          false
                                                      ? Text(
                                                          "${acController.newRoomCount.value} Rooms - ${acController.guestTotal} Guests",
                                                          style: const TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .lightBlue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14),
                                                        )
                                                      : const Icon(
                                                          Icons.arrow_drop_down,
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
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 14),
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () async {
                                      if (acController.isHotelLoading.value ==
                                          true) {}

                                      if (acController
                                              .selectedNatCountry.value ==
                                          "") {
                                        acController.isNativeNotSelected.value =
                                            true;
                                      }
                                      if (acController
                                              .selectedDestinaion.value ==
                                          "") {
                                        acController.isDestNotSelected.value =
                                            true;
                                      } else if (acController
                                                      .checkInDate.value ==
                                                  "" &&
                                              acController.checkOutDate.value ==
                                                  "" &&
                                              acController.isDateShown.value ==
                                                  false ||
                                          acController.isSubLoading.value ==
                                              true) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please enter date and room details");
                                      } else {
                                        await orgValueadded(acController);

                                        await acController.postAccommodation();
                                      }
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: ColorConstant.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: acController
                                                    .isSearchtapped.value ==
                                                false
                                            ? const Text("Search",
                                                style: TextStyle(
                                                    color: ColorConstant.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                            : acController
                                                        .isHotelLoading.value ==
                                                    true
                                                ? const Text("Searching...",
                                                    style: TextStyle(
                                                        color:
                                                            ColorConstant.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))
                                                : const Text("Modify Search",
                                                    style: TextStyle(
                                                        color:
                                                            ColorConstant.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => acController.isHotelLoading.value == true
                                    ? Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Center(child: loader()),
                                            ),
                                          ],
                                        ),
                                      )
                                    : acController.allHotelModel == null
                                        ? const SizedBox()
                                        : acController.allItems.isEmpty
                                            ? Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 40,
                                                              bottom: 10),
                                                      child: Center(
                                                        child: Container(
                                                          height: 120,
                                                          width: 120,
                                                          child: Lottie.asset(
                                                              "assets/animation/no_search_results.json",
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(
                                                      "No hotels available",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )

                                            //==================================
                                            : Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 24,
                                                          right: 24,
                                                          top: 0,
                                                          bottom: 10),
                                                  child: GridView.builder(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    //  physics: NeverScrollableScrollPhysics(),
                                                    //  shrinkWrap: true,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            mainAxisSpacing: 10,
                                                            crossAxisSpacing:
                                                                10,
                                                            childAspectRatio:
                                                                0.9,
                                                            mainAxisExtent:
                                                                180),
                                                    itemCount: acController
                                                        .allItems.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                              () =>
                                                                  RoomDetails2(
                                                                    nights: acController
                                                                        .nitController
                                                                        .text,
                                                                    roomCount: acController
                                                                        .newRoomCount
                                                                        .value,
                                                                    adultCount:
                                                                        acController
                                                                            .adultDdnum,
                                                                    childCount:
                                                                        acController
                                                                            .childDdnum,
                                                                    childAge:
                                                                        childAgeList,
                                                                  ),
                                                              transition: Transition
                                                                  .rightToLeftWithFade);
                                                        },
                                                        child: Material(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          elevation: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  CachedNetworkImage(
                                                                    height: 108,
                                                                    imageUrl: acController.allItems[index]["platForm"] ==
                                                                            "inhouse"
                                                                        ? '${imgUrl}${acController.allItems[index]["imageName"]}'
                                                                        : '${acController.allItems[index]["imageName"]}',
                                                                    imageBuilder:
                                                                        (context,
                                                                                imageProvider) =>
                                                                            Container(
                                                                      height:
                                                                          108,
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.531),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                imageProvider,
                                                                            fit:
                                                                                BoxFit.cover),
                                                                      ),
                                                                    ),
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            Center(
                                                                      child: Lottie.asset(
                                                                          "assets/animation/Animation - 1700807305736.json",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        const Center(
                                                                            child:
                                                                                Icon(Icons.error)),
                                                                  ),
                                                                  Text(
                                                                    acController.allItems[index]
                                                                            [
                                                                            "hotel_name"] ??
                                                                        "",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    acController.allItems[index]
                                                                            [
                                                                            "hotel_details"] ??
                                                                        "",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          8,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            acController.allItems[index]["totalRateMax"].toString() ??
                                                                                // acController
                                                                                //         .allHotelModel![0]
                                                                                //         .inhouseHotels!
                                                                                //         .data[1][index]["totalRateMax"]
                                                                                //         .toString() ??
                                                                                "",
                                                                            style:
                                                                                const TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 13.65,
                                                                              color: ColorConstant.lightBlue,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Icon(
                                                                              Icons.star,
                                                                              size: 11,
                                                                              color: ColorConstant.orange),
                                                                          Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.025,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: ColorConstant.orange,
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            child:
                                                                                const Center(
                                                                              child: Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                child: Text(
                                                                                  '4.3/5',
                                                                                  style: TextStyle(
                                                                                    fontSize: 9,
                                                                                    fontWeight: FontWeight.w700,
                                                                                    color: ColorConstant.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                              )
                            ],
                          ),
                        ),
              // ),
            ),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  orgValueadded(AccomodationController acController) {
    acController.isSearchtapped.value = true;
    acController.orgnewChekin.value = acController.newCheckinDate.value;
    acController.orgnewChekout.value = acController.newCheckoutDate.value;
    acController.orgDestination.value = acController.selectedDestinaion.value;
    acController.orgDesCode.value = acController.selectedDesCode.value;

    acController.orgDesType.value = acController.selectedDesType.value;

    acController.orgNativeCode.value = acController.selectedNativeCode.value;
    // acController.orgdesCountry.value = acController.selectedDesCountry.value;
    acController.orgNatCountry.value = acController.selectedNatCountry.value;
    acController.orgRoomcount.value = acController.newRoomCount.value;
    acController.orgguestTotal.value = acController.guestTotal.value;

    acController.orgAccomodationDetails = acController.accommodationDetails;
    acController.orginHaccDetails = acController.inHaccDetails;
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0, // Set the width of each GridView
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in each row
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemBuilder: (BuildContext context, int index) {
          // Create a widget for each item in the grid
          return GridItem(index);
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem(this.index);

  @override
  Widget build(BuildContext context) {
    // You can customize this widget based on your needs
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
