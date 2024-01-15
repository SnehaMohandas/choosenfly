import 'dart:io';
import 'dart:math';

import 'package:choose_n_fly/common_widgets/loader.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_voucher_controller.dart';
import 'package:choose_n_fly/view/booking_details/controller/req_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BookingVoucher extends StatelessWidget {
  BookingVoucher(
      {super.key,
      // required this.hotelBookingId,
      // required this.bookingId,
      required this.hotelName,
      required this.hotelbookingId,
      required this.bookingId});
  final NetworkController networkController = Get.find<NetworkController>();
  // final hotelBookingId;
  // final bookingId;
  final hotelName;
  final hotelbookingId;
  final bookingId;

  @override
  Widget build(BuildContext context) {
    // print("hotelbookingid===>${hotelBookingId}");
    // print("bookingid===>${bookingId}");

    return WillPopScope(
      onWillPop: () async {
        //Get.delete<BookingVoucherController>();
        return true;
      },
      child: Obx(() {
        if (networkController.isConnected.value) {
          var bookVController = Get.find<BookingVoucherController>();
          var reqController = Get.find<ReqConfirmController>();

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("object");
                _fileFromPdfUrl(
                    reqController.selectedValue.value == "Voucher"
                        ? bookVController.voucherPdfModel!.filelocationServer
                        : reqController.selectedValue.value == "Request"
                            ? bookVController
                                .requestPdfModel!.filelocationServer
                            : bookVController
                                .confirmPdfModel!.filelocationServer,
                    bookVController.emailController.text,
                    hotelbookingId,
                    bookingId,
                    bookVController,
                    reqController.selectedValue.value);
                // Fluttertoast.showToast(msg: "Voucher sent to the e-mail");
                // Get.offAll(() => HomeScreen(), transition: Transition.native);
              },
              child: Icon(
                Icons.send,
                color: ColorConstant.white,
              ),
              backgroundColor: ColorConstant.primaryColor,
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 82,
              leading: IconButton(
                  onPressed: () async {
                    // await Get.delete<BookingVoucherController>();

                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.white,
                  )),
              title: Text(
                'Booking Voucher',
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
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 202, 222, 238),
                        Color.fromARGB(255, 248, 239, 253)
                      ]),
                      borderRadius: BorderRadius.circular(10),
                      //  color: Color.fromARGB(255, 228, 237, 242),
                    ),
                    child: Center(
                      child: Text(hotelName,
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: ColorConstant.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017)),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        style: TextStyle(fontSize: 15),
                        controller: bookVController.emailController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorConstant.grey),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  // Obx(
                  //   () => bookVController.isLoading.value == true
                  //       ? Center(
                  //           child: loader(),
                  //         )
                  //       :
                  Expanded(
                    child: Container(
                      // height: 250,
                      width: double.infinity,
                      //color: Colors.yellow,
                      child: SfPdfViewerTheme(
                        data: SfPdfViewerThemeData(
                          backgroundColor: Colors.grey[200],
                        ),
                        child: SfPdfViewer.network(
                          reqController.selectedValue.value == "Voucher"
                              ? bookVController
                                  .voucherPdfModel!.filelocationServer
                              : reqController.selectedValue.value == "Request"
                                  ? bookVController
                                      .requestPdfModel!.filelocationServer
                                  : bookVController
                                      .confirmPdfModel!.filelocationServer,
                        ),
                      ),
                    ),
                  ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         Fluttertoast.showToast(msg: "Voucher sent to the e-mail");
                  //         Get.offAll(() => HomeScreen(),
                  //             transition: Transition.native);
                  //       },
                  //       child: Container(
                  //         height: MediaQuery.of(context).size.height * 0.05,
                  //         width: MediaQuery.of(context).size.width * 0.12,
                  //         decoration: BoxDecoration(
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: Colors.grey.withOpacity(0.4),
                  //                 blurRadius: 4,
                  //                 offset: const Offset(2, 8),
                  //               ),
                  //             ],
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: ColorConstant.primaryColor),
                  //         child: Icon(
                  //           Icons.send,
                  //           color: ColorConstant.white,
                  //         ),
                  //       ),
                  //     ),

                  //   ],
                  // )
                ],
              ),
            ),
          );
        } else {
          return networkController.noDataImage(context);
        }
      }),
    );
  }

  // _openEmail(mail, attachment) async {
  //   print(attachment);
  //   var email = mail;
  //   var subject = 'Hello';
  //   var body = "path";

  //   var emailUrl =
  //       'mailto:$email?subject=${Uri.encodeComponent(subject)}body=${Uri.encodeComponent(body)}&attachment=${Uri.encodeComponent(attachment)}';
  //   try {
  //     await launch(emailUrl);
  //   } catch (e) {
  //     throw 'Could not launch $emailUrl';
  //   }
  // }

  // Future<void> send(mail, file) async {
  //   final Email email = Email(
  //     recipients: [mail],
  //     attachmentPaths: [file],
  //     isHTML: false,
  //   );

  //   String? platformResponse;

  //   try {
  //     await FlutterEmailSender.send(email);
  //     print("object");
  //     platformResponse = 'success';
  //   } catch (error) {
  //     print(error);
  //     platformResponse = error.toString();
  //   } finally {}
  //   print(platformResponse.toString());

  //   //  if (!mounted) return;

  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   SnackBar(
  //   //     content: Text(platformResponse),
  //   //   ),
  //   // );
  // }

  Future _fileFromPdfUrl(String pdfUrl, String mail, hotelBookindId, bookingId,
      BookingVoucherController bookVController, selectedValue) async {
    print('helllliii');
    final response = await http.get(Uri.parse(pdfUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path =
        '${documentDirectory.path}/choosenfly.pdf'; // Use a specific file name

    File file = File(path);
    print('ok');
    file.writeAsBytesSync(response.bodyBytes);
    print('++++++++++++${file.path}');
    print(selectedValue);
    if (selectedValue == "Voucher") {
      bookVController.sendVoucherMail(hotelBookindId, bookingId, mail);
    } else if (selectedValue == "Request") {
      bookVController.sendRequestMail(hotelBookindId, bookingId, mail);
    } else {
      bookVController.sendConfirmMail(hotelBookindId, bookingId, mail);
    }
    // await send(mail, file.path);

    // await Share.shareFiles(
    //   [file.path],
    // );
    // Fluttertoast.showToast(msg: "Voucher sent to the e-mail");
    // Get.offAll(() => HomeScreen(), transition: Transition.native);
  }
}
