// To parse this JSON data, do
//
//     final iwtxCancelPolicyModel = iwtxCancelPolicyModelFromJson(jsonString);

import 'dart:convert';

IwtxCancelPolicyModel iwtxCancelPolicyModelFromJson(String str) =>
    IwtxCancelPolicyModel.fromJson(json.decode(str));

String iwtxCancelPolicyModelToJson(IwtxCancelPolicyModel data) =>
    json.encode(data.toJson());

class IwtxCancelPolicyModel {
  dynamic errorMsg;
  Hotels hotels;

  IwtxCancelPolicyModel({
    required this.errorMsg,
    required this.hotels,
  });

  factory IwtxCancelPolicyModel.fromJson(Map<String, dynamic> json) =>
      IwtxCancelPolicyModel(
        errorMsg: json["errorMsg"],
        hotels: Hotels.fromJson(json["hotels"]),
      );

  Map<String, dynamic> toJson() => {
        "errorMsg": errorMsg,
        "hotels": hotels.toJson(),
      };
}

class Hotels {
  Hotel hotel;

  Hotels({
    required this.hotel,
  });

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        hotel: Hotel.fromJson(json["hotel"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel": hotel.toJson(),
      };
}

class Hotel {
  String country;
  String propertyType;
  String preferredStatus;
  String chain;
  String restriction;
  RoomTypeDetails roomTypeDetails;
  int hotelId;
  String hotelName;
  String hotelCode;
  String city;
  int startDate;
  int endDate;
  int sourceId;
  int starRating;
  GeoLocation geoLocation;

  Hotel({
    required this.country,
    required this.propertyType,
    required this.preferredStatus,
    required this.chain,
    required this.restriction,
    required this.roomTypeDetails,
    required this.hotelId,
    required this.hotelName,
    required this.hotelCode,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.sourceId,
    required this.starRating,
    required this.geoLocation,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        country: json["country"],
        propertyType: json["propertyType"],
        preferredStatus: json["preferredStatus"],
        chain: json["chain"],
        restriction: json["restriction"],
        roomTypeDetails: RoomTypeDetails.fromJson(json["roomTypeDetails"]),
        hotelId: json["hotelId"],
        hotelName: json["hotelName"],
        hotelCode: json["hotelCode"],
        city: json["city"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        sourceId: json["sourceId"],
        starRating: json["starRating"],
        geoLocation: GeoLocation.fromJson(json["geoLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "propertyType": propertyType,
        "preferredStatus": preferredStatus,
        "chain": chain,
        "restriction": restriction,
        "roomTypeDetails": roomTypeDetails.toJson(),
        "hotelId": hotelId,
        "hotelName": hotelName,
        "hotelCode": hotelCode,
        "city": city,
        "startDate": startDate,
        "endDate": endDate,
        "sourceId": sourceId,
        "starRating": starRating,
        "geoLocation": geoLocation.toJson(),
      };
}

class GeoLocation {
  double latitude;
  double longitude;

  GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class RoomTypeDetails {
  Rooms rooms;

  RoomTypeDetails({
    required this.rooms,
  });

  factory RoomTypeDetails.fromJson(Map<String, dynamic> json) =>
      RoomTypeDetails(
        rooms: Rooms.fromJson(json["rooms"]),
      );

  Map<String, dynamic> toJson() => {
        "rooms": rooms.toJson(),
      };
}

class Rooms {
  List<Room> room;

  Rooms({
    required this.room,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        room: List<Room>.from(json["room"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "room": List<dynamic>.from(room.map((x) => x.toJson())),
      };
}

class Room {
  double totalRateWithMarkup;
  int roomNumber;
  String roomType;
  String rateDetails;
  int roomNo;
  double totalRate;
  double rate;
  int roomTypeCode;
  int mealPlanCode;
  int contractTokenId;
  int roomConfigurationId;
  String buyRate;
  String commissionSellCharges;
  String taxSellCharges;
  CancellationPolicyDetails cancellationPolicyDetails;
  DynamicYn promotionalContract;
  DynamicYn packageYn;
  DynamicYn nonRefundable;
  DynamicYn dynamicYn;
  int rateBeforeTax;
  int totalDiscount;
  bool recommendedRetailPrice;
  ContractLabel contractLabel;
  RoomStatus roomStatus;
  String roomTypeSupplierCode;
  BlackOut blackOut;
  CurrCode currCode;
  String ratePlanCode;
  int ratePlanId;
  MealPlan mealPlan;
  int numberOfMeals;

  Room({
    required this.totalRateWithMarkup,
    required this.roomNumber,
    required this.roomType,
    required this.rateDetails,
    required this.roomNo,
    required this.totalRate,
    required this.rate,
    required this.roomTypeCode,
    required this.mealPlanCode,
    required this.contractTokenId,
    required this.roomConfigurationId,
    required this.buyRate,
    required this.commissionSellCharges,
    required this.taxSellCharges,
    required this.cancellationPolicyDetails,
    required this.promotionalContract,
    required this.packageYn,
    required this.nonRefundable,
    required this.dynamicYn,
    required this.rateBeforeTax,
    required this.totalDiscount,
    required this.recommendedRetailPrice,
    required this.contractLabel,
    required this.roomStatus,
    required this.roomTypeSupplierCode,
    required this.blackOut,
    required this.currCode,
    required this.ratePlanCode,
    required this.ratePlanId,
    required this.mealPlan,
    required this.numberOfMeals,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        totalRateWithMarkup: json["totalRateWithMarkup"]?.toDouble(),
        roomNumber: json["roomNumber"],
        roomType: json["roomType"],
        rateDetails: json["rateDetails"],
        roomNo: json["roomNo"],
        totalRate: json["totalRate"]?.toDouble(),
        rate: json["rate"]?.toDouble(),
        roomTypeCode: json["roomTypeCode"],
        mealPlanCode: json["mealPlanCode"],
        contractTokenId: json["contractTokenId"],
        roomConfigurationId: json["roomConfigurationId"],
        buyRate: json["buyRate"],
        commissionSellCharges: json["commissionSellCharges"],
        taxSellCharges: json["taxSellCharges"],
        cancellationPolicyDetails: CancellationPolicyDetails.fromJson(
            json["cancellationPolicyDetails"] ?? ""),
        promotionalContract: dynamicYnValues.map[json["promotionalContract"]]!,
        packageYn: dynamicYnValues.map[json["packageYN"]]!,
        nonRefundable: dynamicYnValues.map[json["nonRefundable"]]!,
        dynamicYn: dynamicYnValues.map[json["dynamicYN"]]!,
        rateBeforeTax: json["rateBeforeTax"],
        totalDiscount: json["totalDiscount"],
        recommendedRetailPrice: json["recommendedRetailPrice"],
        contractLabel: contractLabelValues.map[json["contractLabel"]]!,
        roomStatus: roomStatusValues.map[json["roomStatus"]]!,
        roomTypeSupplierCode: json["roomTypeSupplierCode"],
        blackOut: BlackOut.fromJson(json["blackOut"] ?? ""),
        currCode: currCodeValues.map[json["currCode"]]!,
        ratePlanCode: json["ratePlanCode"],
        ratePlanId: json["ratePlanId"],
        mealPlan: mealPlanValues.map[json["mealPlan"]]!,
        numberOfMeals: json["numberOfMeals"],
      );

  Map<String, dynamic> toJson() => {
        "totalRateWithMarkup": totalRateWithMarkup,
        "roomNumber": roomNumber,
        "roomType": roomType,
        "rateDetails": rateDetails,
        "roomNo": roomNo,
        "totalRate": totalRate,
        "rate": rate,
        "roomTypeCode": roomTypeCode,
        "mealPlanCode": mealPlanCode,
        "contractTokenId": contractTokenId,
        "roomConfigurationId": roomConfigurationId,
        "buyRate": buyRate,
        "commissionSellCharges": commissionSellCharges,
        "taxSellCharges": taxSellCharges,
        "cancellationPolicyDetails": cancellationPolicyDetails.toJson(),
        "promotionalContract": dynamicYnValues.reverse[promotionalContract],
        "packageYN": dynamicYnValues.reverse[packageYn],
        "nonRefundable": dynamicYnValues.reverse[nonRefundable],
        "dynamicYN": dynamicYnValues.reverse[dynamicYn],
        "rateBeforeTax": rateBeforeTax,
        "totalDiscount": totalDiscount,
        "recommendedRetailPrice": recommendedRetailPrice,
        "contractLabel": contractLabelValues.reverse[contractLabel],
        "roomStatus": roomStatusValues.reverse[roomStatus],
        "roomTypeSupplierCode": roomTypeSupplierCode,
        "blackOut": blackOut.toJson(),
        "currCode": currCodeValues.reverse[currCode],
        "ratePlanCode": ratePlanCode,
        "ratePlanId": ratePlanId,
        "mealPlan": mealPlanValues.reverse[mealPlan],
        "numberOfMeals": numberOfMeals,
      };
}

class BlackOut {
  String msg;
  String status;

  BlackOut({
    required this.msg,
    required this.status,
  });

  factory BlackOut.fromJson(Map<String, dynamic> json) => BlackOut(
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}

class CancellationPolicyDetails {
  List<Cancellation> cancellation;

  CancellationPolicyDetails({
    required this.cancellation,
  });

  factory CancellationPolicyDetails.fromJson(Map<String, dynamic> json) =>
      CancellationPolicyDetails(
        cancellation: List<Cancellation>.from(
            json["cancellation"].map((x) => Cancellation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cancellation": List<dynamic>.from(cancellation.map((x) => x.toJson())),
      };
}

class Cancellation {
  String value;
  dynamic percentOrAmt;
  int fromDate;
  int toDate;

  Cancellation({
    required this.value,
    required this.percentOrAmt,
    required this.fromDate,
    required this.toDate,
  });

  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        value: json["value"],
        percentOrAmt: json["percentOrAmt"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "percentOrAmt": percentOrAmt,
        "fromDate": fromDate,
        "toDate": toDate,
      };
}

enum ContractLabel { STANDARD_BB, STANDARD_RO }

final contractLabelValues = EnumValues({
  "Standard BB": ContractLabel.STANDARD_BB,
  "Standard RO": ContractLabel.STANDARD_RO
});

enum CurrCode { USD }

final currCodeValues = EnumValues({"USD": CurrCode.USD});

enum DynamicYn { N, Y }

final dynamicYnValues = EnumValues({"N": DynamicYn.N, "Y": DynamicYn.Y});

enum MealPlan { BREAKFAST, ROOM_ONLY }

final mealPlanValues = EnumValues(
    {"Breakfast": MealPlan.BREAKFAST, "Room Only": MealPlan.ROOM_ONLY});

enum RoomStatus { OK }

final roomStatusValues = EnumValues({"OK": RoomStatus.OK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
