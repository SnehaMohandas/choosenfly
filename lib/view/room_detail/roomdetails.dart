import 'package:carousel_slider/carousel_slider.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomDetails extends StatelessWidget {
  RoomDetails(
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

  @override
  Widget build(BuildContext context) {
    // print("roomcountttt===>${roomCount}");
    // print("adulttttcount==>${adultCount}");
    // print("childddcount==>${childCount}");

    // print("childage==>${childAge}");

    var acController = Get.find<AccomodationController>();

    var roomController = Get.put(RoomController(nights ?? "", acController));
    return WillPopScope(
      onWillPop: () async {
        Get.delete<RoomController>();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.delete<RoomController>();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
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
                                                  child: Obx(() => roomController
                                                              .checkInDate
                                                              .value !=
                                                          ''
                                                      ? Text(
                                                          roomController
                                                              .checkInDate.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .liteBlack,
                                                              fontSize: 12),
                                                        )
                                                      : acController.checkInDate
                                                                  .value !=
                                                              ""
                                                          ? Text(
                                                              acController
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
                                                  child: Obx(() => roomController
                                                              .checkOutDate
                                                              .value !=
                                                          ""
                                                      ? Text(
                                                          roomController
                                                              .checkOutDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .liteBlack,
                                                              fontSize: 12),
                                                        )
                                                      : acController
                                                                  .checkOutDate
                                                                  .value !=
                                                              ""
                                                          ? Text(
                                                              acController
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
                                                  if (roomController.checkInDate
                                                              .value ==
                                                          "" &&
                                                      acController.checkInDate
                                                              .value ==
                                                          "") {
                                                    roomController
                                                        .ischeckInError
                                                        .value = true;
                                                  } else if (roomController
                                                              .checkOutDate
                                                              .value ==
                                                          "" &&
                                                      acController.checkOutDate
                                                              .value ==
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
                                    () => roomController.checkInDate.value !=
                                                "" ||
                                            roomController.checkOutDate.value !=
                                                "" ||
                                            roomController.isDateShown.value ==
                                                true
                                        ? Text(
                                            '${roomController.checkInDate.value != "" ? roomController.checkInDate.value.characters.take(6).toString().replaceAll("-", " ") : acController.checkInDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${roomController.checkOutDate.value != "" ? roomController.checkOutDate.value.characters.take(6).toString().replaceAll("-", " ") : acController.checkOutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                            style: TextStyle(
                                                color: ColorConstant.lightBlue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          )
                                        : acController.checkInDate.value !=
                                                    "" &&
                                                acController
                                                        .checkOutDate.value !=
                                                    "" &&
                                                acController
                                                        .isDateShown.value ==
                                                    true
                                            ? Text(
                                                '${acController.checkInDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.checkOutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
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
                            roomshowBottomSheet(
                                context,
                                roomController,
                                acController,
                                roomCount,
                                adultCount!,
                                childCount!,
                                childAgeList);
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
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 14, bottom: 0),
                      child: Text(
                        'Guest Details',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                //guest details column
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 0),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: roomController.guestTotal.value != 0
                            ? roomController.guestTotal.value
                            : acController.guestTotal.value != 0
                                ? acController.guestTotal.value
                                : 1,
                        itemBuilder: (context, index) {
                          roomController.selectedcourtesy.value = List.generate(
                              roomController.guestTotal.value != 0
                                  ? roomController.guestTotal.value
                                  : acController.guestTotal.value != 0
                                      ? acController.guestTotal.value
                                      : 1,
                              (index) =>
                                  "1"); // Assuming a maximum of 10 guests
                          if (controllersList.length <= index) {
                            controllersList.add([
                              TextEditingController(), // Controller for First Name
                              TextEditingController(), // Controller for Middle Name
                              TextEditingController(), // Controller for Last Name
                              TextEditingController(), // Controller for E-mail
                              TextEditingController(), // Controller for Contact No.
                              TextEditingController(), // Controller for Passport No.
                              TextEditingController(), // Controller for LOP
                            ]);
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 26, right: 26, top: 15, bottom: 6),
                                child: Text(
                                  "Guest No: ${index + 1}",
                                  style: TextStyle(
                                      color: ColorConstant.lightBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 43,
                                            width: 65,
                                            decoration: BoxDecoration(
                                              // border: Border.all(color: Colors.grey.shade300),
                                              // borderRadius: BorderRadius.circular(10),
                                              color: Colors.grey[200],
                                            ),
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(left: 6),
                                                  border: InputBorder.none),
                                              value: roomController
                                                              .selectedcourtesy[
                                                          index] ==
                                                      []
                                                  ? null
                                                  : roomController
                                                      .selectedcourtesy[index],
                                              items: roomController.courtesy
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                    value: item[1],
                                                    child: Text(item[0]));
                                              }).toList(),
                                              onChanged: (v) {
                                                roomController.selectedcourtesy[
                                                    index] = v.toString();
                                                // roomController.oncourtesySelected(
                                                //     v.toString());
                                                // print(roomController
                                                //     .selectedcourtesy.value);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: controllersList[index]
                                                  [0],
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: ColorConstant
                                                              .grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 6,
                                                          bottom: 6,
                                                          left: 14,
                                                          right: 14),
                                                  hintStyle: TextingStyle
                                                      .font14normalLb,
                                                  hintText: 'First Name'),
                                              validator: (value) {
                                                if (value == "") {
                                                  return "This field cannot be empty";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][1],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'Middle Name'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][2],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'Last Name'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][3],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'E-mail'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][4],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'Contact No.'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][5],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'Passport No.'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 26, right: 26, top: 8),
                                      child: TextFormField(
                                        controller: controllersList[index][6],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorConstant.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            contentPadding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 6,
                                                left: 14,
                                                right: 14),
                                            hintStyle:
                                                TextingStyle.font14normalLb,
                                            hintText: 'LOP'),
                                        validator: (value) {
                                          if (value == "") {
                                            return "This field cannot be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),

                                    // roomController.guestTotal.value != 1 &&
                                    //         roomController.guestTotal.value != 0
                                    //     ? IconButton(
                                    //         onPressed: () {},
                                    //         icon: Icon(Icons.add_circle_outline),
                                    //         color: ColorConstant.primaryColor,
                                    //       )
                                    //     : acController.guestTotal.value != 1 &&
                                    //             acController.guestTotal.value != 0
                                    //         ? IconButton(
                                    //             onPressed: () {},
                                    //             icon: Icon(Icons.add_circle_outline),
                                    //             color: ColorConstant.primaryColor,
                                    //           )
                                    //         : SizedBox())
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                // Obx(() {
                //   if (roomController.guestTotal.value == 0) {
                //     if (acController.guestTotal.value != 0 &&
                //         acController.guestTotal.value != 1) {
                //       return IconButton(
                //         onPressed: () {
                //           if (roomController.itemLimit.value !=
                //               acController.guestTotal.value) {
                //             roomController.itemLimit.value++;
                //           }
                //           // acController.guestTotal.value;
                //         },
                //         icon: Icon(Icons.add_circle_outline),
                //         color: ColorConstant.primaryColor,
                //       );
                //     } else if (roomController.guestTotal.value == 1) {
                //       return SizedBox();
                //     } else {
                //       return SizedBox();
                //     }
                //   } else if (roomController.guestTotal.value != 1 &&
                //       roomController.guestTotal.value != 0) {
                //     return IconButton(
                //       onPressed: () {
                //         if (roomController.itemLimit.value !=
                //             roomController.guestTotal.value) {
                //           roomController.itemLimit.value++;
                //         }
                //         //roomController.guestTotal.value;
                //       },
                //       icon: Icon(Icons.add_circle_outline),
                //       color: ColorConstant.orange,
                //     );
                //   } else {
                //     return SizedBox();
                //   }
                //   //return Text("error");
                // }),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 10, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        var datalist =
                            getEnteredForm(acController, roomController);
                        print("datlisttt===>${datalist}");
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.primaryColor,
                      ),
                      child: Center(
                          child: Text(
                        "Book and Confirm",
                        style: TextStyle(
                            color: ColorConstant.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var rooms = [1, 2, 3, 4];
  var adults = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  var children = [0, 1, 2, 3, 4, 5];
  final List ageController = [TextEditingController()];
  var childAgeList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> allAgeOrgs = [];
  String? mappedAges;

  roomshowBottomSheet(
      BuildContext context,
      RoomController roomController,
      AccomodationController acController,
      roomCounts,
      List adultCounts,
      List childCounts,
      List childAgeLists) async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          print(adultCounts);
          if (roomController.roomCount.value != "") {
            print(roomController.roomCount.value);
          }
          if (roomCounts == "") {
            print(null);
          } else {
            print(roomCounts);
          }
          //   print(roomCount);
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 14),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 25, bottom: 0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Text(
                          "Rooms",
                          style: TextStyle(
                            color: ColorConstant.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      //room dropdown
                      Obx(
                        () => DropdownButtonFormField<String>(
                            value: roomController.roomCount.value != ""
                                ? roomController.roomCount.value
                                // : roomCounts != ""
                                //     ? roomCounts.toString()
                                // : acController.roomCount.value != ""
                                //     ? acController.roomCount.value
                                : null,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an option';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                // labelText: "Rooms",
                                // labelStyle: TextStyle(
                                //     color: ColorConstant.liteBlack, fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorConstant.lightBlue2,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorConstant.lightBlue2,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                            items: rooms.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.toString(),
                                child: Text(item.toString()),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              roomController.selectedDdindex.clear();

                              roomController.selectedChildIndex.value = "";
                              roomController.selectedDdindex = [];
                              roomController.childDdnum.value = [];
                              roomController.adultDdnum.value = [];
                              roomController.ageTextControllers = [];

                              roomController.roomCount.value =
                                  newValue.toString();
                              // print(roomController.roomCount.value);
                              for (int i = 0;
                                  i <
                                      int.parse(roomController.roomCount.value
                                          .toString());
                                  i++) {
                                roomController.selectedDdindex.add("false");
                                roomController.childDdnum.value.add(0);
                                roomController.adultDdnum.value.add(0);
                                roomController.ageTextControllers.add([]);
                              }
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      DottedLine(
                        direction: Axis.horizontal,
                        lineThickness: 0.5,
                        dashColor: ColorConstant.lightBlue2,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      // Obx(
                      //   () =>
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: roomController.roomCount.value != ""
                                  ? int.parse(roomController.roomCount.value)
                                  // : roomCounts != ""
                                  //     ? int.parse(roomCounts.toString())
                                  // : acController.roomCount.value != ""
                                  //     ? int.parse(acController.roomCount.value)
                                  : 0,
                              itemBuilder: (context, index) {
                                // if (acController.adultDdnum.value.isNotEmpty) {
                                //   roomController.adultDdnum.value = [];

                                //   print("not null");
                                //   print(acController.roomCount.value);
                                //   for (int i = 0;
                                //       i <
                                //           int.parse(acController.roomCount.value
                                //               .toString());
                                //       i++) {
                                //     roomController.adultDdnum.value.add(0);
                                //     roomController.adultDdnum.value =
                                //         acController.adultDdnum.value;
                                //   }
                                //   print(
                                //       "adulllllllttt${roomController.adultDdnum.value}");
                                //   print("${roomController.adultDdnum.length}");
                                //   print("${roomController.adultDdnum[index]}");
                                //   print("${acController.adultDdnum.value}");
                                // } else {
                                //   print(
                                //       "lngthh${roomController.adultDdnum.length}");
                                //   print(
                                //       "index${roomController.adultDdnum.value}");
                                // }
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        //adult dropdown
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print("tt");
                                                    print(roomController
                                                        .adultDdnum
                                                        .value
                                                        .length);
                                                    print(roomController
                                                        .adultDdnum
                                                        .value[index]);
                                                  },
                                                  child: Text(
                                                    "Adults",
                                                    style: TextStyle(
                                                      color:
                                                          ColorConstant.black,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => DropdownButtonFormField<
                                                        String>(
                                                    //  value: null,
                                                    value: roomController
                                                                    .adultDdnum
                                                                    .value
                                                                    .length ==
                                                                0 ||
                                                            roomController
                                                                        .adultDdnum
                                                                        .value[
                                                                    index] ==
                                                                0
                                                        ? null
                                                        : roomController
                                                            .adultDdnum
                                                            .value[index],
                                                    //===============

                                                    // value: roomController
                                                    //             .adultDdnum
                                                    //             .value
                                                    //             .length==0 ||
                                                    //         roomController
                                                    //                     .adultDdnum
                                                    //                     .value[
                                                    //                 index] ==
                                                    //             0
                                                    //     ? roomController
                                                    //         .adultDdnum
                                                    //         .value[index]
                                                    //     : adultCounts.isNotEmpty
                                                    //         ? adultCounts[index]
                                                    //             .toString()
                                                    //         : null,
                                                    //=============
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Please select an option';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        // labelText: "Adults",
                                                        // labelStyle:
                                                        //     TextStyle(
                                                        //         color: ColorConstant
                                                        //             .liteBlack,
                                                        //         fontSize: 14),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: ColorConstant
                                                                      .lightBlue2,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(10)),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius: BorderRadius.circular(10))),
                                                    items: adults.map((item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item.toString(),
                                                        child: Text(
                                                            item.toString()),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      roomController.adultDdnum[
                                                          index] = newValue;
                                                    }),
                                              ),
                                            ],
                                          ),
                                          // ),
                                        ),
                                        //),

                                        SizedBox(
                                          width: 10,
                                        ),
                                        //children dropdown
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4),
                                                child: Text(
                                                  "Children",
                                                  style: TextStyle(
                                                    color: ColorConstant.black,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => DropdownButtonFormField<
                                                        String>(
                                                    value: roomController
                                                                    .childDdnum
                                                                    .value
                                                                    .length ==
                                                                0 ||
                                                            roomController
                                                                        .childDdnum
                                                                        .value[
                                                                    index] ==
                                                                0
                                                        ? null
                                                        : roomController
                                                            .childDdnum
                                                            .value[index],
                                                    // value: roomController
                                                    //                 .childDdnum
                                                    //                 .value
                                                    //                 .length !=
                                                    //             0 ||
                                                    //         roomController
                                                    //                     .childDdnum
                                                    //                     .value[
                                                    //                 index] !=
                                                    //             0
                                                    //     ? roomController
                                                    //         .childDdnum
                                                    //         .value[index]
                                                    //     : childCounts.isNotEmpty
                                                    //         ? childCounts[index]
                                                    //             .toString()
                                                    //         : null,

                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        // labelText: "Children",
                                                        // labelStyle: TextStyle(
                                                        //     color: ColorConstant
                                                        //         .liteBlack,
                                                        //     fontSize: 14),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: ColorConstant
                                                                      .lightBlue2,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(10)),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: ColorConstant
                                                                  .lightBlue2,
                                                            ),
                                                            borderRadius: BorderRadius.circular(10))),
                                                    items: children.map((item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item.toString(),
                                                        child: Text(
                                                            item.toString()),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      roomController
                                                              .selectedChildIndex
                                                              .value =
                                                          index.toString();

                                                      roomController
                                                              .selectedDdindex[
                                                          index] = "true";

                                                      roomController.childDdnum[
                                                          index] = newValue;

                                                      print(roomController
                                                          .ageTextControllers);
                                                      print(roomController
                                                          .childDdnum[index]);
                                                      print(index);
                                                      print(roomController
                                                          .ageTextControllers);

                                                      //"""""""""""''''"

                                                      roomController
                                                          .ageTextControllers[
                                                              index]
                                                          .clear();
                                                      roomController
                                                                  .ageTextControllers[
                                                              index] =
                                                          List.generate(
                                                              int.parse(
                                                                  roomController
                                                                      .childDdnum[
                                                                          index]
                                                                      .toString()),
                                                              (index) =>
                                                                  TextEditingController());

                                                      print(
                                                          "allllll=>>>${roomController.ageTextControllers}");
                                                      print(
                                                          "specificcccc===>${roomController.ageTextControllers[index]}");
                                                    }),
                                              ),

                                              //children's age
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Obx(() => roomController
                                                    .selectedChildIndex.value ==
                                                index.toString() ||
                                            roomController
                                                    .selectedDdindex[index] ==
                                                "true"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4),
                                                child: Obx(
                                                  () => roomController
                                                              .childDdnum
                                                              .value[index] ==
                                                          "0"
                                                      ? SizedBox()
                                                      : GestureDetector(
                                                          onTap: () {
                                                            // var ageorg = [];

                                                            // for (int i = 0;
                                                            //     i <
                                                            //         roomController
                                                            //             .ageTextControllers[
                                                            //                 index]
                                                            //             .length;
                                                            //     i++) {
                                                            //   ageorg.add(
                                                            //       roomController
                                                            //           .ageTextControllers[
                                                            //               index]
                                                            //               [i]
                                                            //           .text);
                                                            // }
                                                            // allAgeOrgs
                                                            //     .add(ageorg);
                                                            // print(allAgeOrgs);
                                                          },
                                                          child: Text(
                                                            "Children's Age",
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .black,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              GridView.builder(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 10,
                                                          mainAxisExtent:
                                                              roomController
                                                                          .isValidate
                                                                          .value ==
                                                                      true
                                                                  ? 70
                                                                  : 50,
                                                          mainAxisSpacing: 10),
                                                  itemCount: int.parse(
                                                      roomController
                                                          .childDdnum[index]
                                                          .toString()),
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemBuilder:
                                                      (context, childIndex) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      // padding: const EdgeInsets.only(
                                                      //     right: 150, top: 10),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        controller: roomController
                                                                .ageTextControllers[
                                                            index][childIndex],
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          3,
                                                                      horizontal:
                                                                          14),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: ColorConstant
                                                                        .lightBlue2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: ColorConstant
                                                                        .lightBlue2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value == "") {
                                                            roomController
                                                                .isValidate
                                                                .value = true;
                                                            return "Please enter age";
                                                          } else if (int.parse(
                                                                  value) >
                                                              10) {
                                                            roomController
                                                                .isValidate
                                                                .value = true;
                                                            return "Age must be below 10";
                                                          } else if (int.parse(
                                                                  value) <
                                                              1) {
                                                            roomController
                                                                .isValidate
                                                                .value = true;
                                                            return "Incorrect age";
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          )
                                        : const SizedBox()),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: DottedLine(
                                        direction: Axis.horizontal,
                                        lineThickness: 0.5,
                                        dashColor: ColorConstant.lightBlue2,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      //),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstant.white)),
                                onPressed: () {
                                  if (roomController.isSubLoading.value ==
                                      true) {
                                    print("object");
                                    roomController.roomCount.value = "";
                                    roomController.selectedDdindex.clear();

                                    roomController.selectedChildIndex.value =
                                        "";
                                    roomController.selectedDdindex = [];
                                    roomController.childDdnum.value = [];
                                    roomController.adultDdnum.value = [];
                                    roomController.ageTextControllers = [];
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                      color: ColorConstant.primaryColor,
                                      fontSize: 14),
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstant.primaryColor)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    roomController.isSubLoading.value = true;
                                    //==========

                                    // childAgeList.clear();
                                    //=============
                                    allAgeOrgs.clear();
                                    num adultSum = roomController.adultDdnum
                                        .fold(0, (previous, current) {
                                      if (current is num) {
                                        return previous + current;
                                      } else if (current is String) {
                                        // Attempt to parse the string to a num and provide a default value of 0 if parsing fails
                                        return previous +
                                            (num.tryParse(current) ?? 0);
                                      } else {
                                        return previous;
                                      }
                                    });

                                    print(
                                        'Sum of the list: ${adultSum.toString()}');
                                    num childSum = roomController.childDdnum
                                        .fold(0, (previous, current) {
                                      if (current is num) {
                                        return previous + current;
                                      } else if (current is String) {
                                        // Attempt to parse the string to a num and provide a default value of 0 if parsing fails
                                        return previous +
                                            (num.tryParse(current) ?? 0);
                                      } else {
                                        return previous;
                                      }
                                    });
                                    print(
                                        'Sum of the list: ${childSum.toString()}');
                                    roomController.guestTotal.value =
                                        adultSum.toInt() + childSum.toInt();
                                    print(
                                        "totallll${roomController.guestTotal}");
                                    print(
                                        "room count${roomController.roomCount.value}");

                                    print(
                                        "adult count list ${roomController.adultDdnum}");
                                    print(
                                        "child count list${roomController.childDdnum}");
                                    print(roomController.ageTextControllers);
                                    // Map<String, String> data;

                                    for (int i = 0;
                                        i <
                                            int.parse(roomController
                                                .roomCount.value
                                                .toString());
                                        i++) {
                                      for (int j = 0;
                                          j <
                                              roomController
                                                  .ageTextControllers![i]
                                                  .length;
                                          j++) {
                                        if (roomController
                                            .ageTextControllers[i].isNotEmpty) {
                                          mappedAges = roomController
                                              .ageTextControllers[i]
                                              .map((e) => e.text)
                                              .join(', ');
                                        }
                                      }
                                      if (roomController
                                          .ageTextControllers[i].isNotEmpty) {
                                        allAgeOrgs.add(mappedAges!);
                                      }
                                    }
                                    if (allAgeOrgs.isEmpty ||
                                        allAgeOrgs == []) {
                                      print("object");
                                    } else {
                                      print(allAgeOrgs);
                                    }

                                    //for age in one list
                                    //===================

                                    // for (int i = 0;
                                    //     i <
                                    //         roomController
                                    //             .ageTextControllers!.length;
                                    //     i++) {
                                    //   for (int j = 0;
                                    //       j <
                                    //           roomController
                                    //               .ageTextControllers![i].length;
                                    //       j++) {
                                    //     childAgeList.add(roomController
                                    //         .ageTextControllers[i][j].text);
                                    //     print(
                                    //         "Room $i, Child $j: ${roomController.ageTextControllers![i][j].text}");
                                    //   }

                                    //   // }
                                    // }
                                    // print(childAgeList.toString());
                                    //========================
                                    var childorglist = getEnteredData(
                                      acController,
                                      roomController,
                                    );
                                    print(childorglist);

                                    roomController.isSubLoading.value = false;

                                    Get.back();
                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: ColorConstant.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<Map<String, String>> getEnteredData(
      AccomodationController acController, RoomController roomController) {
    List<Map<String, String>> dataList = [];
    var length = roomController.roomCount.value != ""
        ? roomController.roomCount.value
        : acController.roomCount.value != ""
            ? acController.roomCount.value
            : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      print("this is childcount${roomController.childDdnum[i].toString()}");
      Map<String, String> data = {
        "room no": roomController.roomCount.value != ""
            ? (i + 1).toString()
            : acController.roomCount.value != ""
                ? (i + 1).toString()
                : 0.toString(),
        'adult': roomController.adultDdnum[i] != 0
            ? roomController.adultDdnum[i]
            : acController.adultDdnum[i] != 0
                ? acController.adultDdnum[i]
                : 0.toString(),
        'children': roomController.childDdnum[i] == 0
            ? 0.toString()
            : roomController.childDdnum[i] != 0
                ? roomController.childDdnum[i]
                : acController.childDdnum[i] != 0
                    ? acController.childDdnum[i]
                    : 0.toString(),
        if (allAgeOrgs.isNotEmpty) 'children age': allAgeOrgs[i].toString()
      };

      dataList.add(data);
    }

    return dataList;
  }

  List<Map<String, String>> getEnteredForm(
      AccomodationController acController, RoomController roomController) {
    List<Map<String, String>> dataList = [];
    var length = roomController.guestTotal.value != 0
        ? roomController.guestTotal.value
        : acController.guestTotal.value != 0
            ? acController.guestTotal.value
            : 1;

    for (int i = 0; i < length; i++) {
      Map<String, String> data = {
        "Courtesy": roomController.selectedcourtesy[i],
        'First Name': controllersList[i][0].text,
        'Middle Name': controllersList[i][1].text,
        'Last Name': controllersList[i][2].text,
        'E-mail': controllersList[i][3].text,
        'Contact No.': controllersList[i][4].text,
        'Passport No.': controllersList[i][5].text,
        'LOP': controllersList[i][6].text,
      };

      dataList.add(data);
    }

    return dataList;
  }
}
