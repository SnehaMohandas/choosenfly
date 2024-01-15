import 'dart:convert';

import 'package:choose_n_fly/model/all_hotels_model.dart';
import 'package:choose_n_fly/model/destination_model.dart';
import 'package:choose_n_fly/model/native_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AccomodationController extends GetxController {
  //destination ,native country dropdown values
  //'''''''''''''''''''''''''''''''''
  //'''''''''''''''''''''''''''''''''
  List<DestinationModel>? destinationModel;
  List<NativeModel>? nativeModel;
  List<AllHotelModel>? allHotelModel;

  List native = [].obs;
  var selectedNatCountry = ''.obs; //(eg:America)
  var selectedNativeCode = ''.obs; //(eg:12)
  var selectedNativeCode2 = ''.obs; //(eg:US)

  var noNatSelected =
      false.obs; //validation msg showing while native country not selected

  List destination = [].obs;
  var selectedDestinaion = ''.obs; //(eg:America)
  var selectedDesCode = ''.obs; //(eg:0~253~2)
  var selectedDesType = ''.obs; //(eg:states)

  var nodestSelected =
      false.obs; //validation msg showing while destination country not selected
  //'''''''''''''''''''''''''''''''
  //'''''''''''''''''''''''''''''''

  var checkInDate = "".obs; // for showing checkindate on date dialogue
  var newCheckinDate = ""
      .obs; // for showing checkin on accommodation screen when clicking on submit button of date dialogue
  var newCheckoutDate = ""
      .obs; // for showing checkout on accommodation screen when clicking on submit button of date dialogue

  DateTime?
      checkin; // for showing initialdate in datepicker select checkin .it want DateTime format
  var checkOutDate = "".obs; // for showing checkoutdate on date dialogue
  DateTime?
      checkout; // for showing last date in datepicker select checkin and initian date in datepickr select checkout .it want DateTime format
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
      // initialDate: checkInDate.value != ""
      //     ? DateTime.parse(checkInDate.value)
      //: DateTime.now(),
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

  var roomCount = "1".obs;
  var newRoomCount = "".obs;

  var selectedChildIndex = "0".obs;
  List selectedDdindex = <String>["true"].obs;
  var adultDdnum = ["1"].obs;
  RxInt guestTotal = 0.obs;

  var childDdnum = ["0"].obs;
  List<List<dynamic>> ageTextControllers = [[]];
  var isValidate = false.obs;
  var isSearchtapped = false.obs;
  var isNativeNotSelected = false.obs;
  var isDestNotSelected = false.obs;

  var isDateNotSelected = false.obs;
  var isRoomNotSelected = false.obs;
  List<List> allAgeOrgs = [];

  //row data for posting accommodation(differ for inhouse )
  var inHaccDetails;
  var accommodationDetails;

  //row data for getting cancellation policy(differ for iwtx,jumera,inh)
  var atharvaroomDetail;
  var iwtxageDetail;
  var iwtxRoomdetail;
  var jumeraRoomdetail;

  //for converting into a single list of hotel
  Map<String, dynamic>? currentItem;
  List allItems = [];

  //searchHotels

  var isHotelLoading = false.obs;

  Future postAccommodation() async {
    allItems = [];
    try {
      isHotelLoading.value = true;

      final Map<String, dynamic> requestData = {
        "hotelDTO": {
          "checkIn": DateFormat('dd/MM/yyyy')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekin.value))
              .toString(),
          "checkOut": DateFormat('dd/MM/yyyy')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekout.value))
              .toString(),
          "native_country_id": orgNativeCode.value.toString().toString(),
          "noOfRooms": orgRoomcount.value.toString(),
          "countStart": 0,
          "id": 0,
          "countLast": "4",
          "agent_id": "5",
          "searchCityorCountry_id": orgDesCode.value.toString(),
          "searchCorCtype": orgDesType.value.toString(),
          "searchRoomDTO": orginHaccDetails,
          "destinationHotel": orgDestination.value.toString(),
          "startDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekin.value))
              .toString(),
          "endDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekout.value))
              .toString()
        },
        "atharvaReq": {
          "CheckInDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekin.value))
              .toString(),
          "CheckOutDate": DateFormat('yyyy-MM-dd')
              .format(DateFormat('MMM-dd-yyyy').parse(orgnewChekout.value))
              .toString(),
          "CityId": orgDesCode.split("~").isNotEmpty
              ? orgDesCode.split("~").last.toString()
              : "",
          "NationalityId": orgNativeCode.value.toString(),
          "countryOrCityId": orgDesCode.value.toString(),
          "RoomDetail": orgAccomodationDetails
        }
      };
      print("reqdatsaa=====>>>${jsonEncode(requestData)}");
      var response =
          await http.post(Uri.parse("${baseUrl}custom/searchAllHotelsAPIout"),
              headers: {
                'apikey': header,
                'Content-Type': 'application/json',
              },
              body: jsonEncode(requestData));
      if (response.statusCode == 200) {
        print("bodyyy-->${json.decode(response.body)}");
        print("object");
        var data = allHotelModelFromJson(response.body);
        allHotelModel = data;
        print(allHotelModel);

        for (int i = 0; i < allHotelModel![0].iwtxHotels!.data[1].length; i++) {
          currentItem = allHotelModel![0].iwtxHotels!.data[1][i];
          allItems.add(currentItem);
        }
        for (int i = 0;
            i < allHotelModel![1].inhouseHotels!.data[1].length;
            i++) {
          currentItem = allHotelModel![1].inhouseHotels!.data[1][i];
          allItems.add(currentItem);
        }
        for (int i = 0;
            i < allHotelModel![2].atharvaHotels!.data[1].length;
            i++) {
          currentItem = allHotelModel![2].atharvaHotels!.data[1][i];
          allItems.add(currentItem);
        }

        for (int i = 0;
            i < allHotelModel![3].jumeirahHotels!.data[1].length;
            i++) {
          currentItem = allHotelModel![3].jumeirahHotels!.data[1][i];
          allItems.add(currentItem);
        }

        print("allhotelsss===>>>${allItems}");
      } else {
        print("not 200");
      }
    } catch (e) {
      print(e);
    } finally {
      isHotelLoading.value = false;
    }
  }

  //////''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  /////''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  //********orginal details

  //date and country originals

  var orgnewChekin = "".obs;
  var orgnewChekout = "".obs;
  var orgDestination = "".obs;
  var orgDesCode = "".obs;
  var orgDesType = "".obs;
  var orgNativeCode = "".obs;
  var orgNativeCode2 = "".obs;
  var orgNatCountry = "".obs;

  //row data for posting accommodation(differ for inhouse )

  var orgAccomodationDetails;
  var orginHaccDetails;
  //==============

  //row data for getting cancellation policy(differ for iwtx,jumera,inh)
  var atharvaroomDetailOrg;
  var iwtxRoomdetailOrg;
  var iwtxAgedetailOrg;
  var jumeraRoomdetailOrg;
  //========

//room and guest detail original
  var orgRoomcount = "".obs;
  RxInt orgguestTotal = 0.obs;

  var isLoading = true.obs;
  var exceptionCatched = false.obs;
  List? mappedAges;

  //'''''''''''''''''''''''''''''''''''''''''

//'''''''''''''''''''''''''''''''''''''''''''''''''''

  //fetching destination
  FetchDestination(searchKey) async {
    try {
      var exceptionCatched = false.obs;

      var response = await http.get(
          Uri.parse("${baseUrl}custom/destinationAPIout?term=${searchKey}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = destinationModelFromJson(response.body);
        destinationModel = data;
        for (int i = 0; i < destinationModel!.length; i++) {
          // destination.add(destinationModel![i].hotelDetails);
          destinationList!.add([
            destinationModel![i].hotelDetails,
            destinationModel![i].hotelCode,
            destinationModel![i].hotelType
          ]);
        }
      } else {
        exceptionCatched.value = true;
        print("000000");
      }

      await FetchNative();
      isLoading.value = false;
    } catch (e) {
    } finally {}
  }

  //fetch native
  FetchNative() async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/nationalityAPIout"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = nativeModelFromJson(response.body);
        nativeModel = data;
        for (int i = 0; i < nativeModel!.length; i++) {
          // nat.add(nativeModel![i].hotelDetails);
          nativeList!.add([
            nativeModel![i].name,
            nativeModel![i].countryId,
            nativeModel![i].countryCode
          ]);
        }
        print(nativeList);
      } else {
        exceptionCatched.value = true;
        print("000000");
      }
    } catch (e) {
    } finally {}
  }

  //'''''''''''''''''''''''''''''''''''''''''''''
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''

//initially select 1 room 1 guest
  initial() async {
    isSubLoading.value = true;

    allAgeOrgs.clear();
    num adultSum = adultDdnum.fold(0, (previous, current) {
      if (current is num) {
        return previous + int.parse(current);
      } else if (current is String) {
        return previous + (num.tryParse(current) ?? 0);
      } else {
        return previous;
      }
    });

    num childSum = childDdnum.fold(0, (previous, current) {
      if (current is num) {
        return previous + int.parse(current);
      } else if (current is String) {
        return previous + (num.tryParse(current) ?? 0);
      } else {
        return previous;
      }
    });
    guestTotal.value = adultSum.toInt() + childSum.toInt();

    newRoomCount.value = roomCount.value;

    for (int i = 0; i < int.parse(newRoomCount.value.toString()); i++) {
      mappedAges = ageTextControllers[i].map((e) => int.parse(e.text)).toList();

      allAgeOrgs.add(mappedAges!);
    }

    accommodationDetails = getEnteredData();

    inHaccDetails = getEnteredDataforinHouse();
    atharvaroomDetail = atharvaCancellationDatas();
    iwtxRoomdetail = iwtxCancellationDatas();
    iwtxageDetail = iwtxCancellationAgeDatas();

    isSubLoading.value = false;
  }

// initially select checkin and checkout date
  initialDate() {
    if (checkInDate.value == "" || checkOutDate.value == "") {
      // Handle error, maybe show a message to the user
    } else {
      newCheckinDate.value = checkInDate.value;
      newCheckoutDate.value = checkOutDate.value;
      isnightError.value = false;
      isDateShown.value =
          true; // Check if the night value is not already set, then set a default value
      if (nitController.text.isEmpty) {
        nitController.text = "1";
      }
    }
  }

  List<Map<String, dynamic>> getEnteredData() {
    List<Map<String, dynamic>> dataList = [];

    var length = newRoomCount.value != "" ? newRoomCount.value : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      Map<String, dynamic> data = {
        "RoomSrNo": newRoomCount.value != "" ? (i + 1) : 0,
        'NoOfAdult': adultDdnum[i] != 0 ? adultDdnum[i] : 0.toString(),
        'NoOfChild': childDdnum[i] == 0
            ? 0.toString()
            : childDdnum[i] != 0
                ? childDdnum[i]
                : 0.toString(),
        if (allAgeOrgs[i].isNotEmpty)
          "ChildAges": allAgeOrgs[i]
        else if (allAgeOrgs[i].isEmpty)
          "ChildAges": []
      };

      dataList.add(data);
    }

    return dataList;
  }

  List<Map<String, dynamic>> getEnteredDataforinHouse() {
    List<Map<String, dynamic>> dataListinHouse = [];

    var length = newRoomCount.value != "" ? newRoomCount.value : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      Map<String, dynamic> data = {
        "roomcount": newRoomCount.value != "" ? (i + 1) : 0,
        'adult': adultDdnum[i] != 0 ? adultDdnum[i] : 0.toString(),
        'child': childDdnum[i] == 0
            ? 0.toString()
            : childDdnum[i] != 0
                ? childDdnum[i]
                : 0.toString(),
        if (allAgeOrgs[i].isNotEmpty)
          "childAge": allAgeOrgs[i]
        else if (allAgeOrgs[i].isEmpty)
          "childAge": []
      };

      dataListinHouse.add(data);
    }

    return dataListinHouse;
  }

  //'''''''''''''''''''''''''''''''''''''''''''
//''''''''''''''''''''''''''''''''''''''''''''''''''''

//for cancellationpolicy atharva data detail
  List<Map<String, dynamic>> atharvaCancellationDatas() {
    List<Map<String, dynamic>> dataListatharvaCancel = [];

    var length = newRoomCount.value != "" ? newRoomCount.value : 1;

    for (int i = 0; i < int.parse(length.toString()); i++) {
      Map<String, dynamic> data = {
        "RoomSrNo": newRoomCount.value != "" ? (i + 1) : 0,
        'NoOfAdult': adultDdnum[i] != 0 ? adultDdnum[i] : 0.toString(),
        'NoOfChild': childDdnum[i] == 0
            ? 0.toString()
            : childDdnum[i] != 0
                ? childDdnum[i]
                : 0.toString(),
        "RateKey": "thcttyd7egsTTu/+T5KfO0TtoK0W2Ftmi7ENr3G8Nw4=",
        if (allAgeOrgs[i].isNotEmpty)
          "ChildAges": allAgeOrgs[i]
        else if (allAgeOrgs[i].isEmpty)
          "ChildAges": []
      };

      dataListatharvaCancel.add(data);
    }

    return dataListatharvaCancel;
  }

  //for cancellationpolicy iwtx data detail
  List<Map<String, dynamic>> iwtxCancellationDatas() {
    List<Map<String, dynamic>> dataListiwtxCancel = [];

    var length = newRoomCount.value != "" ? newRoomCount.value : 1;

    List adultage = [];
    adultage.clear();

    for (int i = 0; i < int.parse(length.toString()); i++) {
      List<int> adultage = List.generate(
        int.parse(adultDdnum[i]),
        (index) => 25,
      );
      Map<String, dynamic> data = {
        "roomcount": newRoomCount.value != "" ? (i + 1) : 0,
        'adult': adultDdnum[i] != 0 ? adultDdnum[i] : 0.toString(),
        'child': childDdnum[i] == 0
            ? 0.toString()
            : childDdnum[i] != 0
                ? childDdnum[i]
                : 0.toString(),
        if (allAgeOrgs[i].isNotEmpty)
          "childAge": allAgeOrgs[i]
        else if (allAgeOrgs[i].isEmpty)
          "childAge": [],
        "adultAges": adultage
      };

      dataListiwtxCancel.add(data);
    }

    return dataListiwtxCancel;
  }

  List<Map<String, dynamic>> iwtxCancellationAgeDatas() {
    List<Map<String, dynamic>> dataListiwtxAgeCancel = [];

    var length = newRoomCount.value != "" ? newRoomCount.value : 1;

    List adultage = [];
    adultage.clear();

    for (int i = 0; i < int.parse(length.toString()); i++) {
      List<int> adultage = List.generate(
        int.parse(adultDdnum[i]),
        (index) => 25,
      );
      Map<String, dynamic> data = {
        if (allAgeOrgs[i].isNotEmpty)
          "childAge": allAgeOrgs[i]
        else if (allAgeOrgs[i].isEmpty)
          "childAge": [],
        "adultAges": adultage
      };

      dataListiwtxAgeCancel.add(data);
    }

    return dataListiwtxAgeCancel;
  }
//'''''''''''''''''''''''
//''''''''''''''''''''''''''''''

  @override
  void onInit() async {
    if (destinationList!.isEmpty && nativeList!.isEmpty) {
      destinationList!.clear();
      nativeList!.clear();

      FetchDestination("");
    } else {
      isLoading.value = false;
    }
    initial();
    checkin = DateTime.now();
    checkout = checkin!.add(Duration(days: 1));
    checkInDate.value = DateFormat('MMM-dd-yyyy').format(checkin!);
    checkOutDate.value = DateFormat('MMM-dd-yyyy').format(checkout!);
    nitController.text = "1";
    if (checkin != null && checkout != null) {
      dateforCal1 = checkin;
      dateforCal2 = checkout;
      nigtCalculate();
    }
    initialDate();

    super.onInit();
  }
}
