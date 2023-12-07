import 'package:carousel_slider/carousel_slider.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/booking/booking_page.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:choose_n_fly/view/room_detail/guest_dtail2.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class RoomDetails2 extends StatelessWidget {
  RoomDetails2(
      {super.key,
      this.nights,
      this.roomCount,
      this.adultCount,
      this.childCount,
      this.childAge});
  var nights;
  var roomCount;
  List? adultCount;
  List? childCount;
  List? childAge;
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
    // print("roomcountttt===>${roomCount}");
    // print("adulttttcount==>${adultCount}");
    // print("childddcount==>${childCount}");

    // print("childage==>${childAge}");

    var acController = Get.find<AccomodationController>();

    var roomController = Get.put(RoomController2(nights ?? "", acController));
    var childAgeList = [];
    return WillPopScope(
      onWillPop: () async {
        Get.delete<RoomController2>();
        return true;
      },
      child: Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: GestureDetector(
            onTap: () {
              Get.to(
                  () => BookingPage(
                        roomController: roomController,
                        acController: acController,
                      ),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height * 0.05,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
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
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
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
                        height: MediaQuery.of(context).size.height * 0.37,
                        child: Obx(
                          () => CarouselSlider.builder(
                            itemCount:
                                roomController.isInteriorClicked.value == true
                                    ? roomController.interior.length
                                    : roomController.exterior.length,
                            itemBuilder: (context, index, realIndex) {
                              return roomController.isInteriorClicked.value ==
                                      true
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.37,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(roomController
                                                  .interior[index]),
                                              fit: BoxFit.cover)),
                                    )
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.37,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(roomController
                                                  .exterior[index]),
                                              fit: BoxFit.cover)),
                                    );
                            },
                            options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  if (roomController.isInteriorClicked.value ==
                                      true) {
                                    roomController.interiorIndex.value =
                                        "${index + 1}";
                                  } else {
                                    roomController.exteriorIndex.value =
                                        "${index + 1}";
                                  }
                                },
                                height:
                                    MediaQuery.of(context).size.height * 0.37,
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
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  roomController.isInteriorClicked.value = true;
                                },
                                child: Text(
                                  'Interior',
                                  style: TextStyle(
                                      color: roomController
                                                  .isInteriorClicked.value ==
                                              true
                                          ? ColorConstant.primaryColor
                                          : ColorConstant.darkgrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Spacer(),
                              VerticalDivider(
                                thickness: 1,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  roomController.isInteriorClicked.value =
                                      false;
                                },
                                child: Text(
                                  'Exterior',
                                  style: TextStyle(
                                      color: roomController
                                                  .isInteriorClicked.value ==
                                              true
                                          ? ColorConstant.darkgrey
                                          : ColorConstant.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.width * 0.77,
                        child: Obx(
                          () => Container(
                            height: MediaQuery.of(context).size.height * 0.035,
                            width: MediaQuery.of(context).size.width * 0.17,
                            decoration: BoxDecoration(
                                color: Color(0XFF161616),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/material-symbols_image-outline-rounded.png',
                                  height: 100,
                                  filterQuality: FilterQuality.high,
                                ),
                                roomController.isInteriorClicked.value == true
                                    ? Text(
                                        "${roomController.interiorIndex.value}/${roomController.interior.length}",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        "${roomController.exteriorIndex.value}/${roomController.exterior.length}",
                                        style: TextStyle(color: Colors.white),
                                      )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grand Millennium',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.024,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Al Wahda',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                color: Colors.grey.shade400),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '4.3/5',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 26,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Best Offer',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.lightBlue,
                              ),
                            ),
                            Text(
                              '149AED',
                              style: TextStyle(
                                  color: Color(0xFF149AED),
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                            Text(
                              '250AED',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  color: Color(0xFF5E5E5E)),
                            ),
                            Text(
                              '+ 10AED taxes and fee',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  color: Color(0xFF5E5E5E)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 5),
                  child: DropdownButtonFormField(
                    value: roomController.selectedRoom.value == ""
                        ? null
                        : roomController.selectedRoom.value,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 6, bottom: 6, left: 14, right: 14),
                        hintStyle: TextingStyle.font14normalLb,
                        hintText: 'Select Room',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorConstant.grey),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorConstant.grey),
                            borderRadius: BorderRadius.circular(10))),
                    items: roomController.rooms.map((item) {
                      return DropdownMenuItem(
                          value: item[1], child: Text(item[0]));
                    }).toList(),
                    onChanged: (v) {
                      roomController.onRoomSelected(v.toString());
                      print(roomController.selectedRoom.value);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select room";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 26),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.white,
                        border: Border.all(color: ColorConstant.grey),
                        borderRadius: BorderRadius.circular(10)),
                    height: 58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 400,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Check in: ",
                                            style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14)),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            roomController.selectCheckin(
                                                context, acController);
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: ColorConstant.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  blurRadius: 4,
                                                  offset: const Offset(1, -1),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Obx(() =>
                                                      roomController.checkInDate
                                                                  .value !=
                                                              ''
                                                          ? Text(
                                                              roomController
                                                                  .checkInDate
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )
                                                          : Text(
                                                              "select date",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )),
                                                ),
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        blurRadius: 4,
                                                        offset:
                                                            const Offset(2, 8),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => roomController
                                                      .ischeckInError.value ==
                                                  true
                                              ? Text(
                                                  "please select checkin date",
                                                  style: TextStyle(
                                                      color: ColorConstant.red,
                                                      fontSize: 10))
                                              : SizedBox(),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text("Check out: ",
                                            style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14)),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            roomController.selectCheckout(
                                                context, acController);
                                          },
                                          child: Container(
                                            width: 140,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: ColorConstant.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  blurRadius: 4,
                                                  offset: const Offset(1, -1),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Obx(() =>
                                                      roomController
                                                                  .checkOutDate
                                                                  .value !=
                                                              ""
                                                          ? Text(
                                                              roomController
                                                                  .checkOutDate
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )
                                                          : Text(
                                                              "select date",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )),
                                                ),
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .primaryColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        blurRadius: 4,
                                                        offset:
                                                            const Offset(2, 8),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => roomController
                                                      .ischeckOutError.value ==
                                                  true
                                              ? Text(
                                                  "please select checkout date",
                                                  style: TextStyle(
                                                      color: ColorConstant.red,
                                                      fontSize: 10))
                                              : SizedBox(),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text("Nights:",
                                            style: TextStyle(
                                                color: ColorConstant.black,
                                                fontSize: 14)),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 45),
                                          child: Form(
                                            child: TextFormField(
                                              onChanged: (value) {
                                                print(
                                                    "textflddvall===>${value}");
                                                int nights =
                                                    int.tryParse(value) ?? 0;
                                                roomController
                                                    .updateCheckoutDate(
                                                        nights, acController);
                                              },
                                              controller:
                                                  roomController.nitController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14))),
                                            ),
                                          ),
                                        ),
                                        Obx(
                                          () => roomController
                                                      .isnightError.value ==
                                                  true
                                              ? Text("Atleast select 1 night",
                                                  style: TextStyle(
                                                      color: ColorConstant.red,
                                                      fontSize: 10))
                                              : SizedBox(),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            ColorConstant
                                                                .white)),
                                                onPressed: () {
                                                  // acController.checkInDate.value = "";
                                                  // acController.checkOutDate.value = "";
                                                  // acController.difference.value =
                                                  //     Duration(seconds: 0);
                                                  // acController.nitController.clear();
                                                  // acController.ischeckInError.value =
                                                  //     false;
                                                  // acController.ischeckOutError.value =
                                                  //     false;
                                                  // acController.isDateShown.value =
                                                  //     false;

                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryColor,
                                                      fontSize: 14),
                                                )),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            ColorConstant
                                                                .primaryColor)),
                                                onPressed: () {
                                                  if (roomController
                                                          .checkInDate.value ==
                                                      "") {
                                                    roomController
                                                        .ischeckInError
                                                        .value = true;
                                                  } else if (roomController
                                                          .checkOutDate.value ==
                                                      "") {
                                                    roomController
                                                        .ischeckOutError
                                                        .value = true;
                                                  } else if (roomController
                                                              .nitController
                                                              .text ==
                                                          "0" ||
                                                      roomController
                                                              .nitController
                                                              .text ==
                                                          "") {
                                                    roomController.isnightError
                                                        .value = true;
                                                  } else {
                                                    print("worked");
                                                    roomController
                                                            .newCheckinDate
                                                            .value =
                                                        roomController
                                                            .checkInDate.value;
                                                    roomController
                                                            .newCheckoutDate
                                                            .value =
                                                        roomController
                                                            .checkOutDate.value;
                                                    roomController.isnightError
                                                        .value = false;
                                                    roomController.isDateShown
                                                        .value = true;

                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color:
                                                          ColorConstant.white,
                                                      fontSize: 14),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                      color: ColorConstant.lightBlue2,
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
                                                    .newCheckinDate.value !=
                                                "" &&
                                            roomController
                                                    .newCheckoutDate.value !=
                                                "" &&
                                            roomController
                                                    .isDateShown.value ==
                                                true
                                        ? Text(
                                            '${roomController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${roomController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                            style: TextStyle(
                                                color: ColorConstant.lightBlue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          )
                                        : acController
                                                        .newCheckinDate.value !=
                                                    "" &&
                                                acController.newCheckoutDate
                                                        .value !=
                                                    "" &&
                                                acController
                                                        .isDateShown.value ==
                                                    true
                                            ? Text(
                                                '${acController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.lightBlue,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              )
                                            : Icon(
                                                Icons.arrow_drop_down,
                                                color: ColorConstant.lightBlue,
                                                size: 28,
                                              ),
                                  ))
                            ],
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => GuestDetail2(
                                roomController: roomController,
                                acController: acController,
                                adultCounts: adultCount!,
                                childCounts: childCount!,
                                childAgeLists: childAgeList));
                            // roomshowBottomSheet(
                            //     context,
                            //     roomController,
                            //     acController,
                            //     adultCount!,
                            //     childCount!,
                            //     childAgeList);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
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
                                  () => roomController.isSubLoading.value ==
                                          false
                                      ? Text(
                                          "${roomController.roomCount.value} Rooms - ${roomController.guestTotal} Guests",
                                          style: TextStyle(
                                              color: ColorConstant.lightBlue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        )
                                      : acController.isSubLoading.value == false
                                          ? Text(
                                              "${acController.roomCount.value} Rooms - ${acController.guestTotal} Guests",
                                              style: TextStyle(
                                                  color:
                                                      ColorConstant.lightBlue,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            )
                                          : Icon(
                                              Icons.arrow_drop_down,
                                              color: ColorConstant.lightBlue,
                                              size: 28,
                                            ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 23, right: 23, top: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                          style: TextStyle(
                              color: ColorConstant.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(
                        "The Jianguo Hotel Qianmen is located near Tiantan Park, just a 10-minute walk from the National Center for the Performing Arts and Tian'anmen Square. Built in 1956 it has old school charm and many rooms still feature high, crown-molded ceilings. A 2012 renovation brought all rooms and services up to modern day scratch and guestrooms come equipped with free Wi-Fi and all the usual amenities required for a comfortable stay.",
                        style: TextStyle(
                            fontSize: 13), //  style: TextStyle(fontSize: 13),
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
                      SizedBox(
                        height: 16,
                      ),
                      Text("Amenities",
                          style: TextStyle(
                              color: ColorConstant.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                          padding: EdgeInsets.only(bottom: 60),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Row(
                                  children: [
                                    Icon(
                                      amIons[index],
                                      color: ColorConstant.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(amTitle[index],
                                        style: TextStyle(fontSize: 13))
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<Map<String, String>> getEnteredForm(
  //     AccomodationController acController, RoomController2 roomController) {
  //   List<Map<String, String>> dataList = [];
  //   var length = roomController.guestTotal.value != 0
  //       ? roomController.guestTotal.value
  //       : acController.guestTotal.value != 0
  //           ? acController.guestTotal.value
  //           : 1;

  //   for (int i = 0; i < length; i++) {
  //     Map<String, String> data = {
  //       "Courtesy": roomController.selectedcourtesy[i],
  //       'First Name': controllersList[i][0].text,
  //       'Middle Name': controllersList[i][1].text,
  //       'Last Name': controllersList[i][2].text,
  //       'E-mail': controllersList[i][3].text,
  //       'Contact No.': controllersList[i][4].text,
  //       'Passport No.': controllersList[i][5].text,
  //       'LOP': controllersList[i][6].text,
  //     };

  //     dataList.add(data);
  //   }

  //   return dataList;
  // }
}
