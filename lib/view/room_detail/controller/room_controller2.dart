import 'dart:convert';

import 'package:choose_n_fly/model/cancellation_policy_model.dart';
import 'package:choose_n_fly/model/hotel_details_model.dart';
import 'package:choose_n_fly/model/iwtx_cancel_policy_model.dart';
import 'package:choose_n_fly/model/room_category.dart';
import 'package:choose_n_fly/model/room_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RoomController2 extends GetxController {
  final platform;
  String nightCount;
  AccomodationController acController;
  String hotelCode;
  String hotelcodeForDetail;
  var hotelIdForInJumerah = "".obs;

  RoomController2(this.nightCount, this.acController, this.hotelCode,
      this.platform, this.hotelcodeForDetail);

  List<String> salutaion2 = ["Mr.", "Mrs", "Ms", "Master"];

  List<String> salutation1 = ["Mr.", "Mrs.", "Ms."];

  List<String> gender = ["Male", "Female"];
  var selectedSalutation1 = "Mr.".obs;

  var selectedSalutation2 = [].obs;
  var selectedGender = [].obs;

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
    DateTime dateWithMidnight =
        DateTime(dateforCal1!.year, dateforCal1!.month, dateforCal1!.day);
    difference.value = dateforCal2!.difference(dateWithMidnight!.toUtc());

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
              : DateTime.now().add(Duration(days: 1)),
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
  //RxInt guestTotal = 0.obs;
  RxInt? guestTotal;

  //`````````````````````````````~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  List<Map<String, dynamic>> dataListinHouse = [];

//'''''''''''''''''''''''''
// cancellation policy
//''''''''''''''''''''''''''''

  var cancePolicyloading = true.obs;

  //''''''''''''''''''''''''''''''''''
//'''''''''''''''''''''''''''''

//fetchroom type if room details or date changed

//{{{{{{{for inhouse datas

  var selectedRoomCategory = "".obs;
  var selectedRoomCategoryId = "".obs;
  var selectedRoomCategoryRate = "".obs;
  var selectedCurrCode = "".obs;
  var selectedMealType = "".obs;
  var selectedRoomRatePlanId = "".obs;
  var selectedRoomTypeCode = "".obs;

  Map<String, dynamic>? selectedRoomData;
  List roomcategorydata = [].obs;
  var SelecteddropdownIndex = "0".obs;
  //}}}}}}}

  var isNoRoomAvailable = false.obs;

  var isRoomtypeLoading = true.obs;

  fetchRoomTypeidEdited() async {
    isRoomtypeLoading.value = true;
    selectedRoomCategory.value = "";
    selectedRoomCategoryId.value = "";
    selectedRoomCategoryRate.value = "";
    selectedCurrCode.value = "";
    selectedMealType.value = "";
    selectedRoomData = {};
    SelecteddropdownIndex.value = "0";
    selectedRoomRatePlanId.value = "";
    hotelIdForInJumerah.value = "";
    selectedRoomTypeCode.value = "";
    cancelPolicy.clear();

    isNoRoomAvailable.value = false;
    roomcategorydata.clear();
    //adult agedata raw 1 for inhouseDTO
    List<Map<String, dynamic>> adultAgeData = [];
    adultAgeData.clear();

    var length = newRoomCount.value;

    for (int i = 0; i < int.parse(length); i++) {
      List<Map<String, dynamic>> adultList = [];
      adultList.clear();
      for (int j = 0;
          j < int.parse(accommodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList.add({"age": 25});
      }

      adultAgeData.add({
        "adult": adultList,
      });
    }

    // print("rawdataaa==>${adultAgeData}");

    //===================

//child and adult age data raw 2 for iwtxDTO

    List<Map<String, dynamic>> childnAdultAge = [];
    childnAdultAge.clear();
    var length1 = newRoomCount.value;

    for (int i = 0; i < int.parse(length1); i++) {
      // List<Map<String, dynamic>> adultList = [];
      List<int> adultList = [];

      for (int j = 0;
          j < int.parse(accommodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList.add(25);
      }

      List<int> childAges = [];

      for (int k = 0;
          k < int.parse(accommodationDetails[i]["NoOfChild"]);
          k++) {
        if (accommodationDetails[i]["ChildAges"] != []) {
          childAges.add(
              int.parse(accommodationDetails[i]["ChildAges"][k].toString()));
        }
      }

      childnAdultAge.add({
        "childAge": childAges,
        "adultAge": adultList,
      });
    }
    //print("childadageee--->${childnAdultAge}");

//=========================

//searchroomDTo raw 3 for iwtxDTO

    List<Map<String, dynamic>> searchRoomDTOs = [];
    var length2 = newRoomCount.value;

    for (int i = 0; i < int.parse(length2); i++) {
      List<int> adultList2 = [];
      adultList2.clear();

      for (int j = 0;
          j < int.parse(accommodationDetails[i]["NoOfAdult"]);
          j++) {
        adultList2.add(25);
      }

      Map<String, dynamic> data2 = {
        "roomcount": i + 1,
        'adult': accommodationDetails[i]["NoOfAdult"],
        'child': accommodationDetails[i]["NoOfChild"],
        "childAge": accommodationDetails[i]["ChildAges"],
        "adultAge": adultList2,
      };

      searchRoomDTOs.add(data2);
    }
    //======================
    //for inhouseDTO
    List<Map<String, dynamic>> dataListinHouse = [];

    var length3 = newRoomCount.value;

    for (int i = 0; i < int.parse(length3.toString()); i++) {
      Map<String, dynamic> data = {
        "roomcount": i + 1,
        'adult': accommodationDetails[i]["NoOfAdult"],
        'child': accommodationDetails[i]["NoOfChild"],
        "childAge": accommodationDetails[i]["ChildAges"],
      };

      dataListinHouse.add(data);
    }
//==========================
    //body raw data
    var roomData;
    if (platform == "0" || platform == "10") {
      roomData = {
        "hotelDTO": {
          "checkIn": DateFormat('dd/MM/yyyy')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))
              .toString(),
          "checkOut": DateFormat('dd/MM/yyyy')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))
              .toString(),
          "native_country_id": acController.orgNativeCode.value.toString(),
          "noOfRooms": newRoomCount.value,
          "countStart": 0,
          "id": 0,
          "countLast": "4",
          "agent_id": userId,
          "searchCityorCountry_id": "${acController.orgDesCode}",
          "searchCorCtype": "${acController.orgDesType}",
          "searchRoomDTO": dataListinHouse,
          "destinationHotel": "${acController.orgDestination}",
          "startDate": DateFormat('yyyyMMdd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))
              .toString(),
          "endDate": DateFormat('yyyyMMdd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))
              .toString(),
          "hotelCode": hotelCode,
          "nationality": acController.orgNativeCode2.value.toString(),
          "groupByRooms": "Y",
          "cancellationPolicy": "Y",
          "room": adultAgeData
        }
      };
    } else if (platform == "12") {
      roomData = {
        "iwtxDTO": {
          "room": childnAdultAge,
          "startDate": DateFormat('yyyyMMdd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))
              .toString(),
          "endDate": DateFormat('yyyyMMdd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))
              .toString(),
          "nationality": "${acController.orgNativeCode}",
          "groupByRooms": "Y",
          "cancellationPolicy": "Y",
          "hotelCode": hotelCode.toString(),
          "searchRoomDTOs": searchRoomDTOs,
          "agentId": userId
        }
      };
    } else {
      roomData = {
        "atharvaDTO": {
          "CheckInDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckinDate.value))
              .toString(),
          "CheckOutDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(newCheckoutDate.value))
              .toString(),
          "HCode": hotelCode.toString(),
          "CityId": acController.orgDesCode.split("~").isNotEmpty
              ? acController.orgDesCode.split("~").last.toString()
              : "",
          "NationalityId": acController.orgNativeCode.value.toString(),
          "RoomDetail": accommodationDetails,
          "agentId": userId.toString()
        },
      };
      //     {
      //   "atharvaDTO": {
      //     "CheckInDate": "2024-02-07",
      //     "CheckOutDate": "2024-02-08",
      //     "HCode": "DXB9890543",
      //     "CityId":acController. orgDesCode.split("~").isNotEmpty
      //         ? acController. orgDesCode.split("~").last.toString()
      //         : "",
      //     "NationalityId": "235",
      //     "RoomDetail": [
      //       {"RoomSrNo": 1, "NoOfAdult": "1", "NoOfChild": "0", "ChildAges": []}
      //     ],
      //     "agentId": "5"
      //   }

      // };
    }

    print("rooooooooooooommediteddddd=======>${roomData}");
    print("this is hotelcodeeeee===>${hotelCode}");

    // ==========================

    String orginalHotelcode;
    if (platform == "10") {
      orginalHotelcode = hotelCode;
    } else {
      orginalHotelcode = "BAA";
    }
    print("orgg--${orginalHotelcode}");
    print("rooommddddddd===>${roomData}");
    print(
        "${baseUrl}custom/roomCategoryListAPIout?hotelCode=${orginalHotelcode}");

    try {
      var response = await http.post(
        Uri.parse(
            "${baseUrl}custom/roomCategoryListAPIout?hotelCode=${orginalHotelcode}"),
        body: jsonEncode(roomData),
        headers: {
          'apikey': header,
          'Content-Type': 'application/json',
        },
      );

      // roomCategory.clear();

      if (response.statusCode == 200) {
        //''''''''''''''''''''''''''''

        var jsonString = jsonDecode(response.body);

        //if inhouse
        //'''''''''''''''''''''''''
        print("platformm==>${platform}");

        if (platform == "0") {
          print("inhouse");
          List datasroom = jsonString["data"][0]["inhouse_rooms"]["data"][1];

          if (datasroom.isEmpty) {
            isNoRoomAvailable.value = true;
            print("abc");
          } else {
            for (int i = 0; i < datasroom.length; i++) {
              var hotelData = datasroom[i];
              if (hotelData["hotel_code"] == hotelCode) {
                isNoRoomAvailable.value = false;
                roomcategorydata = hotelData["searchHotelRoomsDTOList"];

                selectedRoomCategory.value =
                    roomcategorydata[0]["roomCategory"];
                selectedRoomCategoryId.value =
                    roomcategorydata[0]["intoken"].toString();
                selectedRoomCategoryRate.value =
                    double.parse(roomcategorydata[0]["totalRate"].toString())
                        .round()
                        .toString();
                selectedCurrCode.value = "";
                selectedMealType.value = roomcategorydata[0]["roomType"];
                hotelIdForInJumerah.value =
                    roomcategorydata[0]["hotel_id"].toString();

                selectedRoomData = roomcategorydata[0];
              }
            }
            if (roomcategorydata.isEmpty) {
              isNoRoomAvailable.value = true;
            }
          }

          //  print(roomcategorydata);
          print(selectedRoomCategory.value);
          print(selectedRoomCategoryId.value);
          print(selectedRoomCategoryRate.value);
        }

        //'''''''''''''''''''''''''''''''''''''''''''''''''''
        else if (platform == "12") {
          Map<String, dynamic> datasroom =
              jsonString["data"][0]["iwtx_rooms"]["data"];

          if (datasroom["hotels"]["hotel"] == null) {
            isNoRoomAvailable.value = true;
          } else {
            //List roomDataiwtx = [];
            isNoRoomAvailable.value = false;
            for (int i = 0;
                i <
                    datasroom["hotels"]["hotel"]["roomTypeDetails"]["rooms"]
                            ["room"]
                        .length;
                i++) {
              roomcategorydata.addAll([
                datasroom["hotels"]["hotel"]["roomTypeDetails"]["rooms"]["room"]
                    [i]
              ]);
              // print("rrrrr${roomcategorydata}");
              selectedRoomCategory.value = roomcategorydata[0]["roomType"];

              selectedRoomCategoryRate.value =
                  double.parse(roomcategorydata[0]["totalRate"].toString())
                      .round()
                      .toString();
              selectedCurrCode.value = roomcategorydata[0]["currCode"];
              selectedMealType.value = roomcategorydata[0]["mealPlan"];
              selectedRoomRatePlanId.value =
                  roomcategorydata[0]["ratePlanId"].toString();
              selectedRoomTypeCode.value =
                  roomcategorydata[0]["roomTypeCode"].toString();
              selectedRoomData = roomcategorydata[0];
            }

            if (roomcategorydata.isEmpty) {
              isNoRoomAvailable.value = true;
            }
          }

          // print(roomcategorydata);
          print(selectedRoomCategory.value);
          print(selectedRoomCategoryId.value);
          print(selectedRoomCategoryRate.value);
        }
        //''''''''''''''''''''''''''''''''''''''''''
        else if (platform == "11") {
          print("atharva");
        }
        //''''''''''''''''''''''''''''''''''''''
        else {
          List datasroom = jsonString["data"][1]["jumeirah_rooms"]["data"];

          if (datasroom.isEmpty ||
              datasroom[0]["searchHotelRoomsDTOList"].isEmpty) {
            isNoRoomAvailable.value = true;
            cancePolicyloading.value = false;
            print("78999877");

            print("abc");
          } else {
            print("0000000");
            for (int i = 0; i < datasroom.length; i++) {
              var hotelData = datasroom[i];
              isNoRoomAvailable.value = false;
              roomcategorydata = hotelData["searchHotelRoomsDTOList"];

              selectedRoomCategory.value = roomcategorydata[0]["roomCategory"];
              selectedRoomCategoryId.value =
                  roomcategorydata[0]["intoken"].toString();
              selectedRoomCategoryRate.value =
                  double.parse(roomcategorydata[0]["totalRate"].toString())
                      .round()
                      .toString();
              selectedCurrCode.value =
                  roomcategorydata[0]["cancellation_policy"]["currency_code"];
              if (roomcategorydata[0]["breakfast_included"] == true &&
                  roomcategorydata[0]["lunch_included"] == true &&
                  roomcategorydata[0]["dinner_included"] == true)
                selectedMealType.value =
                    "Room With BreakFast, Lunch And Dinner Included";
              else if (roomcategorydata[0]["breakfast_included"] == true &&
                  roomcategorydata[0]["lunch_included"] == true)
                selectedMealType.value =
                    "Room With BreakFast And Lunch Included";
              else if (roomcategorydata[0]["breakfast_included"] == true &&
                  roomcategorydata[0]["dinner_included"] == true)
                selectedMealType.value =
                    "Room With BreakFast And Dinner Included";
              else if (roomcategorydata[0]["lunch_included"] == true &&
                  roomcategorydata[0]["dinner_included"] == true)
                selectedMealType.value = "Room With Lunch And Dinner Included";
              else if (roomcategorydata[0]["breakfast_included"] == true)
                selectedMealType.value = "Room With BreakFast Included";
              else if (roomcategorydata[0]["lunch_included"] == true)
                selectedMealType.value = "Room With Lunch Included";
              else if (roomcategorydata[0]["dinner_included"] == true)
                selectedMealType.value = "Room With Dinner Included";
              else
                selectedMealType.value = "Room Only";
              //selectedMealType.value = roomcategorydata[0]["roomType"];
              hotelIdForInJumerah.value =
                  roomcategorydata[0]["hotel_id"].toString();

              selectedRoomData = roomcategorydata[0];
            }
            if (roomcategorydata.isEmpty) {
              isNoRoomAvailable.value = true;
            }
          }

          //print(roomcategorydata);
          print(selectedRoomCategory.value);
          print(selectedRoomCategoryId.value);
          print(selectedRoomCategoryRate.value);
        }
        //'''''''''''''''''''''''''''''''''''''''''''''
        if (isNoRoomAvailable.value == false) {
          await cancellationPolicy();
        }

        isRoomtypeLoading.value = false;
      } else {
        print("failed");
      }
    } on Exception catch (e) {
      print("exception catched===>${e}");
    }
  }

//==================================

  CancellationPolicyModel? cancellationPolicyModel;
  List<dynamic> cancelPolicyRoomsiwtx = [];
  Map<String, dynamic>? desiredRoom;
  var cancelPolicy = [].obs;
  var atharvaData;

  cancellationPolicy() async {
    try {
      cancePolicyloading.value = true;
      var parsedCheckin;
      var parsedCheckOut;
      if (isDateShown.value == true) {
        parsedCheckin = newCheckinDate.value;
        parsedCheckOut = newCheckoutDate.value;
      } else {
        parsedCheckin = acController.orgnewChekin.value;
        parsedCheckOut = acController.orgnewChekout.value;
      }
      atharvaData = await {
        "CityId": acController.orgDesCode.split("~").isNotEmpty
            ? acController.orgDesCode.split("~").last.toString()
            : "",
        "NationalityId": acController.orgNativeCode.value,
        "CheckInDate":
            "${DateFormat('yyyy-MM-dd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
        "CheckOutDate":
            "${DateFormat('yyyy-MM-dd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
        "HCode": hotelCode,
        "VoucherBooking": "false",
        "TokenId":
            "77f467af-978e-4952-a25f-a1943b4618b8~!^~JWVNHw7MwLZ3I/slypsn61JDML+MaI9esBcCQJlHkbdrKsz7N6KyHumS/hF4e6O4+Uz5AUpSjZlzgWoNZ7LWBA==",
        "HKey":
            "tWrEobmjNTKLzD2aWWm9BQElOCzl7rTfK6csL+UEREZ5WRVDlctDDw32qzsUrfll/m6G0K7SAdcWnFZZAuM1gyTDobw798Op1bzTemakll7FgUyT+eebFvQldAZMJ+pd",
        "RoomDetail": atharvaroomDetail
      };

      cancelPolicy.clear();

      if (isDateShown.value == true) {
        parsedCheckin = newCheckinDate.value;
        parsedCheckOut = newCheckoutDate.value;
      } else {
        parsedCheckin = acController.orgnewChekin.value;
        parsedCheckOut = acController.orgnewChekout.value;
      }

      var data;
      if (platform == "0" || platform == "10") {
        data = {
          "parameterRateBookingDTO": {
            "checkIn":
                "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
            "checkOut":
                "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
            "native_country_id": acController.orgNativeCode.value,
            "noOfRooms": newRoomCount.value,
            "agent_id": userId.toString(),
            "token": selectedRoomCategoryId.value.toString(),
            "type": "1",
            "hid": platform == "0" || platform == "10"
                ? hotelIdForInJumerah.value
                : "0",
            "searchRoomDTO": dataListinHouse,
          },
        };
      } else if (platform == "12") {
        data = {
          "parameterRateBookingDTO": {
            "checkIn":
                "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
            "checkOut":
                "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
            "native_country_id": acController.orgNativeCode.value,
            "noOfRooms": newRoomCount.value,
            "agent_id": userId.toString(),
            "token": selectedRoomCategoryId.value.toString(),
            "type": "1",
            "hid": platform == "0" || platform == "10"
                ? hotelIdForInJumerah.value
                : "0",
            "searchRoomDTO": dataListinHouse,
          },
          "iwtxDTO": {
            "room": iwtxAgeDetail,
            "startDate":
                "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
            "endDate":
                "${DateFormat('yyyyMMdd').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
            "nationality": acController.orgNativeCode.value,
            "groupByRooms": "Y",
            "cancellationPolicy": "Y",
            "hotelCode": hotelCode,
            "searchRoomDTOs": iwtxRoomDetail,
            "agentId": userId.toString()
          }
        };
      } else {
        data = {
          "atharvaHotelPreBooking": atharvaData,
        };
      }

      print("cccaaancelll-=-=-=-=${data}");
      var response = await http.post(
        Uri.parse(
            "${baseUrl}custom/cancellationPolicySingleAPIout?type=policy"),
        body: jsonEncode(data),
        headers: {
          'apikey': header,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("object");
        print(json.decode(response.body)["data"]);
        var jsonString = json.decode(response.body);

        if (platform == "0" || platform == "10") {
          cancelPolicy.value =
              jsonString["data"][0]["inhouse_jumeirah_policyDetails"]["data"];
          print("cccccc.....${cancelPolicy.value}");
        } else if (platform == "12") {
          if (newRoomCount.value == "1") {
            cancelPolicyRoomsiwtx = jsonString["data"][1]["iwtx_policyDetails"]
                ["data"]['hotels']['hotel']['roomTypeDetails']['rooms']['room'];
            print("choosenflyyy---cancell=----${cancelPolicyRoomsiwtx}");

            for (var room in cancelPolicyRoomsiwtx) {
              if (room['ratePlanId'].toString() ==
                      selectedRoomRatePlanId.value &&
                  room['roomTypeCode'].toString() ==
                      selectedRoomTypeCode.value) {
                desiredRoom = room;
                break;
              }
            }

            if (desiredRoom != null &&
                desiredRoom!["cancellationPolicyDetails"]["cancellation"] !=
                    null) {
              cancelPolicy.value =
                  desiredRoom!['cancellationPolicyDetails']['cancellation'];

              print(
                  'Cancellation Policy Details for Room with ratePlanId 678642 and roomTypeCode 16306766:');
            }
          } else {
            cancelPolicyRoomsiwtx = jsonString["data"][1]["iwtx_policyDetails"]
                ["data"]['Hotels']['Hotel']['RoomTypeDetails']['Rooms']['Room'];

            for (var room in cancelPolicyRoomsiwtx) {
              if (room['RatePlanId'].toString() ==
                      selectedRoomRatePlanId.value &&
                  room['RoomTypeCode'].toString() ==
                      selectedRoomTypeCode.value) {
                desiredRoom = room;
                break;
              }
            }

            if (desiredRoom != null &&
                desiredRoom!["CancellationPolicyDetails"]["Cancellation"] !=
                    null) {
              cancelPolicy.value =
                  desiredRoom!['CancellationPolicyDetails']['Cancellation'];
              print("multyroom workeddddd");

              print(
                  'Cancellation Policy Details for Room with ratePlanId 678642 and roomTypeCode 16306766:');
            }
          }
        }
      } else {
        print("ooppps");
      }
    } on Exception catch (e) {
      print("canceltn policy exception catched====>${e}");
    }
    cancePolicyloading.value = false;
  }

//================================
//fetching hotel details(description,image)

  HotelDetailsModel? hotelDetailsModel;
  var hotelimg = [].obs;
  var hotelDescription = "".obs;
  var hotelAddress = "".obs;
  var hoteldetailLoading = true.obs;
  fetchHotelDetails() async {
    hoteldetailLoading.value = true;

    var data = {
      "hotelId": hotelcodeForDetail,
      "atharva_hotel_code": hotelcodeForDetail,
      "jumeirah_hotel_code": hotelcodeForDetail,
      "iwtx_hotel_code": hotelcodeForDetail
    };
    var response = await http.post(
      Uri.parse("${baseUrl}custom/hotelDescriptionDetailsAPIOut"),
      body: jsonEncode(data),
      headers: {
        'apikey': header,
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      hotelimg.clear();
      print(hotelCode);
      hotelDetailsModel = hotelDetailsModelFromJson(response.body);
      print(hotelDetailsModel);

      if (platform == "0") {
        for (var list in hotelDetailsModel!.data[0].inhouseHotelDetails!.data
            .hotelImageList) hotelimg.addAll([list.imageName]);

        hotelDescription.value =
            hotelDetailsModel!.data[0].inhouseHotelDetails!.data.description;
        hotelAddress.value =
            hotelDetailsModel!.data[0].inhouseHotelDetails!.data.address;

        print(hotelimg);
      }
      if (platform == "11") {
        for (var list in hotelDetailsModel!.data[1].atharvaHotelDetails!.data)
          hotelimg.addAll([list.images]);

        hotelDescription.value =
            hotelDetailsModel!.data[1].atharvaHotelDetails!.data[0].description;
        hotelAddress.value =
            hotelDetailsModel!.data[1].atharvaHotelDetails!.data[0].address;

        print(hotelimg);
      }

      if (platform == "10") {
        for (var list in hotelDetailsModel!.data[2].jumeirahHotelDetails!.data)
          hotelimg.addAll([list.images]);

        hotelAddress.value =
            hotelDetailsModel!.data[2].jumeirahHotelDetails!.data[0].address;

        print(hotelimg);
      }
      if (platform == "12") {
        if (hotelDetailsModel!.data[3].iwtxHotelDetails!.data.isEmpty) {
        } else {
          for (var list in hotelDetailsModel!.data[3].iwtxHotelDetails!.data)
            hotelimg.addAll([list.imagesurl]);

          hotelAddress.value =
              hotelDetailsModel!.data[3].iwtxHotelDetails!.data[0].hotelAddress;

          print(hotelimg);
        }
      }

      print("hellooo");
    } else {
      print("hayyyy");
    }
    hoteldetailLoading.value = false;
  }

  @override
  void onInit() async {
    newRoomCount.value = acController.orgRoomcount.value;
    newCheckinDate.value = acController.orgnewChekin.value;
    newCheckoutDate.value = acController.orgnewChekout.value;
    accommodationDetails = acController.orgAccomodationDetails;
    adultDdnum.value = acController.orgAdultDDNum;
    childDdnum.value = acController.orgChildddNum;
    allAgeOrgs = acController.orgnalAges;
    iwtxAgeDetail = acController.iwtxAgedetailOrg;
    iwtxRoomDetail = acController.iwtxRoomdetailOrg;
    dataListinHouse = acController.orginHaccDetails;
    atharvaroomDetail = acController.atharvaroomDetailOrg;

    guestTotal = acController.orgguestTotal.value.obs;

    print("roomcounttt===${newRoomCount.value}");

    print("checkinnn===${newCheckinDate.value}");

    print("checkoutttt===${newCheckoutDate.value}");

    print("accommodetaill===${accommodationDetails}");

    print("adultdddnum===${adultDdnum.value}");
    print("childddnummm===${childDdnum.value}");

    print("allageorgsss===${allAgeOrgs}");

    print("iwtxagedtailssss===${iwtxAgeDetail}");

    print("datalistinhouseee===${dataListinHouse}");
    print("atharvaroooommdtaill===${atharvaroomDetail}");

    print("guestttttt====${guestTotal}");

    print("hotelcode==>${hotelIdForInJumerah.value}");
    await fetchRoomTypeidEdited();
    await fetchHotelDetails();

    super.onInit();
  }
}
