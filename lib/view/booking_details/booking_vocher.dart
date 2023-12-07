import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/view/booking_details/controller/booking_voucher_controller.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BookingVoucher extends StatelessWidget {
  BookingVoucher({super.key});

  final emailController = TextEditingController();
  var bookVController = Get.put(BookingVoucherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 82,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 228, 237, 242),
              ),
              child: Center(
                child: Text("TEST HOTEL (Only for testing)",
                    style: TextStyle(
                        color: ColorConstant.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.017)),
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
                          borderSide: BorderSide(color: ColorConstant.grey),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstant.grey),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Container(
                // height: 250,
                width: double.infinity,
                //color: Colors.yellow,
                child: SfPdfViewerTheme(
                  data: SfPdfViewerThemeData(
                    backgroundColor: Colors.grey[200],
                  ),
                  child: SfPdfViewer.asset(
                    'assets/images/Free_Test_Data_100KB_PDF.pdf',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "Voucher sent to the e-mail");
                    Get.offAll(() => HomeScreen(),
                        transition: Transition.native);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 4,
                            offset: const Offset(2, 8),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.primaryColor),
                    child: Icon(
                      Icons.send,
                      color: ColorConstant.white,
                    ),
                  ),
                ),

                // ElevatedButton(
                //     onPressed: () {},
                //     child: Text("  Send  ",
                //         style: TextStyle(
                //           color: ColorConstant.white,
                //           fontWeight: FontWeight.bold,
                //         )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
