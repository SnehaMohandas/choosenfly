import 'dart:convert';

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
  var hotelIdForInJumerah = "".obs;

  RoomController2(
      this.nightCount, this.acController, this.hotelCode, this.platform);

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

  var cancePolicyloading = true.obs;

  inhouseJumerahCancelPolicy() async {
    cancePolicyloading.value = true;
    var parsedCheckin;
    var parsedCheckOut;
    cancelPolicy.clear();
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
    if (newCheckinDate.value != "" &&
        newCheckoutDate.value != "" &&
        isDateShown.value == true) {
      parsedCheckin = newCheckinDate.value;
      parsedCheckOut = newCheckoutDate.value;
    } else {
      parsedCheckin = acController.orgnewChekin.value;
      parsedCheckOut = acController.orgnewChekout.value;
    }
    var inhouseData = await {
      "checkIn":
          "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckin))}",
      "checkOut":
          "${DateFormat('dd/MM/yyyy').format(DateFormat('MMM-dd-yyyy').parse(parsedCheckOut))}",
      "native_country_id": acController.orgNativeCode.value,
      "noOfRooms": newRoomCount.value != ""
          ? newRoomCount.value
          : acController.orgRoomcount.value,
      "token": selectedRoomCategoryId.value.toString(),
      "type": "1",
      "hid": hotelIdForInJumerah.value,
      "searchRoomDTO": newRoomCount.value != ""
          ? dataListinHouse
          : acController.orginHaccDetails,
      //"agentId": userId
    };

    print("inhouseeee dataaa--------==>${inhouseData}");

    var response = await http.post(
        Uri.parse("${baseUrl}custom/inhouseCancellationPolicyAPIout"),
        headers: {"apikey": header, 'Content-Type': 'application/json'},
        body: jsonEncode(inhouseData));

    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      cancelPolicy.value = jsonString;
      // print(jsonString);
      // for (int i = 0; i < jsonString.length; i++) {
      //   cancelPolicy.addAll(jsonString[i]["policyRemark"]);
      // }
      cancePolicyloading.value = false;
      print(cancelPolicy.value);
    } else {
      print("fails");
    }
  }

  atharvaCancelPolicy() async {
    // cancelPolicyloading.value = true;

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

    print("atharvaaaa dataaa--------==>${atharvaData}");

    // var response=await  http.post(Uri.parse("${baseUrl}custom/atharva/hotelPreBooking?type=policy"),
    // headers: {
    //   "apikey":header
    // },
    // body: atharvaData);

    // if(response.statusCode==200){

    // }
    // else{

    // }
    //cancelPolicyloading.value = false;
  }

  IwtxCancelPolicyModel? iwtxCancelPolicyModel;
  List<dynamic> cancelPolicyRoomsiwtx = [];
  Map<String, dynamic>? desiredRoom;
  var cancelPolicy = [].obs;
  // var cancelPolicyloading = true.obs;

  iwtxCancelPolicy() async {
    //cancelPolicyloading.value = true;
    var parsedCheckin;
    var parsedCheckOut;
    cancelPolicy.clear();

    cancelPolicyRoomsiwtx.clear();
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
      "hotelCode": hotelCode,
      "searchRoomDTOs": newRoomCount.value != ""
          ? iwtxRoomDetail
          : acController.iwtxRoomdetailOrg,
      "agentId": userId
    };

    print("iwtx dataaa--------==>${iwtxData}");

    var response = await http.post(
        Uri.parse("${baseUrl}custom/iwtxCancellationPolicyAPIout"),
        headers: {"apikey": header, 'Content-Type': 'application/json'},
        body: jsonEncode(iwtxData));

    if (response.statusCode == 200) {
      //iwtxCancelPolicyModel = iwtxCancelPolicyModelFromJson(response.body);
      var jsonString = json.decode(response.body);
      cancelPolicyRoomsiwtx =
          jsonString['hotels']['hotel']['roomTypeDetails']['rooms']['room'];

      // Find the room with the specified ratePlanId and roomTypeCode
      // desiredRoom;
      for (var room in cancelPolicyRoomsiwtx) {
        if (room['ratePlanId'].toString() == selectedRoomRatePlanId.value &&
            room['roomTypeCode'].toString() == selectedRoomTypeCode.value) {
          desiredRoom = room;
          break;
        }
      }

      // Check if the desired room was found
      if (desiredRoom != null &&
          desiredRoom!["cancellationPolicyDetails"]["cancellation"] != null) {
        // Extract cancellation policy details
        cancelPolicy.value =
            desiredRoom!['cancellationPolicyDetails']['cancellation'];

        // Now, 'cancellationPolicy' contains the cancellation details for the specified room
        print(
            'Cancellation Policy Details for Room with ratePlanId 678642 and roomTypeCode 16306766:');
        print(cancelPolicy);
      } else {
        print(
            'Room with ratePlanId 678642 and roomTypeCode 16306766 not found.');
      }

      //  cancelPolicyloading.value = false;
      // print("iwtxcccaancelll-0-00-00-${response.body}");
    } else {
      print("fails");
    }
  }

  //''''''''''''''''''''''''''''''''''
//'''''''''''''''''''''''''''''

//fetchroom type if room details or date changed

//{{{{{{{for inhouse datas

  var selectedRoomCategory = "".obs;
  var selectedRoomCategoryId = "".obs;
  var selectedRoomCategoryRate = "".obs;
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
    selectedRoomData = {};
    SelecteddropdownIndex.value = "0";
    selectedRoomRatePlanId.value = "";
    hotelIdForInJumerah.value = "";
    selectedRoomTypeCode.value = "";
    cancelPolicy.clear();

    isNoRoomAvailable.value = false;
    roomcategorydata.clear();
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
    // print("searchroomdto====>>${searchRoomDTOs}");

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
        // "hotelCode": "259-284294",
        "hotelCode": hotelCode,
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
        "hotelCode": "${hotelCode}",
        "searchRoomDTOs": searchRoomDTOs,
        "agentId": userId
      }
    };
    //print("rooooooooooooommediteddddd=======>${roomData}");
    print("ithaannnnn hotelcodeeeee===>${hotelCode}");

    // ==========================

    String orginalHotelcode;
    if (platform == "10") {
      orginalHotelcode = hotelCode;
    } else {
      orginalHotelcode = "BAA";
    }
    print("orgg--${orginalHotelcode}");
    print("rooommddddddd===>${roomData}");

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

              selectedRoomCategory.value = roomcategorydata[0]["roomCategory"];
              selectedRoomCategoryId.value =
                  roomcategorydata[0]["intoken"].toString();
              selectedRoomCategoryRate.value =
                  roomcategorydata[0]["totalRate"].toString();
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
            jsonString["data"][2]["iwtx_rooms"]["data"];

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
            // selectedRoomCategoryId.value =
            //     //roomcategorydata[0]["roomTypeCode"].toString();
            //     roomcategorydata[0]["roomTypeCode"].toString();
            selectedRoomCategoryRate.value =
                roomcategorydata[0]["totalRate"].toString();
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

        print("ayyoooo");
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

        if (datasroom.isEmpty) {
          isNoRoomAvailable.value = true;
          print("abc");
        } else {
          for (int i = 0; i < datasroom.length; i++) {
            var hotelData = datasroom[i];
            isNoRoomAvailable.value = false;
            roomcategorydata = hotelData["searchHotelRoomsDTOList"];

            selectedRoomCategory.value = roomcategorydata[0]["roomCategory"];
            selectedRoomCategoryId.value =
                roomcategorydata[0]["intoken"].toString();
            selectedRoomCategoryRate.value =
                roomcategorydata[0]["totalRate"].toString();
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
        if (platform == "0" || platform == "10") {
          inhouseJumerahCancelPolicy();
        } else if (platform == "12") {
          iwtxCancelPolicy();
        } else if (platform == "11") {
          atharvaCancelPolicy();
        }
      }
      // else  if (isNoRoomAvailable.value == true) {
      //     cancelPolicyloading.value = false;
      //   }

      isRoomtypeLoading.value = false;
    } else {
      print("failed");
    }
  }

  @override
  void onInit() async {
    print("hotelcode==>${hotelIdForInJumerah.value}");
    await fetchRoomTypeidEdited();
    // atharvaCancelPolicy();
    // if (platform == "12" && isNoRoomAvailable.value == false) {
    //   iwtxCancelPolicy();
    // } else if (platform == "0" ||
    //     platform == "10" && isNoRoomAvailable.value == false) {
    //   inhouseJumerahCancelPolicy();
    // } else if (platform == "11" && isNoRoomAvailable.value == false) {
    //   atharvaCancelPolicy();
    // }
    super.onInit();
  }
}
