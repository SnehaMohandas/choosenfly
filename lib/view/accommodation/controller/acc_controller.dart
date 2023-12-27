import 'dart:convert';

import 'package:choose_n_fly/model/all_hotels_model.dart';
import 'package:choose_n_fly/model/destination_model.dart';
import 'package:choose_n_fly/model/native_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AccomodationController extends GetxController {
  List<DestinationModel>? destinationModel;
  List<NativeModel>? nativeModel;
  List<AllHotelModel>? allHotelModel;

  // List<List<String>> native = [
  //   ["India", "1"],
  //   ["Dubai", "2"]
  // ];
  List native = [].obs;
  var selectedNatCountry = ''.obs;
  var selectedNativeCode = ''.obs;

  //var selectedNativeType = ''.obs;

  var noNatSelected = false.obs;

  // void onNatSelected(String value) {
  //   selectedNative.value = value;
  // }

  // void onNatCountry(String value) {
  //   selectedNatCountry.value = value;
  // }

  //=====

  // List<List<String>> destination = [
  //   ["Maldives", "1"],
  //   ["New Zealand", "2"],
  //   ["Thailand", "3"],
  //   ["Singapore", "4"],
  // ];
  //===========

  List destination = [].obs;
  //List destination = [].obs;
  var selectedDestinaion = ''.obs;
  var selectedDesCode = ''.obs;
  var selectedDesType = ''.obs;

  var nodestSelected = false.obs;
  void onDesSelected(String value) {
    selectedDestinaion.value = value;
    print(selectedDestinaion.value);
  }

  var checkInDate = "".obs;
  var newCheckinDate = "".obs;
  var newCheckoutDate = "".obs;

  DateTime? checkin;
  var checkOutDate = "".obs;
  DateTime? checkout;
  DateTime? dateforCal1;
  DateTime? dateforCal2;
  Rx<Duration> difference = Duration(seconds: 0).obs;
  final TextEditingController nitController = TextEditingController();
  var isDateShown = false.obs;
  var ischeckInError = false.obs;
  var ischeckOutError = false.obs;
  var isnightError = false.obs;

  Future<void> selectCheckin(BuildContext context) async {
    print("this is difff${difference}");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate.value != "" ? checkin! : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: checkOutDate.value == ""
          ? DateTime(3000)
          : checkout!.subtract(Duration(days: 1)),
    );
    if (picked != null) {
      checkin = picked;
      checkInDate.value =
          DateFormat('MMM-dd-yyyy').format(DateTime.parse(picked.toString()));
      print("original====>>${checkInDate.value}");

      ischeckInError.value = false;
      dateforCal1 = DateFormat('MMM-dd-yyyy').parse(checkInDate.value);
      if (checkOutDate.value != "") {
        nigtCalculate();
      }
      print("checkindateeeee===${checkInDate}");
    } else {
      print("not pickedd");
    }
  }

  nigtCalculate() {
    difference.value = dateforCal2!.difference(dateforCal1!.toUtc());
    print("difffvalueee${difference.value}");
    if (difference.value != Duration(seconds: 0)) {
      nitController.text = difference.value.inDays.toString();
    }
    print("nightttt${difference.value.inDays}");
  }

  Future<void> selectCheckout(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate.value != ""
          ? checkout!
          : checkInDate.value != ""
              ? checkin!.add(Duration(days: 1))
              : DateTime.now().add(
                  Duration(days: 1)), // initialDate: checkInDate.value != ""
      //     ?checkin!.add(Duration(days: 1))
      //     : DateTime.now(),
      firstDate: checkInDate.value == ""
          ? DateTime.now().add(Duration(days: 1))
          : checkin!.add(Duration(days: 1)),
      lastDate: DateTime(3000),
    );
    if (picked != null) {
      checkout = picked;

      checkOutDate.value =
          DateFormat('MMM-dd-yyyy').format(DateTime.parse(picked.toString()));
      ischeckOutError.value = false;
      dateforCal2 = DateFormat('MMM-dd-yyyy').parse(checkOutDate.value);
      if (checkInDate.value != "") {
        nigtCalculate();
      }

      print("checkindateeeee===${checkOutDate}");
    } else {
      print("not pickd");
    }
  }

  void updateCheckoutDate(int nights) {
    if (dateforCal1 != null) {
      // Calculate the new checkout date based on the number of nights
      DateTime newCheckoutDate = dateforCal1!.add(Duration(days: nights));
      checkout = newCheckoutDate;
      checkOutDate.value = DateFormat('MMM-dd-yyyy').format(newCheckoutDate);
      dateforCal2 = newCheckoutDate;
      nigtCalculate();
    }
  }

  //room and guest dropdown values
  var isSubLoading = true.obs;

  var roomCount = "".obs;
  var newRoomCount = "".obs;

  var selectedChildIndex = "".obs;
  List selectedDdindex = <String>[].obs;
  var adultDdnum = [].obs;
  RxInt guestTotal = 0.obs;

  var childDdnum = [].obs;
  List<List<dynamic>> ageTextControllers = [];
  var isValidate = false.obs;
  var isSearchtapped = false.obs;
  var isNativeNotSelected = false.obs;
  var isDestNotSelected = false.obs;

  var isDateNotSelected = false.obs;
  var isRoomNotSelected = false.obs;
  List<List> allAgeOrgs = [];
  var accommodationDetails;

  //submit accommodation details
  var parsedCheckin;
  var parsedCheckout;

  Future postAccommodation() async {
    parsedCheckin = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekin.value));
    parsedCheckout = DateFormat('yyyy-MM-dd')
        .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekout.value));
    final Map<String, dynamic> requestData =
        // {
        //   "CheckInDate": "${parsedCheckin}",
        //   "CheckOutDate": "${parsedCheckout}",
        //   "HCode": "DXB9892146",
        //   "CityId": "${orgDestination.value}",
        //   "NationalityId": "${orgNativeCode.value}",
        //   "RoomDetail": orgAccomodationDetails
        // };

        {
      "hotelDTO": {
        "checkIn": "${parsedCheckin}",
        "checkOut": "${parsedCheckout}",
        "native_country_id": "${orgNativeCode}",
        "noOfRooms": orgRoomcount,
        "countStart": 0,
        "id": 0,
        "countLast": "4",
        "agent_id": "5",
        "searchCityorCountry_id": "${orgDesCode}",
        "searchCorCtype": "${orgDesType}",
        "searchRoomDTO": [orgAccomodationDetails],
        "destinationHotel": "${orgDestination}",
        "startDate": "${parsedCheckin}",
        "endDate": "${parsedCheckout}"
      },
      "atharvaReq": {
        "CheckInDate": "${parsedCheckout}",
        "CheckOutDate": "${parsedCheckout}",
        "CityId": "3",
        "NationalityId": "${orgNativeCode}",
        "countryOrCityId": "${orgDesCode}",
        "RoomDetail": [orgAccomodationDetails]
      }
    };

    // final String apiUrl =
    //     'https://your.api.endpoint'; // Replace with your actual API endpoint

    // try {
    //   final response = await http.post(
    //     Uri.parse(apiUrl),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode(requestData),
    //   );

    //   if (response.statusCode == 200) {
    //     // Handle the successful response here
    //     print(response.body);
    //   } else {
    //     // Handle the error response here
    //     print('Error: ${response.statusCode}');
    //   }
    // } catch (error) {
    //   // Handle the exception
    //   print('Error: $error');
    // }
  }

  //orginal details

  var orgnewChekin = "".obs;
  var orgnewChekout = "".obs;
  var orgDestination = "".obs;
  var orgDesCode = "".obs;
  var orgDesType = "".obs;
  var orgNativeCode = "".obs;
  //var orgdesCountry = "".obs;
  var orgNatCountry = "".obs;
  var orgAccomodationDetails;
  var orgRoomcount = "".obs;
  RxInt orgguestTotal = 0.obs;

  var isLoading = true.obs;

  //fetching destination
  FetchDestination(searchKey) async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/destinationAPIout?term=${searchKey}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = destinationModelFromJson(response.body);
        destinationModel = data;
        for (int i = 0; i < destinationModel!.length; i++) {
          // destination.add(destinationModel![i].hotelDetails);
          destination.add([
            destinationModel![i].hotelDetails,
            destinationModel![i].hotelCode,
            destinationModel![i].hotelType
          ]);
        }
        print("desssss==>${destination}");
      }
      await FetchNative();
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  //fetch native
  FetchNative() async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/nationalityAPIout"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = nativeModelFromJson(response.body);
        nativeModel = data;
        for (int i = 0; i < nativeModel!.length; i++) {
          // nat.add(nativeModel![i].hotelDetails);
          native.add([
            nativeModel![i].name,
            nativeModel![i].countryId,
          ]);
        }
        print("desssss==>${native}");
      }
    } catch (e) {
    } finally {
      // isLoading.value = false;
    }
  }

  var isHotelLoading = false.obs;
  Map<String, dynamic> requestData = {
    "hotelDTO": {
      "checkIn": "30/12/2023",
      "checkOut": "31/12/2023",
      "native_country_id": "2",
      "noOfRooms": "1",
      "countStart": 0,
      "id": 0,
      "countLast": "4",
      "agent_id": "5",
      "searchCityorCountry_id": "0~235~3",
      "searchCorCtype": "State",
      "searchRoomDTO": [
        {"roomcount": 1, "adult": "1", "child": "0", "childAge": []}
      ],
      "destinationHotel": "Dubai - United Arab Emirates",
      "startDate": "20231230",
      "endDate": "20231231"
    },
    "atharvaReq": {
      "CheckInDate": "2023-12-30",
      "CheckOutDate": "2023-12-31",
      "CityId": "3",
      "NationalityId": "2",
      "countryOrCityId": "0~235~3",
      "RoomDetail": [
        {"ChildAges": [], "NoOfAdult": "1", "NoOfChild": "0", "RoomSrNo": 1}
      ]
    }
  };
  postAcDetails() async {
    isHotelLoading.value = true;
    String datass = jsonEncode(requestData);

    try {
      var response =
          await http.post(Uri.parse("${baseUrl}custom/searchAllHotelsAPIout"),
              headers: {
                'apikey': 'CONNECTWORLD123',
                'Content-Type': 'application/json',
              },
              body: datass);
      if (response.statusCode == 200) {
        print("object");
        var data = allHotelModelFromJson(response.body);
        allHotelModel = data;

        print(
          "lngthhhhh${allHotelModel![0].inhouseHotels!.data[1][0]["hotel_name"]}", // Replace with the number of items you have
        );
      } else {
        print(
          allHotelModel![0]
              .inhouseHotels!
              .data[1]
              .length, // Replace with the number of items you have
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isHotelLoading.value = false;

      // isLoading.value = false;
    }
  }

  @override
  void onInit() {
    FetchDestination("");
    // TODO: implement onInit
    super.onInit();
  }
}
