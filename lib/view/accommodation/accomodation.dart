import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/room_detail/roomdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';

class AccommodationScreen extends StatelessWidget {
  AccommodationScreen({super.key});
  //final TextEditingController nitController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var acController = Get.put(AccomodationController());
    return WillPopScope(
      onWillPop: () async {
        Get.delete<AccomodationController>();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 82,
          leading: IconButton(
              onPressed: () {
                Get.delete<AccomodationController>();
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
        body: Obx(
          () => SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 7),
                    child: DropdownButtonFormField(
                        value: acController.selectedNative.value == ""
                            ? null
                            : acController.selectedNative.value,
                        decoration: InputDecoration(
                            hintText: 'Select Native Country ',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            hintStyle: TextingStyle.font14normalLb,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10))),
                        items: acController.native.map((item) {
                          return DropdownMenuItem(
                              value: item[1], child: Text(item[0]));
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (v) {
                          acController.onNatSelected(v.toString());
                          print(acController.selectedNative.value);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 7),
                    child: DropdownButtonFormField(
                        value: acController.selectedDestinaion.value == ""
                            ? null
                            : acController.selectedDestinaion.value,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            hintText: 'Select Destination Country',
                            hintStyle: TextingStyle.font14normalLb,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10))),
                        items: acController.destination.map((item) {
                          return DropdownMenuItem(
                              value: item[1], child: Text(item[0]));
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (v) {
                          acController.onDesSelected(v.toString());
                          print(acController.selectedDestinaion.value);
                        }),
                  ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Check in: ",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color:
                                                          ColorConstant.black,
                                                      fontSize: 14)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              acController
                                                  .selectCheckin(context);
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
                                                    child: Obx(
                                                      () => acController
                                                                  .checkInDate
                                                                  .value ==
                                                              ""
                                                          ? Text(
                                                              "select date",
                                                              style: GoogleFonts
                                                                  .plusJakartaSans(
                                                                      color: ColorConstant
                                                                          .liteBlack,
                                                                      fontSize:
                                                                          12),
                                                            )
                                                          : Text(
                                                              acController
                                                                  .checkInDate
                                                                  .value
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .plusJakartaSans(
                                                                      color: ColorConstant
                                                                          .liteBlack,
                                                                      fontSize:
                                                                          12),
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
                                                          offset: const Offset(
                                                              2, 8),
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
                                            () => acController
                                                        .ischeckInError.value ==
                                                    true
                                                ? Text(
                                                    "please select checkin date",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            color: ColorConstant
                                                                .red,
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
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color:
                                                          ColorConstant.black,
                                                      fontSize: 14)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              acController
                                                  .selectCheckout(context);
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
                                                    child: Obx(
                                                      () => acController
                                                                  .checkOutDate
                                                                  .value ==
                                                              ""
                                                          ? Text(
                                                              "select date",
                                                              style: GoogleFonts
                                                                  .plusJakartaSans(
                                                                      color: ColorConstant
                                                                          .liteBlack,
                                                                      fontSize:
                                                                          12),
                                                            )
                                                          : Text(
                                                              acController
                                                                  .checkOutDate
                                                                  .value
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .plusJakartaSans(
                                                                      color: ColorConstant
                                                                          .liteBlack,
                                                                      fontSize:
                                                                          12),
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
                                                          offset: const Offset(
                                                              2, 8),
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
                                            () => acController
                                                        .ischeckOutError.value ==
                                                    true
                                                ? Text(
                                                    "please select checkout date",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            color: ColorConstant
                                                                .red,
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
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color:
                                                          ColorConstant.black,
                                                      fontSize: 14)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 55),
                                            child: Form(
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  print(
                                                      "textflddvall===>${value}");
                                                  int nights =
                                                      int.tryParse(value) ?? 0;
                                                  acController
                                                      .updateCheckoutDate(
                                                          nights);
                                                },
                                                controller:
                                                    acController.nitController,
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
                                                            BorderRadius
                                                                .circular(14))),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => acController
                                                        .isnightError.value ==
                                                    true
                                                ? Text("Atleast select 1 night",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            color: ColorConstant
                                                                .red,
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
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
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
                                                    if (acController.checkInDate
                                                            .value ==
                                                        "") {
                                                      acController
                                                          .ischeckInError
                                                          .value = true;
                                                    } else if (acController
                                                            .checkOutDate
                                                            .value ==
                                                        "") {
                                                      acController
                                                          .ischeckOutError
                                                          .value = true;
                                                    } else if (acController
                                                                .nitController
                                                                .text ==
                                                            "0" ||
                                                        acController
                                                                .nitController
                                                                .text ==
                                                            "") {
                                                      acController.isnightError
                                                          .value = true;
                                                    } else {
                                                      acController.isnightError
                                                          .value = false;
                                                      acController.isDateShown
                                                          .value = true;

                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Text(
                                                    "Submit",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            color: ColorConstant
                                                                .white,
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
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 10),
                                    child: Text('Date',
                                        style: TextingStyle.font12blue),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Obx(
                                        () => acController.checkInDate.value !=
                                                    "" &&
                                                acController
                                                        .checkOutDate.value !=
                                                    "" &&
                                                acController
                                                        .isDateShown.value ==
                                                    true
                                            ? Text(
                                                '${acController.checkInDate.value.characters.take(6).toString().replaceAll("-", " ")} - ${acController.checkOutDate.value.characters.take(6).toString().replaceAll("-", " ")}',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        color: ColorConstant
                                                            .lightBlue,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                              showBottomSheet(context, acController);
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 10),
                                    child: Text(
                                      'Room & Guests',
                                      style: GoogleFonts.plusJakartaSans(
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
                                      () => acController.isSubLoading.value ==
                                              false
                                          ? Text(
                                              "${acController.roomCount.value} Rooms - ${acController.guestTotal} Guests",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: ColorConstant
                                                          .lightBlue,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                          // Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            acController.isSearchtapped.value = true;
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: acController.isSearchtapped.value == false
                                ? Text("Search",
                                    style: GoogleFonts.plusJakartaSans(
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                                : Text("Modify Search",
                                    style: GoogleFonts.plusJakartaSans(
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 0, bottom: 10),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.9,
                          mainAxisExtent: 180),
                      itemCount:
                          10, // Replace with the number of items you have
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RoomDetails();
                              },
                            ));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            elevation: 1,
                            child: Container(
                              // height: 175,
                              // width: 151,
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
                                        //color: Colors.yellow,
                                      ),
                                    ),
                                    Text(
                                      'Al Wahda',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Thane',
                                      style: GoogleFonts.montserrat(
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
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.65,
                                                color: ColorConstant.lightBlue,
                                              ),
                                            ),
                                            Text(
                                              'night',
                                              style: GoogleFonts.montserrat(
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
                                              // width: MediaQuery.of(context)
                                              //         .size
                                              //         .width *
                                              //     0.1,
                                              decoration: BoxDecoration(
                                                color: ColorConstant.orange,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    '4.3/5',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          ColorConstant.white,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  var rooms = [1, 2, 3, 4];
  var adults = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  var children = [1, 2, 3, 4, 5];
  final List ageController = [TextEditingController()];
  var childAgeList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showBottomSheet(
      BuildContext context, AccomodationController acController) async {
    showModalBottomSheet(
        //  useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 14),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 25, bottom: 0),
                child: Form(
                  key: _formKey,
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
                          style: GoogleFonts.plusJakartaSans(
                            color: ColorConstant.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      //room dropdown
                      Obx(
                        () => DropdownButtonFormField<String>(
                            value: acController.roomCount.value == ""
                                ? null
                                : acController.roomCount.value,
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
                                // labelStyle: GoogleFonts.plusJakartaSans(
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
                              acController.selectedDdindex.clear();
                              // acController.childCount.value = "";
                              // acController.adultCount.value = "";

                              acController.selectedChildIndex.value = "";
                              acController.selectedDdindex = [];
                              acController.childDdnum.value = [];
                              acController.adultDdnum.value = [];
                              acController.ageTextControllers = [];

                              acController.roomCount.value =
                                  newValue.toString();
                              print(acController.roomCount.value);
                              for (int i = 0;
                                  i <
                                      int.parse(acController.roomCount.value
                                          .toString());
                                  i++) {
                                acController.selectedDdindex.add("false");
                                acController.childDdnum.value.add(0);
                                acController.adultDdnum.value.add(0);
                                acController.ageTextControllers.add([]);
                                // acController.ageController.value
                                //     .add([TextEditingController()]);
                              }
                              // print("chld counttt${acController.childCount.value}");
                              // print(
                              //     "adult counttt${acController.adultCount.value}");
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
                              itemCount: acController.roomCount.value != ""
                                  ? int.parse(acController.roomCount.value)
                                  : 0,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        //adult dropdown
                                        Obx(
                                          () => Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6,
                                                      vertical: 4),
                                                  child: Text(
                                                    "Adults",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                      color:
                                                          ColorConstant.black,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                                DropdownButtonFormField<String>(
                                                    value: acController
                                                                    .adultDdnum
                                                                    .value
                                                                    .length ==
                                                                0 ||
                                                            acController.adultDdnum
                                                                        .value[
                                                                    index] ==
                                                                0
                                                        ? null
                                                        : acController
                                                            .adultDdnum
                                                            .value[index],
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
                                                        //     GoogleFonts.plusJakartaSans(
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
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
                                                      acController.adultDdnum[
                                                          index] = newValue;
                                                    }),
                                              ],
                                            ),
                                            // ),
                                          ),
                                        ),

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
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    color: ColorConstant.black,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => DropdownButtonFormField<
                                                        String>(
                                                    value: acController
                                                                    .childDdnum
                                                                    .value
                                                                    .length ==
                                                                0 ||
                                                            acController.childDdnum
                                                                        .value[
                                                                    index] ==
                                                                0
                                                        ? null
                                                        : acController
                                                            .childDdnum
                                                            .value[index],
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4),
                                                        // labelText: "Children",
                                                        // labelStyle: GoogleFonts.plusJakartaSans(
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
                                                                    BorderRadius.circular(
                                                                        10)),
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
                                                      acController
                                                              .selectedChildIndex
                                                              .value =
                                                          index.toString();

                                                      acController
                                                              .selectedDdindex[
                                                          index] = "true";

                                                      acController.childDdnum[
                                                          index] = newValue;

                                                      print(acController
                                                          .ageTextControllers);
                                                      print(acController
                                                          .childDdnum[index]);
                                                      print(index);
                                                      print(acController
                                                          .ageTextControllers);

                                                      //"""""""""""''''"

                                                      acController
                                                          .ageTextControllers[
                                                              index]
                                                          .clear();
                                                      acController.ageTextControllers[
                                                              index] =
                                                          List.generate(
                                                              int.parse(acController
                                                                  .childDdnum[
                                                                      index]
                                                                  .toString()),
                                                              (index) =>
                                                                  TextEditingController());

                                                      print(
                                                          "allllll=>>>${acController.ageTextControllers}");
                                                      print(
                                                          "specificcccc===>${acController.ageTextControllers[index]}");
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
                                    Obx(() => acController
                                                    .selectedChildIndex.value ==
                                                index.toString() ||
                                            acController
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
                                                child: Text(
                                                  "Children's Age",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                    color: ColorConstant.black,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              GridView.builder(
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 10,
                                                          mainAxisSpacing: 10,
                                                          mainAxisExtent: acController
                                                                      .isValidate
                                                                      .value ==
                                                                  true
                                                              ? 70
                                                              : 50
                                                          // crossAxisSpacing: 10,
                                                          // mainAxisExtent: 50,
                                                          // mainAxisSpacing: 10
                                                          ),
                                                  itemCount: int.parse(
                                                      acController
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
                                                      child: SizedBox(
                                                        height: 50,
                                                        // color: Colors.yellow,
                                                        // width: 60,
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller: acController
                                                                  .ageTextControllers[
                                                              index][childIndex],
                                                          decoration:
                                                              InputDecoration(
                                                            // isDense: true,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    4),

                                                            // EdgeInsets
                                                            //     .symmetric(
                                                            //         vertical:
                                                            //             3,
                                                            //         horizontal:
                                                            //             14),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: ColorConstant
                                                                          .lightBlue2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                            border:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: ColorConstant
                                                                          .lightBlue2,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                          ),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value == "") {
                                                              acController
                                                                  .isValidate
                                                                  .value = true;
                                                              return "Please enter age";
                                                            } else if (int
                                                                    .parse(
                                                                        value) >
                                                                10) {
                                                              acController
                                                                  .isValidate
                                                                  .value = true;
                                                              return "Age must be below 10";
                                                            }
                                                            return null;
                                                          },
                                                        ),
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
                      //  ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstant.white)),
                                onPressed: () {
                                  if (acController.isSubLoading.value == true) {
                                    print("object");
                                    acController.roomCount.value = "";
                                    acController.selectedDdindex.clear();

                                    acController.selectedChildIndex.value = "";
                                    acController.selectedDdindex = [];
                                    acController.childDdnum.value = [];
                                    acController.adultDdnum.value = [];
                                    acController.ageTextControllers = [];
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: GoogleFonts.plusJakartaSans(
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
                                    acController.isSubLoading.value = true;

                                    childAgeList.clear();
                                    print(acController.adultDdnum);
                                    num adultSum = acController.adultDdnum
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

                                    print('Sum of the list: $adultSum');
                                    num childSum = acController.childDdnum
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
                                    print('Sum of the list: $childSum');
                                    acController.guestTotal =
                                        adultSum + childSum;
                                    print(acController.guestTotal);
                                    print(
                                        "room count${acController.roomCount.value}");
                                    print(
                                        "adult count list ${acController.adultDdnum}");
                                    print(
                                        "child count list${acController.childDdnum}");
                                    print(acController.ageTextControllers);
                                    for (int i = 0;
                                        i <
                                            acController
                                                .ageTextControllers!.length;
                                        i++) {
                                      for (int j = 0;
                                          j <
                                              acController
                                                  .ageTextControllers![i]
                                                  .length;
                                          j++) {
                                        childAgeList.add(acController
                                            .ageTextControllers[i][j].text);
                                        print(
                                            "Room $i, Child $j: ${acController.ageTextControllers![i][j].text}");
                                      }

                                      // }
                                    }
                                    print(childAgeList.toString());
                                    acController.isSubLoading.value = false;
                                    Get.back();
                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.plusJakartaSans(
                                      color: ColorConstant.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      // Obx(
                      //   () => acController.isSubLoading.value == true
                      //       ? SizedBox()
                      //       : Column(
                      //           children: [
                      //             Text(
                      //                 "No of rooms: ${acController.roomCount.value}"),
                      //             Text(
                      //                 "No of adults: ${acController.adultDdnum.value.toString()}"),
                      //             Text(
                      //                 "No of children: ${acController.childDdnum.value.toString()}"),
                      //             Text(
                      //                 "Children age: ${childAgeList.toString()}")
                      //           ],
                      //         ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
