import 'package:choose_n_fly/model/all_booking_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class BookingDController extends GetxController {
  AllBookingsModel? allBookingsModel;
  var selectedValue = 'Upcoming'.obs;
  var isLoading = true.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  var timePeriod = DateFormat('MMM/yyyy').format(DateTime.now()).obs;
  List<List<String>> status = [
    ["Upcoming", "1"],
    ["Completed", "2"],
    ["Cancelled", "3"]
  ];
  var selectedStatus = '1'.obs;

  fetchAllBOokings(searchKey) async {
    print("seachkeyyy===>>${searchKey}");
    print("tymmm==>${timePeriod.value}");
    print("stssss==>${selectedStatus.value}");

    try {
      isLoading.value = true;
      var response = await http.get(
          Uri.parse(
              "${baseUrl}custom/bookingListNewAPIout?period=${timePeriod.value}&bookingTypes=${selectedStatus.value}&searchkey=${searchKey}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = allBookingsModelFromJson(response.body);
        allBookingsModel = data;
        print(allBookingsModel);
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchAllBOokings("");

    super.onInit();
  }
}
