import 'dart:convert';

import 'package:choose_n_fly/model/room_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RoomController2 extends GetxController {
  String nightCount;
  AccomodationController acController;
  String hotelCode;
  RoomController2(this.nightCount, this.acController, this.hotelCode);

  var isInteriorClicked = true.obs;
  var interiorIndex = "1".obs;
  var exteriorIndex = "1".obs;
  var interior = [
    "assets/images/int1.jpg",
    "assets/images/int2.jpeg",
    "assets/images/int3.jpg"
  ];
  var exterior = ["assets/images/ext1.jpg", "assets/images/ext2.jpg"];
  List<List<String>> rooms = [
    ["Deluxe Room", "1"],
    [
      "Single",
      "2",
    ],
    ["Family", "3"]
  ];
  var selectedRoom = '1'.obs;

  void onRoomSelected(String value) {
    selectedRoom.value = value;
  }

  List<String> courtesy2 = ["Mr.", "Mrs", "Ms", "Master"];

  List<String> courtesy1 = ["Mr.", "Mrs.", "Ms."];

  List<String> gender = ["Male", "Female"];
  var selectedcourtesy1 = "Mr.".obs;

  var selectedcourtesy2 = [].obs;
  var selectedGender = [].obs;

  void oncourtesySelected(String value) {
    // selectedcourtesy.value = value;
  }

  var checkInDate = "".obs;
  DateTime? checkin;
  var checkOutDate = "".obs;
  var newCheckinDate = "".obs;
  var newCheckoutDate = "".obs;
  DateTime? checkout;
  DateTime? dateforCal1;
  DateTime? dateforCal2;
  Rx<Duration> difference = Duration(seconds: 0).obs;
  final TextEditingController nitController = TextEditingController();
  var isDateShown = false.obs;
  var ischeckInError = false.obs;
  var ischeckOutError = false.obs;
  var isnightError = false.obs;

  Future<void> selectCheckin(
      BuildContext context, AccomodationController acController) async {
    print("this is difff${difference}");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: checkInDate.value != "" ? checkin! : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: checkOutDate.value != ""
            ? checkout!.subtract(Duration(days: 1))
            : DateTime(3000));
    if (picked != null) {
      checkin = picked;
      checkInDate.value =
          DateFormat('MMM-dd-yyyy').format(DateTime.parse(picked.toString()));
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
    print("ni8 cal");
    difference.value = dateforCal2!.difference(dateforCal1!.toUtc());

    print("difffvalueee${difference.value}");
    if (difference.value != Duration(seconds: 0)) {
      nitController.text = difference.value.inDays.toString();
    }
    print("nightttt${difference.value.inDays}");
  }

  Future<void> selectCheckout(
      BuildContext context, AccomodationController acController) async {
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
      firstDate: checkInDate.value != ""
          ? checkin!.add(Duration(days: 1))
          : DateTime.now().add(Duration(days: 1)),

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

  void updateCheckoutDate(int nights, AccomodationController acController) {
    if (dateforCal1 != null || acController.dateforCal1 != null) {
      print("its workeddd");
      // Calculate the new checkout date based on the number of nights
      DateTime newCheckoutDate = dateforCal1!.add(Duration(days: nights));
      checkout = newCheckoutDate;
      checkOutDate.value = DateFormat('MMM-dd-yyyy').format(newCheckoutDate);
      dateforCal2 = newCheckoutDate;
      nigtCalculate();
    }
  }

//room&guest dropdown values
  var isSubLoading = true.obs;

  var roomCount = "".obs;
  var newRoomCount = "".obs;
  List<RoomModel>? roomModel;
  var selectedChildIndex = "".obs;
  List selectedDdindex = <String>[].obs;
  var adultDdnum = [].obs;
  RxInt guestTotal = 0.obs;

  var childDdnum = [].obs;
  List<List<dynamic>> ageTextControllers = [];
  var itemLimit = 1.obs;
  var isValidate = false.obs;
  var isSearchModify = false.obs;
  List<List> allAgeOrgs = [];

  var accommodationDetails;

  //for cancellation policy

  var atharvaroomDetail;
  var iwtxRoomDetail;
  var iwtxAgeDetail;

//'''''''''''''''''''''''''
// cancellation policy
//''''''''''''''''''''''''''''

  List cancelPolicy = [
    "Cancellations made 15 or more days before check in date will be free.",
    "Cancellations made more than 7 days in advance but less than 15 days will incur a cancellation charge of 1 nights tariff.",
    "No shows and cancellations made 0 to 7 days in advance will incur 100% charge of the booking.",
    "In case of a full refund on cancellation, there will be a deduction of approximately 5.7% as payment processing charges."
  ];
  atharvaCancelPolicy() async {
    var parsedCheckin;
    var parsedCheckOut;
    if (newCheckinDate.value != "" &&
        newCheckoutDate.value != "" &&
        isDateShown.value == true) {
      parsedCheckin = newCheckinDate.value;
      parsedCheckOut = newCheckoutDate.value;
    } else {
      parsedCheckin = acController.orgnewChekin.value;
      parsedCheckOut = acController.orgnewChekout.value;
    }
    var atharvaData = await {
      "CityId": acController.orgDesCode.value,
      "NationalityId": acController.orgNativeCode.value,
      "CheckInDate":
          "${DateFormat('yyyy-MM-dd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
      "CheckOutDate":
          "${DateFormat('yyyy-MM-dd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
      "HCode": "DXB9891108",
      "VoucherBooking": "false",
      "TokenId":
          "77f467af-978e-4952-a25f-a1943b4618b8~!^~JWVNHw7MwLZ3I/slypsn61JDML+MaI9esBcCQJlHkbdrKsz7N6KyHumS/hF4e6O4+Uz5AUpSjZlzgWoNZ7LWBA==",
      "HKey":
          "tWrEobmjNTKLzD2aWWm9BQElOCzl7rTfK6csL+UEREZ5WRVDlctDDw32qzsUrfll/m6G0K7SAdcWnFZZAuM1gyTDobw798Op1bzTemakll7FgUyT+eebFvQldAZMJ+pd",
      "RoomDetail": newRoomCount.value != ""
          ? atharvaroomDetail
          : acController.atharvaroomDetailOrg
    };

    print("theatharva dataaa--------==>${atharvaData}");

    // var response=await  http.post(Uri.parse("${baseUrl}custom/atharva/hotelPreBooking?type=policy"),
    // headers: {
    //   "apikey":header
    // },
    // body: atharvaData);

    // if(response.statusCode==200){

    // }
    // else{

    // }
  }

  iwtxCancelPolicy() async {
    var parsedCheckin;
    var parsedCheckOut;
    if (newCheckinDate.value != "" &&
        newCheckoutDate.value != "" &&
        isDateShown.value == true) {
      parsedCheckin = newCheckinDate.value;
      parsedCheckOut = newCheckoutDate.value;
    } else {
      parsedCheckin = acController.orgnewChekin.value;
      parsedCheckOut = acController.orgnewChekout.value;
    }
    var iwtxData = await {
      "room": newRoomCount.value != ""
          ? iwtxAgeDetail
          : acController.iwtxAgedetailOrg,
      "startDate":
          "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
      "endDate":
          "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
      "nationality": acController.orgNativeCode.value,
      "groupByRooms": "Y",
      "cancellationPolicy": "Y",
      "hotelCode": "101-355",
      "searchRoomDTOs": newRoomCount.value != ""
          ? iwtxRoomDetail
          : acController.iwtxRoomdetailOrg
    };

    print("theiwtx dataaa--------==>${iwtxData}");

    // var response = await http.post(
    //     Uri.parse("${baseUrl}custom/iwtx/hotelSearch"),
    //     headers: {"apikey": header},
    //     body: iwtxData);

    // if (response.statusCode == 200) {
    // } else {}
  }

  //''''''''''''''''''''''''''''''''''
//'''''''''''''''''''''''''''''

//fetchroom type if room details or date changed

  List roomCategory = [].obs;

  var selectedRoomCategory = "".obs;
  var selectedRoomCategoryId = "".obs;
  var selectedRoomCategoryRate = "".obs;
  var isRoomtypeLoading = true.obs;

  fetchRoomTypeidEdited() async {
    print("Godddddddddddddddd${accommodationDetails}");
    isRoomtypeLoading.value = true;
    //adult agedata raw 1
    List<Map<String, dynamic>> adultAgeData = [];
    adultAgeData.clear();

    var length = newRoomCount.value != ""
        ? newRoomCount.value
        : acController.orgRoomcount.value;

    for (int i = 0; i < int.parse(length); i++) {
      List<Map<String, dynamic>> adultList = [];
      adultList.clear();
      for (int j = 0;
          j <
              int.parse(newRoomCount.value != ""
                  ? accommodationDetails[i]["NoOfAdult"]
                  : acController.orgAccomodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList.add({"age": 25});
      }

      adultAgeData.add({
        "adult": adultList,
      });
    }

    print("rawdataaa==>${adultAgeData}");

    //===================

//child and adult age data raw 2

    List<Map<String, dynamic>> childnAdultAge = [];
    childnAdultAge.clear();
    var length1 = newRoomCount.value != ""
        ? newRoomCount.value
        : acController.orgRoomcount.value;

    for (int i = 0; i < int.parse(length1); i++) {
      // List<Map<String, dynamic>> adultList = [];
      List<int> adultList = [];

      for (int j = 0;
          j <
              int.parse(newRoomCount.value != ""
                  ? accommodationDetails[i]["NoOfAdult"]
                  : acController.orgAccomodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList.add(25);
      }

      List<int> childAges = [];

      for (int k = 0;
          k <
              int.parse(newRoomCount.value != ""
                  ? accommodationDetails[i]["NoOfChild"]
                  : acController.orgAccomodationDetails[i]["NoOfChild"]);
          k++) {
        if (newRoomCount.value != ""
            ? accommodationDetails[i]["ChildAges"] != []
            : acController.orgAccomodationDetails[i]["ChildAges"] != []) {
          childAges.add(int.parse(newRoomCount.value != ""
              ? accommodationDetails[i]["ChildAges"][k].toString()
              : acController.orgAccomodationDetails[i]["ChildAges"][k]
                  .toString()));
        }
      }

      childnAdultAge.add({
        "childAge": childAges,
        "adultAge": adultList,
      });
    }
    print("childadageee--->${childnAdultAge}");

//=========================

//searchroomDTo raw 3

    List<Map<String, dynamic>> searchRoomDTOs = [];
    var length2 = newRoomCount.value != ""
        ? newRoomCount.value
        : acController.orgRoomcount.value;

    for (int i = 0; i < int.parse(length2); i++) {
      List<int> adultList2 = [];
      adultList2.clear();

      for (int j = 0;
          j <
              int.parse(newRoomCount.value != ""
                  ? accommodationDetails[i]["NoOfAdult"]
                  : acController.orgAccomodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList2.add(25);
      }

      Map<String, dynamic> data2 = {
        "roomcount": i + 1,
        'adult': newRoomCount.value != ""
            ? accommodationDetails[i]["NoOfAdult"]
            : acController.orgAccomodationDetails[i]["NoOfAdult"],
        'child': newRoomCount.value != ""
            ? accommodationDetails[i]["NoOfChild"]
            : acController.orgAccomodationDetails[i]["NoOfChild"],
        "childAge": newRoomCount.value != ""
            ? accommodationDetails[i]["ChildAges"]
            : acController.orgAccomodationDetails[i]["ChildAges"],
        "adultAge": adultList2,
      };

      searchRoomDTOs.add(data2);
    }
    print("searchroomdto====>>${searchRoomDTOs}");

    ///=============================
    ///
    ///
    ///
    List<Map<String, dynamic>> dataListinHouse = [];

    var length3 = newRoomCount.value != ""
        ? newRoomCount.value
        : acController.orgRoomcount.value;

    for (int i = 0; i < int.parse(length3.toString()); i++) {
      Map<String, dynamic> data = {
        "roomcount": i + 1,
        'adult': newRoomCount.value != ""
            ? accommodationDetails[i]["NoOfAdult"]
            : acController.orgAccomodationDetails[i]["NoOfAdult"],
        'child': newRoomCount.value != ""
            ? accommodationDetails[i]["NoOfChild"]
            : acController.orgAccomodationDetails[i]["NoOfChild"],
        "childAge": newRoomCount.value != ""
            ? accommodationDetails[i]["ChildAges"]
            : acController.orgAccomodationDetails[i]["ChildAges"],
      };

      dataListinHouse.add(data);
    }
//==========================
    //body raw data

    var roomData = {
      "hotelDTO": {
        "checkIn": newCheckinDate.value != ""
            ? "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))}"
            : "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekin.value))}",
        "checkOut": newCheckoutDate.value != ""
            ? "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))}"
            : "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekout.value))}",
        "native_country_id": "${acController.orgNativeCode.value}",
        "noOfRooms": newRoomCount.value != ""
            ? newRoomCount.value
            : acController.orgRoomcount.toString(),
        "countStart": 0,
        "id": 0,
        "countLast": "4",
        "agent_id": userId,
        "searchCityorCountry_id": "${acController.orgDesCode}",
        "searchCorCtype": "${acController.orgDesType}",
        "searchRoomDTO": newRoomCount.value != ""
            ? dataListinHouse
            : acController.orginHaccDetails,
        "destinationHotel": "${acController.orgDestination}",
        "startDate": newCheckinDate.value != ""
            ? "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))}"
            : "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekin.value))}",
        "endDate": newCheckoutDate.value != ""
            ? "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))}"
            : "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekout.value))}",
        "hotelCode": "259-284294",
        "nationality": "${acController.orgNativeCode2.value}",
        "groupByRooms": "Y",
        "cancellationPolicy": "Y",
        "room": adultAgeData
      },
      "iwtxDTO": {
        "room": childnAdultAge,
        "startDate": newCheckinDate.value != ""
            ? "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))}"
            : "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekin.value))}",
        "endDate": newCheckoutDate.value != ""
            ? "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))}"
            : "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(acController.orgnewChekout.value))}",
        "nationality": "${acController.orgNativeCode}",
        "groupByRooms": "Y",
        "cancellationPolicy": "Y",
        "hotelCode": "137-901789",
        "searchRoomDTOs": searchRoomDTOs,
        "agentId": userId
      }
    };
    print("rooooooooooooommediteddddd=======>${roomData}");

    // ==========================

    var response = await http.post(
      Uri.parse("${baseUrl}custom/roomCategoryListAPIout"),
      body: jsonEncode(roomData),
      headers: {
        'apikey': header,
        'Content-Type': 'application/json',
      },
    );

    roomCategory.clear();

    if (response.statusCode == 200) {
      print(hotelCode);
      // print("roomtypeeee=====>>>${response.body}");

      var jsonString = jsonDecode(response.body);
      print(jsonString);
      // print(
      //     "veryy nyssss===>>${jsonString["data"][0]["inhouse_roomshotelsRooms"]["data"][1]}");

      print(jsonString["data"][0]["inhouse_rooms"]["data"][1]);

      List datasroom = jsonString["data"][0]["inhouse_rooms"]["data"][1];

      if (datasroom.isEmpty) {
        print("object");
        isNoRoomAvailable.value = true;

        print("no room");
      } else {
        for (int i = 0;
            i < jsonString["data"][0]["inhouse_rooms"]["data"][1].length;
            i++) {
          var hotelData = jsonString["data"][0]["inhouse_rooms"]["data"][1][i];
          if (hotelData["hotel_code"] == hotelCode) {
            isNoRoomAvailable.value = false;

            for (int i = 0;
                i < hotelData["searchHotelRoomsDTOList"].length;
                i++) {
              roomCategory.add([
                hotelData["searchHotelRoomsDTOList"][i]["roomCategory"],
                hotelData["searchHotelRoomsDTOList"][i]["hotel_roomtype_id"],
                hotelData["searchHotelRoomsDTOList"][i]["totalRate"]
              ]);
            }
            if (roomCategory.isNotEmpty) {
              selectedRoomCategory.value = roomCategory[0][0];
              selectedRoomCategoryId.value = roomCategory[0][1].toString();
              selectedRoomCategoryRate.value = roomCategory[0][2].toString();
            }
          }
        }
      }
      print("cattt-->${selectedRoomCategoryId.value}");

      print("success");

      isRoomtypeLoading.value = false;
    } else {
      print("failed");
    }
  }

  var isNoRoomAvailable = false.obs;

  @override
  void onInit() {
    print("object");
    fetchRoomTypeidEdited();
    // atharvaCancelPolicy();
    //iwtxCancelPolicy();
    super.onInit();
  }
}
