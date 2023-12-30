import 'package:choose_n_fly/model/confirmation_model.dart';
import 'package:choose_n_fly/model/req_model.dart';
import 'package:choose_n_fly/model/voucher_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReqConfirmController extends GetxController {
  final bookingId;
  final bookingStatus;
  ReqConfirmController({
    required this.bookingId,
    required this.bookingStatus,
  });
  List<VoucherModel>? voucherModel;
  ConfirmModel? confirmModel;
  List<RequestModel>? requestModel;
  var selectedValue = 'Voucher'.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  var timePeriod = "".obs;

  var isLoading = true.obs;

  fetchVoucherDetails() async {
    print(bookingId);
    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/voucherDetailsAPIout?bookingid=${bookingId}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = voucherModelFromJson(response.body);
        print(data);
        voucherModel = data;
        print("detaillsss==>${voucherModel}");
        await fetchConfirmDetails();
        await fetchRequestDetails();
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  fetchConfirmDetails() async {
    try {
      //isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/confirmationDetailsAPIout?bookingid=${bookingId}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("object");
        var data = confirmModelFromJson(response.body);
        print(data);
        confirmModel = data;
        print("detaillsss==>${confirmModel}");
      }
    } catch (e) {
    } finally {
      //isLoading.value = false;
    }
  }

  fetchRequestDetails() async {
    try {
      //isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/requestDetailspdfAPIout?id=${bookingId}&bookingType=${bookingStatus}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("object");
        var data = requestModelFromJson(response.body);
        print(data);
        requestModel = data;
        print("detaillsss==>${response.body}");
      }
    } catch (e) {
    } finally {}
  }

  ///price reference
  //var priceRef = "".obs;

  priceRefChange(
    bookingIdPR,
    code,
    apiType,
  ) async {
    try {
      //isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/setBookingCodeAPIout?id=${bookingIdPR}&bookingcode=${code}&apistatus=${apiType}&type=${bookingStatus}&apiId=${apiType}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("detaillsss==>${response.body}");
        // Fluttertoast.showToast(msg: "Removed from cart");
        await fetchVoucherDetails();
      }
    } catch (e) {
    } finally {}
  }

  //supplier reference
  //var supplierRef = "".obs;

  supplierRefChange(
    bookingIdPR,
    code,
    apiType,
  ) async {
    try {
      //isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/setBookingCodeAPIout?id=${bookingIdPR}&bookingcode=${code}&apistatus=${apiType}&type=${bookingStatus}&apiId=${apiType}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("detaillsss==>${response.body}");
        // Fluttertoast.showToast(msg: "Removed from cart");
        await fetchVoucherDetails();
      }
    } catch (e) {
    } finally {}
  }

  @override
  void onInit() {
    fetchVoucherDetails();
    // fetchConfirmDetails();
    // fetchRequestDetails();

    super.onInit();
  }
}
