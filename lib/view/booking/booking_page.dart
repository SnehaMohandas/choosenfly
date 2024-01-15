import 'dart:convert';

import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/text_styles.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/booking/book_form_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/payment/payment_page.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../cart/cart_screen.dart';

class BookingPage extends StatelessWidget {
  BookingPage(
      {super.key,
      required this.roomController,
      required this.acController,
      required this.checkinD,
      required this.checkoutD,
      required this.roomDetail,
      required this.platForm,
      required this.hotelId,
      required this.totalPrice,
      required this.selectedRoomCategoryData
      // required this.sellingPrice,
      // required this.roomCategoryId,
      // required this.roomTypeId,
      // required this.occupationId
      });
  final RoomController2 roomController;
  final AccomodationController acController;
  final checkinD;
  final checkoutD;
  final roomDetail;
  final platForm;
  final hotelId;
  final totalPrice;
  final selectedRoomCategoryData;
  // final sellingPrice;

  // final roomCategoryId;
  // final roomTypeId;
  // final occupationId;
  List<List<TextEditingController>> controllersList = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController LfirstnameController = TextEditingController();
  final TextEditingController LMiddlenameController = TextEditingController();

  final TextEditingController LLastnameController = TextEditingController();

  final TextEditingController LEmailController = TextEditingController();

  final TextEditingController LContactController = TextEditingController();

  final TextEditingController LPassController = TextEditingController();
  final TextEditingController LLPOController = TextEditingController();
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    print("totalll===>${acController.orgguestTotal.value}");
    print("rooommmmdetaillll====>${roomDetail}");
    // print(checkinD);
    // print(checkoutD);
    // print(roomDetail);
    return Obx(() {
      if (networkController.isConnected.value) {
        var bookFormControlller = Get.put(BookFormController(
            platform: platForm,
            checkIn: checkinD,
            checkOut: checkoutD,
            hotelId: hotelId,
            totalPrice: totalPrice,
            selectedRoomcategoryData: selectedRoomCategoryData
            // sellingPrice: sellingPrice,
            // roomCategoryId: roomCategoryId,
            // roomTypeId: roomTypeId,
            // occupancyId: occupationId
            ));

        return WillPopScope(
          onWillPop: () async {
            Get.delete<BookFormController>();
            return true;
          },
          child: Scaffold(
            bottomSheet: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 20, top: 10),
                  child: GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        bookFormControlller.leaddata = await getFormValues();
                        print(bookFormControlller.leaddata);

                        bookFormControlller.guestFormdata =
                            await getEnteredForm(
                                acController,
                                roomController,
                                bookFormControlller,
                                bookFormControlller.leaddata);
                        print(
                            "datlisttt===>${bookFormControlller.guestFormdata}");

                        Fluttertoast.showToast(msg: "Added to cart");
                        Get.off(() => CartScreen(),
                            transition: Transition.rightToLeftWithFade);
                      }
                    },
                    child: Container(
                      width: 45,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: ColorConstant.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorConstant.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, bottom: 20, top: 10),
                    child: GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          // print(roomController.selectedcourtesy2.value);
                          bookFormControlller.leaddata = await getFormValues();
                          print(bookFormControlller.leaddata);
                          // print(jsonEncode(bookFormControlller.leaddata));
                          if (roomController.guestTotal.value != 0 &&
                              roomController.guestTotal.value != 1) {
                            bookFormControlller.guestFormdata =
                                await getEnteredForm(
                                    acController,
                                    roomController,
                                    bookFormControlller,
                                    bookFormControlller.guestFormdata);
                            // print(
                            //     "datlisttt===>${bookFormControlller.guestFormdata}");
                          } else if (roomController.guestTotal.value == 1) {
                          } else if (acController.orgguestTotal.value != 0 &&
                              acController.orgguestTotal.value != 1) {
                            bookFormControlller.guestFormdata =
                                await getEnteredForm(
                                    acController,
                                    roomController,
                                    bookFormControlller,
                                    bookFormControlller.guestFormdata);
                            // print(
                            //     "datlisttt===>${bookFormControlller.guestFormdata}");
                          } else if (acController.guestTotal.value != 0 &&
                              acController.guestTotal.value != 1) {
                            bookFormControlller.guestFormdata =
                                await getEnteredForm(
                                    acController,
                                    roomController,
                                    bookFormControlller,
                                    bookFormControlller.guestFormdata);
                            // print(
                            //     "datlisttt===>${bookFormControlller.guestFormdata}");
                          }

                          // if (roomController.selectedcourtesy2.value != []) {
                          //   print("notempty");
                          //   bookFormControlller.guestFormdata =
                          //       await getEnteredForm(
                          //           acController,
                          //           roomController,
                          //           bookFormControlller.guestFormdata);
                          //   print(
                          //       "datlisttt===>${bookFormControlller.guestFormdata}");
                          // }

                          await bookFormControlller.postAccommodation(
                            checkinD,
                            checkoutD,
                            roomController.selectedRoom.value,
                            roomDetail,
                          );
                          if (platForm == "0") {
                            bookFormControlller.inhouseBooking();
                          }
                          Get.to(() => PaymentPage(),
                              transition: Transition.rightToLeftWithFade);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: CustomButton(
                          child: Center(
                              child: Text(
                            "Book and Confirm",
                            style: TextStyle(
                                color: ColorConstant.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<BookFormController>();

                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: Text(
                'Personal Details',
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
              () => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26, right: 26, top: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      contentPadding: EdgeInsets.only(left: 6),
                                      border: InputBorder.none),
                                  value: roomController
                                              .selectedcourtesy1.value ==
                                          ""
                                      ? null
                                      : roomController.selectedcourtesy1.value,
                                  items: roomController.courtesy1.map((item) {
                                    return DropdownMenuItem(
                                        value: item,
                                        child: Text(item.toString()));
                                  }).toList(),
                                  onChanged: (v) {
                                    roomController.selectedcourtesy1.value =
                                        v.toString();
                                    print(
                                        roomController.selectedcourtesy1.value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: LfirstnameController,
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
                                      hintStyle: TextingStyle.font14normalLb,
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
                            controller: LMiddlenameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
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
                            controller: LLastnameController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
                                hintText: 'Last Name'),
                            // validator: (value) {
                            //   if (value == "") {
                            //     return "This field cannot be empty";
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26, right: 26, top: 8),
                          child: TextFormField(
                            controller: LEmailController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            controller: LContactController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
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
                            controller: LPassController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
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
                            controller: LLPOController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorConstant.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 14, right: 14),
                                hintStyle: TextingStyle.font14normalLb,
                                hintText: 'LPO'),
                            validator: (value) {
                              if (value == "") {
                                return "This field cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        ListView.builder(
                            padding: EdgeInsets.only(bottom: 60),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: roomController.guestTotal.value != 1 &&
                                    roomController.guestTotal.value != 0
                                ? roomController.guestTotal.value - 1
                                : roomController.guestTotal.value == 1
                                    ? 0
                                    : acController.orgguestTotal.value != 1 &&
                                            acController.orgguestTotal.value !=
                                                0
                                        ? acController.orgguestTotal.value - 1
                                        : acController.guestTotal.value != 1 &&
                                                acController.guestTotal.value !=
                                                    0
                                            ? acController.guestTotal.value - 1
                                            : 0,
                            itemBuilder: (context, index) {
                              if (roomController.guestTotal.value != 1 &&
                                  roomController.guestTotal.value != 0) {
                                print("con1");
                              } else if (roomController.guestTotal.value == 1) {
                                print("con2");
                              } else if (acController.orgguestTotal.value !=
                                      1 &&
                                  acController.orgguestTotal.value != 0) {
                                print("con3");
                              } else if (acController.guestTotal.value != 1 &&
                                  acController.guestTotal.value != 0) {
                                print("con 4");
                              } else {
                                print("con 5");
                              }

                              // roomController.selectedcourtesy2.value =
                              //     List.generate(
                              //         roomController.guestTotal.value != 1 &&
                              //                 roomController.guestTotal.value !=
                              //                     0
                              //             ? roomController.guestTotal.value - 1
                              //             : roomController.guestTotal.value == 1
                              //                 ? 0
                              //                 : acController.guestTotal.value !=
                              //                             1 &&
                              //                         acController.guestTotal
                              //                                 .value !=
                              //                             0
                              //                     ? acController
                              //                             .guestTotal.value -
                              //                         1
                              //                     : 0,
                              //         (index) => "Mr.");

                              // if (roomController.selectedGender.isEmpty) {
                              // roomController.selectedGender.value =
                              //     List.generate(
                              //         roomController.guestTotal.value != 1 &&
                              //                 roomController.guestTotal.value !=
                              //                     0
                              //             ? roomController.guestTotal.value - 1
                              //             : roomController.guestTotal.value == 1
                              //                 ? 0
                              //                 : acController.guestTotal.value !=
                              //                             1 &&
                              //                         acController.guestTotal
                              //                                 .value !=
                              //                             0
                              //                     ? acController
                              //                             .guestTotal.value -
                              //                         1
                              //                     : 0,
                              //         (index) => "");
                              //}
                              if (controllersList.length <= index) {
                                controllersList.add([
                                  TextEditingController(), // Controller for First Name
                                  // Controller for Middle Name
                                  TextEditingController(), // Controller for Last Name
                                  // Controller for E-mail
                                ]);
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 26,
                                        right: 26,
                                        top: 15,
                                        bottom: 6),
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
                                                width: 85,
                                                decoration: BoxDecoration(
                                                  // border: Border.all(color: Colors.grey.shade300),
                                                  // borderRadius: BorderRadius.circular(10),
                                                  color: Colors.grey[200],
                                                ),
                                                child: DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 6),
                                                      border: InputBorder.none),
                                                  value: roomController
                                                                  .selectedcourtesy2[
                                                              index] ==
                                                          []
                                                      ? null
                                                      : roomController
                                                              .selectedcourtesy2[
                                                          index],
                                                  items: roomController
                                                      .courtesy2
                                                      .map((item) {
                                                    return DropdownMenuItem(
                                                        value: item,
                                                        child: Text(item));
                                                  }).toList(),
                                                  onChanged: (v) {
                                                    roomController
                                                            .selectedcourtesy2[
                                                        index] = v.toString();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      controllersList[index][0],
                                                  decoration: InputDecoration(
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  ColorConstant
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                      border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  ColorConstant
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
                                            controller: controllersList[index]
                                                [1],
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: ColorConstant
                                                                .grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            ColorConstant.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                contentPadding: EdgeInsets.only(
                                                    top: 6,
                                                    bottom: 6,
                                                    left: 14,
                                                    right: 14),
                                                hintStyle:
                                                    TextingStyle.font14normalLb,
                                                hintText: 'Last Name'),
                                            // validator: (value) {
                                            //   if (value == "") {
                                            //     return "This field cannot be empty";
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 26, right: 26, top: 8),
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorConstant.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorConstant.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              contentPadding: EdgeInsets.only(
                                                  top: 6,
                                                  bottom: 6,
                                                  left: 14,
                                                  right: 14),
                                              // border: InputBorder.none
                                            ),
                                            hint: Text(
                                              "Gender",
                                              style:
                                                  TextingStyle.font14normalLb,
                                            ),
                                            value:
                                                roomController.selectedGender[
                                                            index] ==
                                                        ""
                                                    ? null
                                                    : roomController
                                                        .selectedGender[index],
                                            items: roomController.gender
                                                .map((item) {
                                              return DropdownMenuItem(
                                                  value: item,
                                                  child: Text(item));
                                            }).toList(),
                                            onChanged: (v) {
                                              roomController
                                                      .selectedGender[index] =
                                                  v.toString();
                                              print(roomController
                                                  .selectedGender[index]);
                                              print(roomController
                                                  .selectedGender);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return networkController.noDataImage(context);
      }
    });
  }

  Map<String, String> getFormValues() {
    Map<String, String> formValues = {
      "customer_id": "0",
      "salutaion": roomController.selectedcourtesy1.value,
      'first_name': LfirstnameController.text,
      'middle_name': LMiddlenameController.text,
      'last_name': LLastnameController.text,
      'emailId': LEmailController.text,
      'mobileNumber': LContactController.text,
      'passport_no': LPassController.text,
      'agentlpo': LLPOController.text,
      "native_country": acController.selectedNativeCode.value
    };

    return formValues;
  }

  List<Map<String, dynamic>> getEnteredForm(
      AccomodationController acController,
      RoomController2 roomController,
      BookFormController bookFormController,
      leaddata) {
    List<Map<String, dynamic>> dataList = [];
    var length = roomController.guestTotal.value != 1 &&
            roomController.guestTotal.value != 0
        ? roomController.guestTotal.value - 1
        : acController.orgguestTotal.value != 1 &&
                acController.orgguestTotal.value != 0
            ? acController.orgguestTotal.value - 1
            : acController.guestTotal.value != 1 &&
                    acController.guestTotal.value != 0
                ? acController.guestTotal.value - 1
                : 0;

    for (int i = 0; i < length; i++) {
      print(roomController.selectedGender[i]);
      Map<String, dynamic> data = {
        // "lead": leaddata,
        "Courtesy": roomController.selectedcourtesy2[i],
        'First Name': controllersList[i][0].text,
        'Last Name': controllersList[i][1].text,
        'Gender': roomController.selectedGender[i],
      };

      dataList.add(data);
    }

    return dataList;
  }
}
