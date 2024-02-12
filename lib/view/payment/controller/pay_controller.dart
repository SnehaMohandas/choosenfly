import 'dart:convert';

import 'package:choose_n_fly/model/inouse_booking_model.dart';
import 'package:choose_n_fly/model/wallet_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/accommodation/controller/acc_controller.dart';
import 'package:choose_n_fly/view/booking/book_form_controller.dart';
import 'package:choose_n_fly/view/booking_details/booking_dtail.dart';
import 'package:choose_n_fly/view/room_detail/controller/room_controller2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PayController extends GetxController {
  final platform;
  final checkIn;
  final checkOut;
  final hotelId;
  final adultCount;
  final childCount;
  //final totalPrice;

  final selectedRoomcategoryData;
  var selectedValue = 'Wallet'.obs;
  PayController({
    required this.platform,
    required this.checkIn,
    required this.checkOut,
    required this.hotelId,
    required this.adultCount,
    required this.childCount,
    required this.selectedRoomcategoryData,
  });
  @override
  void onInit() {
    print(selectedRoomcategoryData);
    print(adultCount);
    print(childCount);
    super.onInit();
  }

  var bookFormController = Get.find<BookFormController>();
  var roomController = Get.find<RoomController2>();
  var acController = Get.find<AccomodationController>();

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  WalletModel? walletModel;
  String? bookinId;
  String? hotelBookingId;

  walletChecking(amount) async {
    var response = await http.get(
        Uri.parse("${baseUrl}custom/agentCreditLimitAPIout?agentId=${userId}"),
        headers: {'apikey': header});
    if (response.statusCode == 200) {
      print("object");
      var data = walletModelFromJson(response.body);
      walletModel = data;
      availableLimit = walletModel!.availableLimit;
      print(availableLimit);
      print(amount);

      if (double.parse(amount.toString()) > int.parse(availableLimit)) {
        print("low");
        Fluttertoast.showToast(
            msg: "Booking failed! insufficient balance in your wallet");
        Get.offAll(() => BookingDetail());

        print(availableLimit);
        //payment api
      } else {
        Fluttertoast.showToast(msg: "Booking successful");
        await walletPayment();
        Get.offAll(() => BookingDetail());

        print("loww");
      }
    }
  }

  //credit payment

  walletPayment() async {
    var response = await http.get(Uri.parse(
        "${baseUrl}custom/paymentFromCartAPIout?bookingId=${bookinId}&hotelBookingId=${hotelBookingId}"));
    if (response.statusCode == 200) {
      print("success1");
      if (json.decode(response.body)["staus"] == 200) {
        print("success2");
        Fluttertoast.showToast(
            msg: "Payment Successfully done through Credit limit");
      } else {
        Fluttertoast.showToast(msg: "Payment failed");
      }
    }
  }

//inhouse booking

  InhouseBookingModel? inhouseBookingModel;

  inhouseBooking(roomDetail) async {
    print(selectedRoomcategoryData);
    print(roomDetail);

    var data = {
      "customBookingHotelDTO": {
        "employee_id": "",
        "customerDTO": bookFormController.leaddata,
        "customBookingHotelDetailsDTO": [
          {
            "apitype": "${platform}",
            "checkIn": DateFormat('dd/MM/yyyy')
                .format(DateFormat('MMM-dd-yyyy').parse(checkIn))
                .toString(),
            "refund":
                selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"][0]
                        ["eachDayRoomList"][0]["refund"]
                    .toString(),
            "remark": "",
            "specialremark": "",
            "checkOut": DateFormat('dd/MM/yyyy')
                .format(DateFormat('MMM-dd-yyyy').parse(checkOut))
                .toString(),
            //TEST hotel only
            "hotel_id": "291",
            //hotelId.toString(),
            "paymentStatus": "NOTPAID",
            "hotelbooking_id": "0",
            "sellingprice":
                selectedRoomcategoryData["totalRateWithMarkup"].toString(),
            "totalprice": selectedRoomcategoryData["totalRate"].toString(),
            "tourism_dirhams": "0",
            "customBookingHotelRoomCategoryList": [
              {
                "booking_room_id": "0",

                //            TEST hotel only

                "room_category_id": "2224",
                // selectedRoomcategoryData["hotel_room_category_id"]
                //     .toString(),
                "share_type_id": "0",
                //TEST hotel only

                "room_type_id": "3994",
                // selectedRoomcategoryData["hotel_roomtype_id"].toString(),

                "occupancy_id":
                    selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                            [0]["occupancy_id"]
                        .toString(),
                "price": "0",
                "no_of_adult": adultCount.toString(),
                "no_of_child": childCount.toString(),
                "no_of_rooms": roomDetail.length.toString(),
                "meal_plan_id":
                    selectedRoomcategoryData["meal_plan_code"].toString(),
                "childAge_Array":
                    selectedRoomcategoryData["filterHotelRoomsOccupancyDTOList"]
                        [0]["givenChildAge"],
                "hotelCompulsoryBookingDTOs": [],
                "guestdetailsDTOArray": bookFormController.guestFormdata == null
                    ? []
                    : bookFormController.guestFormdata,
                "roomBookingDayRatesDTOs": [
                  {
                    "currDate": DateFormat('dd/MM/yyyy')
                        .format(DateFormat('MMM-dd-yyyy').parse(checkIn))
                        .toString(),
                    "costPrice": "1",
                    "sellingPrice":
                        selectedRoomcategoryData["totalRateWithMarkup"]
                            .toString(),
                    "roomRate": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["roomRate"]
                        .toString(),
                    "eventRate": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["eventRate"]
                        .toString(),
                    "adultExtraBedRate": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["adultExtraBedRate"]
                        .toString(),
                    "childExtraBedRate": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["childExtraBedRate"]
                        .toString(),
                    "roomRateWithMarkup": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["roomRateWithMarkup"]
                        .toString(),
                    "eventRateWithMarkup": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["eventRateWithMarkup"]
                        .toString(),
                    "rateCode": selectedRoomcategoryData[
                                "filterHotelRoomsOccupancyDTOList"][0]
                            ["eachDayRoomList"][0]["priceCode"]
                        .toString(),
                    "adultExtraBedRateWithMarkup": selectedRoomcategoryData[
                                    "filterHotelRoomsOccupancyDTOList"][0]
                                ["eachDayRoomList"][0]
                            ["adultExtraBedRateWithMarkup"]
                        .toString(),
                    "childExtraBedRateWithMarkup": selectedRoomcategoryData[
                                    "filterHotelRoomsOccupancyDTOList"][0]
                                ["eachDayRoomList"][0]
                            ["childExtraBedRateWithMarkup"]
                        .toString()
                  }
                ],
                "room_type_code": null,
                "rate_plan_code": null
              }
            ],
            "hotelBookingDayRatesDTOs": [],
            "paymentapi_id": "",
          }
        ],
        "total_cost": 1,
        "paymentapi_id": ""
      }
    };

    print("datatattata=====>>>>>${data}");

    var response = await http.post(
        Uri.parse(
            "${baseUrl}custom/singleHotelBookingAPIout?hotelType=inhouse"),
        headers: {
          'apikey': header,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data));

    print("booking detaillslresponse not 200000${response.body}");

    if (response.statusCode == 200) {
      inhouseBookingModel = inhouseBookingModelFromJson(response.body);
      bookinId = inhouseBookingModel!.data.bookingId;
      hotelBookingId = inhouseBookingModel!.data.hotelBookingId;

      //print("booking detaillsl${json.decode(response.body)}");
      walletChecking(inhouseBookingModel!.data.balancePayment);
    }
  }

  //atharva prebooking

  atharvaBooking() async {
    var response = await http.post(
      Uri.parse("${baseUrl}custom/atharvaPreBookingAPIout?type=prebook"),
      body: jsonEncode(roomController.atharvaData),
      headers: {
        'apikey': header,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {}
  }

  //atharva main booking

  atharvaMainBooking() {
    var data = {
      "CustomBookingHotelDTO": {
        "agent_id": int.parse(userId.toString()),
        "customer_id": 152,
        "hotelId": int.parse(hotelId),
        "customerDTO": {}
      },
      "AtharvaHotelBooking": {
        "CityId": int.parse(acController.selectedDesCode.value),
        "NationalityId": int.parse(acController.selectedNativeCode.value),
        "CheckInDate": DateFormat('yyyy-MM/dd')
            .format(DateFormat('MMM-dd-yyyy').parse(checkIn))
            .toString(),
        "CheckOutDate": DateFormat('yyyy-MM/dd')
            .format(DateFormat('MMM-dd-yyyy').parse(checkOut))
            .toString(),
        "HCode": roomController.hotelCode.toString(),
        "TokenId":
            "ab27545b-0b4f-4ccb-8e3c-c6dbcc380410~!^~ZpfJeqS0KIkmrq0wnKDNJjOEeQfDXdykpEloocNgyUsNBjSoXb76AAr2pXkvFRgNRV73TX8903LJTnuAXZIa4g==",
        "HKey":
            "KuvW3788fm0pUVitzTLU1tRb0OcZgigqp2L5lSRQCFay4dDv3jFeQhRxjAx0EcMh9UuLLKnwMU1WvTmW2HHIadnFi6sz38cg01CSSOsbOo9M58GqqMnbnwlEYdFQ1cCj",
        "ClientRefNo": "AATHARVA00234",
        "ExpectedAmount": 2934.66,
        "AirlineName": "Emirates",
        "AirlinePNR": "12546356789",
        "VoucherBooking": "false",
        "RoomDetail": [
          {
            "RoomSrNo": 1,
            "NoOfAdult": 1,
            "NoOfChild": 0,
            "RateKey": "SyDjocKNa89JwBijPbUF9jbLQOMAplhX5re2aF6QolY=",
            "PaxDetails": [
              {
                "PaxSrNo": 1,
                "IsChild": "false",
                "Title": "Mr.",
                "FirstName": "TestA",
                //required this.totalPrice,
                "LastName": "Atharva",
                "ChildAge": 0,
                "PassportNo": "123456"
              }
            ]
          }
        ]
      }
    };
  }

//iwtx booking

  iwtxBooking() {
    var data = {
      "CustomBookingHotelDTO": {
        "agent_id": 5,
        "customer_id": 152,
        "hotelId": hotelId,
        "customerDTO": {}
      },
      "HotelBookingRequest": {
        "PassengerDetails": {
          "Passenger": [
            {
              "PaxNumber": 1,
              "RoomNo": 1,
              "Title": "Mr",
              "PassengerType": "ADT",
              "Age": 32,
              "FirstName": "JOhn",
              "LastName": "SamIllusions",
              "Nationality": "FR",
              "Gender": "M"
            },
            {
              "PaxNumber": 2,
              "RoomNo": 1,
              "Title": "Mr",
              "PassengerType": "ADT",
              "Age": 32,
              "FirstName": "Johnson",
              "LastName": "SamIllusions",
              "Nationality": "FR",
              "Gender": "M"
            },
            {
              "PaxNumber": 3,
              "RoomNo": 2,
              "Title": "Mr",
              "PassengerType": "ADT",
              "Age": 30,
              "FirstName": "GBR",
              "LastName": "GBR",
              "Nationality": "FR",
              "Gender": "M"
            }
          ]
        },
        "HotelDetails": {
          "HotelCode": "259-284294",
          "StartDate": 20231028,
          "EndDate": 20231029,
          "AgencyRef": "SAMTNS101",
          "RoomDetails": {
            "Room": [
              {
                "RoomTypeCode": 851,
                "ContractTokenId": 17550,
                "MealPlanCode": 7,
                "RoomConfigurationId": 1,
                "Rate": 1263.01
              },
              {
                "RoomTypeCode": 851,
                "ContractTokenId": 17550,
                "MealPlanCode": 7,
                "RoomConfigurationId": 2,
                "Rate": 1263.01
              }
            ]
          }
        }
      }
    };
  }
}
