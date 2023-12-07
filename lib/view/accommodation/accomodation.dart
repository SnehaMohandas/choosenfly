import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/accommodation/guest_detail1.dart';
import 'package:choose_n_fly/view/room_detail/roomdetails.dart';
import 'package:choose_n_fly/view/room_detail/roomdetails2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccommodationScreen extends StatelessWidget {
  AccommodationScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var acController = Get.put(AccomodationController());
  var childAgeList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //  Get.delete<AccomodationController>();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 82,
          leading: IconButton(
              onPressed: () {
                // Get.delete<AccomodationController>();
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            'Accommodation',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)))),
        ),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 7),
                child: CustomDropdown.search(
                  closedBorder: Border.all(color: ColorConstant.grey),
                  hintBuilder: (context, hint) {
                    return Text("Select Native Country",
                        style: TextingStyle.font14normalLb);
                  },
                  items: acController.native.map((item) {
                    return item[0];
                  }).toList(),
                  excludeSelected: false,
                  onChanged: (value) {
                    acController.isNativeNotSelected.value = false;
                    print('changing value to: $value');
                    List<String> selectedNative = acController.native
                        .firstWhere((item) => item[0] == value);
                    acController.onNatSelected(selectedNative[1]);
                  },
                ),
              ),
              Obx(() => acController.isNativeNotSelected.value == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text("Please select an option",
                          style: TextStyle(
                              color: ColorConstant.red, fontSize: 13)),
                    )
                  : SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: CustomDropdown.search(
                  canCloseOutsideBounds: false,
                  closedBorder: Border.all(color: ColorConstant.grey),
                  hintBuilder: (context, hint) {
                    return Text("Select Destination Country",
                        style: TextingStyle.font14normalLb);
                  },
                  items: acController.destination.map((item) {
                    return item[0];
                  }).toList(),
                  excludeSelected: false,
                  onChanged: (value) {
                    acController.isDestNotSelected.value = false;
                    print('changing value to: $value');
                    List<String> selectedDestination = acController.destination
                        .firstWhere((item) => item[0] == value);
                    acController.onDesSelected(selectedDestination[1]);
                  },
                ),
              ),
              Obx(() => acController.isDestNotSelected.value == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text("Please select an option",
                          style: TextStyle(
                              color: ColorConstant.red, fontSize: 13)),
                    )
                  : SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 7),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Check in: ",
                                          style: TextStyle(
                                              color: ColorConstant.black,
                                              fontSize: 14)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          acController.selectCheckin(context);
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Obx(
                                                  () =>
                                                      acController.checkInDate
                                                                  .value ==
                                                              ""
                                                          ? Text(
                                                              "select date",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )
                                                          : Text(
                                                              acController
                                                                  .checkInDate
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            ),
                                                ),
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
                                                      BorderRadius.circular(10),
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
                                        () => acController
                                                    .ischeckInError.value ==
                                                true
                                            ? Text("please select checkin date",
                                                style: TextStyle(
                                                    color: ColorConstant.red,
                                                    fontSize: 10))
                                            : SizedBox(),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text("Check out: ",
                                          style: TextStyle(
                                              color: ColorConstant.black,
                                              fontSize: 14)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          acController.selectCheckout(context);
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Obx(
                                                  () =>
                                                      acController.checkOutDate
                                                                  .value ==
                                                              ""
                                                          ? Text(
                                                              "select date",
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            )
                                                          : Text(
                                                              acController
                                                                  .checkOutDate
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .liteBlack,
                                                                  fontSize: 12),
                                                            ),
                                                ),
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
                                                      BorderRadius.circular(10),
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
                                        () => acController
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text("Nights:",
                                          style: TextStyle(
                                              color: ColorConstant.black,
                                              fontSize: 14)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 55),
                                        child: Form(
                                          child: TextFormField(
                                            onChanged: (value) {
                                              print("textflddvall===>${value}");
                                              int nights =
                                                  int.tryParse(value) ?? 0;
                                              acController
                                                  .updateCheckoutDate(nights);
                                            },
                                            controller:
                                                acController.nitController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
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
                                        () => acController.isnightError.value ==
                                                true
                                            ? Text("Atleast select 1 night",
                                                style: TextStyle(
                                                    color: ColorConstant.red,
                                                    fontSize: 10))
                                            : SizedBox(),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
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
                                                          ColorConstant.white)),
                                              onPressed: () {
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
                                                if (acController
                                                        .checkInDate.value ==
                                                    "") {
                                                  acController.ischeckInError
                                                      .value = true;
                                                } else if (acController
                                                        .checkOutDate.value ==
                                                    "") {
                                                  acController.ischeckOutError
                                                      .value = true;
                                                } else if (acController
                                                            .nitController
                                                            .text ==
                                                        "0" ||
                                                    acController.nitController
                                                            .text ==
                                                        "") {
                                                  acController.isnightError
                                                      .value = true;
                                                } else {
                                                  acController.newCheckinDate
                                                          .value =
                                                      acController
                                                          .checkInDate.value;
                                                  acController.newCheckoutDate
                                                          .value =
                                                      acController
                                                          .checkOutDate.value;
                                                  acController.isnightError
                                                      .value = false;
                                                  acController
                                                      .isDateShown.value = true;

                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: ColorConstant.white,
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
                        child: Container(
                          color: Colors.transparent,
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: Text('Date',
                                    style: TextingStyle.font12blue),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Obx(
                                    () => acController.newCheckinDate.value !=
                                                "" &&
                                            acController
                                                    .newCheckoutDate.value !=
                                                "" &&
                                            acController.isDateShown.value ==
                                                true
                                        ? Text(
                                            '${acController.newCheckinDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.newCheckoutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                            style: TextStyle(
                                                color: ColorConstant.lightBlue,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          )
                                        : Icon(
                                            Icons.arrow_drop_down,
                                            color: ColorConstant.lightBlue,
                                            size: 28,
                                          ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      //  Spacer(),
                      VerticalDivider(
                        thickness: 1,
                        color: ColorConstant.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                              () => GuestDetail1(acController: acController));
                          //showBottomSheet(context, acController);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: Text(
                                  'Room & Guests',
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
                                  () => acController.isSubLoading.value == false
                                      ? Text(
                                          "${acController.roomCount.value} Rooms - ${acController.guestTotal} Guests",
                                          style: TextStyle(
                                              color: ColorConstant.lightBlue,
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      if (acController.selectedNative.value == "") {
                        acController.isNativeNotSelected.value = true;
                      }
                      if (acController.selectedDestinaion.value == "") {
                        acController.isDestNotSelected.value = true;
                      } else if (acController.checkInDate.value == "" &&
                              acController.checkOutDate.value == "" &&
                              acController.isDateShown.value == false ||
                          acController.isSubLoading.value == true) {
                        // Get.snackbar("", "",
                        //     duration: Duration(
                        //       seconds: 2,
                        //     ),
                        //     messageText: Text(
                        //         "Please enter date and room details",
                        //         style: TextStyle(
                        //             color: ColorConstant.white,
                        //             fontSize: 16)));
                        Fluttertoast.showToast(
                            msg: "Please enter date and room details");
                      } else {
                        acController.isSearchtapped.value = true;
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: acController.isSearchtapped.value == false
                            ? Text("Search",
                                style: TextStyle(
                                    color: ColorConstant.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                            : Text("Modify Search",
                                style: TextStyle(
                                    color: ColorConstant.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 10),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    //  physics: NeverScrollableScrollPhysics(),
                    //  shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                        mainAxisExtent: 180),
                    itemCount: 10, // Replace with the number of items you have
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                              () => RoomDetails2(
                                    nights: acController.nitController.text,
                                    roomCount: acController.roomCount.value,
                                    adultCount: acController.adultDdnum,
                                    childCount: acController.childDdnum,
                                    childAge: childAgeList,
                                  ),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 108,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.alphacoders.com/108/thumb-1920-1087214.jpg',
                                          ),
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(8.531),
                                    ),
                                  ),
                                  Text(
                                    'Al Wahda',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Thane',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '149AED',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13.65,
                                              color: ColorConstant.lightBlue,
                                            ),
                                          ),
                                          Text(
                                            'night',
                                            style: TextStyle(
                                              color: ColorConstant.lightBlue2,
                                              fontSize: 9,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 11,
                                              color: ColorConstant.orange),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            decoration: BoxDecoration(
                                              color: ColorConstant.orange,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
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
            ],
          ),
        ),
        //),
      ),
    );
  }
}
