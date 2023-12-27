import 'package:choose_n_fly/model/confirm_pdf_model.dart';
import 'package:choose_n_fly/model/request_pdf_model.dart';
import 'package:choose_n_fly/model/voucher_pdf_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookingVoucherController extends GetxController {
  VoucherPdfModel? voucherPdfModel;
  RequestPdfModel? requestPdfModel;
  ConfirmPdfModel? confirmPdfModel;
  // final hotelBookId;
  // final bookingId;
  // BookingVoucherController(
  //     {required this.hotelBookId, required this.bookingId});
  final emailController = TextEditingController();

  @override
  void onInit() {
    emailController.text = "agent@gmail.com";
    // fetchVoucherPdf();

    super.onInit();
  }

  var isLoading = true.obs;

  fetchVoucherPdf(hotelBookId, bookingId) async {
    print(hotelBookId);
    print(bookingId);
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/voucherPdfAPIout?id=${hotelBookId}&bookingid=${bookingId}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = voucherPdfModelFromJson(response.body);
        print(data);
        voucherPdfModel = data;
        print("detaillsss==>${voucherPdfModel}");
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  fetchRequestPdf(hotelBookId, bookingId) async {
    print(hotelBookId);
    print(bookingId);
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/requestBookingpdfAPIout?id=${hotelBookId}&bookingid=${bookingId}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = requestPdfModelFromJson(response.body);
        print(data);
        requestPdfModel = data;
        print("detaillsss==>${requestPdfModel}");
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  fetchConfirmPdf(hotelBookId, bookingId) async {
    print(hotelBookId);
    print(bookingId);
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/confirmationPdfAPIout?id=${hotelBookId}&bookingid=${bookingId}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = confirmPdfModelFromJson(response.body);
        print(data);
        confirmPdfModel = data;
        print("detaillsss==>${confirmPdfModel}");
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
