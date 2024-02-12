import 'package:choose_n_fly/common_widgets/custom_button.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/booking/book_form_controller.dart';
import 'package:choose_n_fly/view/payment/controller/pay_controller.dart';
import 'package:choose_n_fly/view/payment/payment_done.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage(
      {super.key,
      required this.hotelNmae,
      required this.roomController,
      required this.acController,
      required this.leaddata,
      required this.checkin,
      required this.checkout,
      required this.platForm,
      required this.hotelId,
      required this.selectedRoomCategoryData,
      required this.roomDetail});
  final hotelNmae;
  final RoomController2 roomController;
  final AccomodationController acController;
  final leaddata;

  final checkin;
  final checkout;
  final platForm;
  final hotelId;
  final selectedRoomCategoryData;
  final roomDetail;

  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<PayController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var payController = Get.put(PayController(
              platform: platForm,
              checkIn: checkin,
              checkOut: checkout,
              hotelId: hotelId,
              adultCount: roomDetail.fold(
                  0,
                  (previousValue, element) =>
                      int.parse(previousValue.toString()) +
                      int.parse(element['NoOfAdult'].toString())),
              childCount: roomDetail.fold(
                  0,
                  (previousValue, element) =>
                      int.parse(previousValue.toString()) +
                      int.parse(element['NoOfChild'].toString())),
              selectedRoomcategoryData: selectedRoomCategoryData));
          var bookFormController = Get.find<BookFormController>();
          print("this is hoteliddd===${hotelId}");
          return Scaffold(
            bottomSheet: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 20, top: 10),
              child: GestureDetector(
                onTap: () {
                  bookingConfirmDialogue(context, payController);
                  //''''''''''''''''''''''''

                  // if (platForm == "0" && hotelId == 291) {
                  //   payController.inhouseBooking(roomDetail);
                  // } else {
                  //   Fluttertoast.showToast(
                  //       msg: "Only test hotel booing is available now");
                  // }
                  //''''''''''''''''''''''''''
                  //=========================
                  // if (payController.selectedValue.value ==
                  //     "Credit or Debit Card") {
                  //   if (485 <= 1000) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //           child: AlertDialog(
                  //             shape: const RoundedRectangleBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20.0))),
                  //             title: const Text('Payment',
                  //                 style: TextStyle(fontSize: 17)),
                  //             content: const Text(
                  //                 'You have enough amount in your wallet for making this payment',
                  //                 style: TextStyle(
                  //                     fontSize: 13.5, color: Colors.black54)),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: const Text('Ok'),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   } else {
                  //     print("amazon payment gateway");
                  //   }
                  // } else if (payController.selectedValue.value == "Wallet") {
                  //   if (4850 < 1000) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //           child: AlertDialog(
                  //             shape: const RoundedRectangleBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20.0))),
                  //             title: const Text('Insufficient Balance',
                  //                 style: TextStyle(
                  //                     fontSize: 17, color: Colors.black)),
                  //             content: const Text(
                  //                 'Insufficient balance in your wallet. Please make card payment',
                  //                 style: TextStyle(
                  //                     fontSize: 13.5, color: Colors.black54)),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: const Text('Ok'),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   } else {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //           height: 300,
                  //           child: AlertDialog(
                  //             shape: const RoundedRectangleBorder(
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(20.0))),
                  //             title: const Text('Wallet Payment',
                  //                 style: TextStyle(
                  //                     fontSize: 17, color: Colors.black)),
                  //             content: Column(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 const Text(
                  //                     'Are you sure want to confirm payment?',
                  //                     style: TextStyle(
                  //                         fontSize: 13.5,
                  //                         color: Colors.black54)),
                  //                 SizedBox(
                  //                   height: MediaQuery.of(context).size.height *
                  //                       0.03,
                  //                 ),
                  //                 Container(
                  //                   child: const Column(
                  //                     children: [
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Text(
                  //                             "Wallet Total",
                  //                             style: TextStyle(
                  //                               fontSize: 13,
                  //                             ),
                  //                           ),
                  //                           Text(
                  //                             "10000",
                  //                             style: TextStyle(fontSize: 13),
                  //                           )
                  //                         ],
                  //                       ),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Text(
                  //                             "Payment amount",
                  //                             style: TextStyle(
                  //                               fontSize: 13,
                  //                             ),
                  //                           ),
                  //                           Text(
                  //                             "1000",
                  //                             style: TextStyle(fontSize: 13),
                  //                           )
                  //                         ],
                  //                       ),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: [
                  //                           Text(
                  //                             "Balance",
                  //                             style: TextStyle(
                  //                                 fontSize: 13,
                  //                                 color: ColorConstant.black,
                  //                                 fontWeight: FontWeight.bold),
                  //                           ),
                  //                           Text(
                  //                             "9000",
                  //                             style: TextStyle(
                  //                                 fontSize: 13,
                  //                                 fontWeight: FontWeight.bold),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: const Text('cancel'),
                  //               ),
                  //               ElevatedButton(
                  //                   style: const ButtonStyle(
                  //                       shape: MaterialStatePropertyAll(
                  //                           RoundedRectangleBorder(
                  //                               borderRadius: BorderRadius.all(
                  //                                   Radius.circular(10.0)))),
                  //                       backgroundColor:
                  //                           MaterialStatePropertyAll(
                  //                               ColorConstant.lightBlue)),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                     Get.offAll(
                  //                         () => const PaymentDoneScreen(),
                  //                         transition:
                  //                             Transition.rightToLeftWithFade);

                  //                   },
                  //                   child: const Text(
                  //                     "Confirm",
                  //                     style:
                  //                         TextStyle(color: ColorConstant.white),
                  //                   ))
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }
                  // }
                  //============================
                },
                child: const CustomButton(
                    child: Center(
                  child: Text(
                    "Book now",
                    style: TextStyle(
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    await Get.delete<PayController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: const Text(
                'Payment',
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
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      const Text(
                        "Booking Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hotel Name",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      hotelNmae ?? "",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Room Type",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      roomController.selectedRoomCategory.value,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(checkin))} - ${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(checkout))}",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Guests",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      roomController.guestTotal!.value == 0
                                          ? acController.guestTotal.value
                                              .toString()
                                          : roomController.guestTotal!.value
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "${roomController.selectedRoomCategoryRate.value} ${roomController.selectedCurrCode.value}",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "GST  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue2,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016),
                                  ),
                                  Text(
                                    "_",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.014,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total  ",
                                    style: TextStyle(
                                        color: ColorConstant.lightBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.021,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${roomController.selectedRoomCategoryRate.value} ${roomController.selectedCurrCode.value}",
                                    style: TextStyle(
                                        color: ColorConstant.primaryColor,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.023,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      const Text(
                        "Customer Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: MediaQuery.of(context).size.height *
                                  //       0.006,
                                  // ),
                                  Expanded(
                                    child: Text(
                                      "${leaddata["first_name"]} ",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "E-mail",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      leaddata["emailId"],
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Contact No",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      leaddata["mobileNumber"],
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Passport No",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      leaddata["passport_no"],
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.006,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "LPO",
                                      style: TextStyle(
                                          color: ColorConstant.lightBlue2,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      leaddata["agentlpo"],
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016),
                                    ),
                                  ),
                                ],
                              ),
                              // Text("Name"),
                              // Text("Name"),
                              // Text("Name")
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.03,
                      // ),
                      // const Text(
                      //   "Select Payment Method",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 15),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.grey.withOpacity(0.5),
                      //             blurRadius: 4,
                      //             spreadRadius: 1,
                      //             offset: const Offset(0, 1))
                      //       ]),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(vertical: 10),
                      //     child: Column(
                      //       children: [
                      //         _buildRadioButton(
                      //             'Wallet',
                      //             const Color.fromARGB(255, 111, 221, 166),
                      //             const Icon(
                      //               Icons.wallet_outlined,
                      //               color: ColorConstant.white,
                      //               size: 20,
                      //             ),
                      //             context,
                      //             payController),
                      //         SizedBox(
                      //           height:
                      //               MediaQuery.of(context).size.height * 0.013,
                      //         ),
                      //         _buildRadioButton(
                      //             'Credit or Debit Card',
                      //             const Color.fromARGB(255, 240, 185, 123),
                      //             const Icon(
                      //               Icons.credit_card,
                      //               color: ColorConstant.white,
                      //               size: 20,
                      //             ),
                      //             context,
                      //             payController),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      )
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

  Widget _buildRadioButton(String value, color, icon, BuildContext context,
      PayController payController) {
    return Obx(
      () => Container(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                child: icon,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 1))
                    ]),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(value,
                  style: TextStyle(
                      color: ColorConstant.black,
                      fontSize: MediaQuery.of(context).size.height * 0.018)),
              const Spacer(),
              Radio(
                value: value,
                groupValue: payController.selectedValue.value,
                onChanged: (selected) {
                  payController.setSelectedValue(value);
                  print(payController.selectedValue.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bookingConfirmDialogue(BuildContext context, PayController payController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text('Book Now?', style: TextStyle(fontSize: 17)),
            content: const Text('Are you sure want to Book?',
                style: TextStyle(fontSize: 14)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(10.0)))),
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.lightBlue)),
                  onPressed: () {
                    Navigator.of(context).pop();

                    if (platForm == "0" && hotelId == 291) {
                      payController.inhouseBooking(roomDetail);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Only test hotel booing is available now");
                    }
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: ColorConstant.white),
                  ))
            ],
          ),
        );
      },
    );
  }
}
