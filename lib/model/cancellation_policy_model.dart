// To parse this JSON data, do
//
//     final cancellationPolicyModel = cancellationPolicyModelFromJson(jsonString);

import 'dart:convert';

CancellationPolicyModel cancellationPolicyModelFromJson(String str) =>
    CancellationPolicyModel.fromJson(json.decode(str));

String cancellationPolicyModelToJson(CancellationPolicyModel data) =>
    json.encode(data.toJson());

class CancellationPolicyModel {
  int status;
  String message;
  List<CancellationPolicyModelDatum> data;
  dynamic token;

  CancellationPolicyModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  factory CancellationPolicyModel.fromJson(Map<String, dynamic> json) =>
      CancellationPolicyModel(
        status: json["status"],
        message: json["message"],
        data: List<CancellationPolicyModelDatum>.from(
            json["data"].map((x) => CancellationPolicyModelDatum.fromJson(x))),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "token": token,
      };
}

class CancellationPolicyModelDatum {
  InhouseJumeirahPolicyDetails? inhouseJumeirahPolicyDetails;
  AtharvaPolicyDetails? atharvaPolicyDetails;
  IwtxPolicyDetails? iwtxPolicyDetails;

  CancellationPolicyModelDatum({
    this.inhouseJumeirahPolicyDetails,
    this.atharvaPolicyDetails,
    this.iwtxPolicyDetails,
  });

  factory CancellationPolicyModelDatum.fromJson(Map<String, dynamic> json) =>
      CancellationPolicyModelDatum(
        inhouseJumeirahPolicyDetails:
            json["inhouse_jumeirah_policyDetails"] == null
                ? null
                : InhouseJumeirahPolicyDetails.fromJson(
                    json["inhouse_jumeirah_policyDetails"]),
        atharvaPolicyDetails: json["atharva_policyDetails"] == null
            ? null
            : AtharvaPolicyDetails.fromJson(json["atharva_policyDetails"]),
        iwtxPolicyDetails: json["iwtx_policyDetails"] == null
            ? null
            : IwtxPolicyDetails.fromJson(json["iwtx_policyDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "inhouse_jumeirah_policyDetails":
            inhouseJumeirahPolicyDetails?.toJson(),
        "atharva_policyDetails": atharvaPolicyDetails?.toJson(),
        "iwtx_policyDetails": iwtxPolicyDetails?.toJson(),
      };
}

class AtharvaPolicyDetails {
  AtharvaPolicyDetailsData data;

  AtharvaPolicyDetails({
    required this.data,
  });

  factory AtharvaPolicyDetails.fromJson(Map<String, dynamic> json) =>
      AtharvaPolicyDetails(
        data: AtharvaPolicyDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class AtharvaPolicyDetailsData {
  String tokenId;
  dynamic hCode;
  dynamic hName;
  dynamic available;
  dynamic currency;
  int discountAmount;
  int supplementAmount;
  int amount;
  int expectedAmount;
  dynamic withinTimeLimit;
  dynamic packageRate;
  dynamic hKey;
  dynamic roomDetails;
  dynamic roomwisePolicy;
  dynamic policies;
  String errorCode;
  dynamic error;

  AtharvaPolicyDetailsData({
    required this.tokenId,
    required this.hCode,
    required this.hName,
    required this.available,
    required this.currency,
    required this.discountAmount,
    required this.supplementAmount,
    required this.amount,
    required this.expectedAmount,
    required this.withinTimeLimit,
    required this.packageRate,
    required this.hKey,
    required this.roomDetails,
    required this.roomwisePolicy,
    required this.policies,
    required this.errorCode,
    required this.error,
  });

  factory AtharvaPolicyDetailsData.fromJson(Map<String, dynamic> json) =>
      AtharvaPolicyDetailsData(
        tokenId: json["TokenId"],
        hCode: json["HCode"],
        hName: json["HName"],
        available: json["Available"],
        currency: json["Currency"],
        discountAmount: json["DiscountAmount"],
        supplementAmount: json["SupplementAmount"],
        amount: json["Amount"],
        expectedAmount: json["ExpectedAmount"],
        withinTimeLimit: json["WithinTimeLimit"],
        packageRate: json["PackageRate"],
        hKey: json["HKey"],
        roomDetails: json["RoomDetails"],
        roomwisePolicy: json["RoomwisePolicy"],
        policies: json["Policies"],
        errorCode: json["Error_Code"],
        error: json["Error"],
      );

  Map<String, dynamic> toJson() => {
        "TokenId": tokenId,
        "HCode": hCode,
        "HName": hName,
        "Available": available,
        "Currency": currency,
        "DiscountAmount": discountAmount,
        "SupplementAmount": supplementAmount,
        "Amount": amount,
        "ExpectedAmount": expectedAmount,
        "WithinTimeLimit": withinTimeLimit,
        "PackageRate": packageRate,
        "HKey": hKey,
        "RoomDetails": roomDetails,
        "RoomwisePolicy": roomwisePolicy,
        "Policies": policies,
        "Error_Code": errorCode,
        "Error": error,
      };
}

class InhouseJumeirahPolicyDetails {
  List<InhouseJumeirahPolicyDetailsDatum> data;

  InhouseJumeirahPolicyDetails({
    required this.data,
  });

  factory InhouseJumeirahPolicyDetails.fromJson(Map<String, dynamic> json) =>
      InhouseJumeirahPolicyDetails(
        data: List<InhouseJumeirahPolicyDetailsDatum>.from(json["data"]
            .map((x) => InhouseJumeirahPolicyDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InhouseJumeirahPolicyDetailsDatum {
  int policydetailsId;
  int policyId;
  int type;
  int startDay;
  dynamic valuePercent;
  String policyRemark;
  dynamic policyType;
  int dayDifference;
  dynamic canceldate;
  int canceldays;
  bool validity;
  bool deleted;

  InhouseJumeirahPolicyDetailsDatum({
    required this.policydetailsId,
    required this.policyId,
    required this.type,
    required this.startDay,
    required this.valuePercent,
    required this.policyRemark,
    required this.policyType,
    required this.dayDifference,
    required this.canceldate,
    required this.canceldays,
    required this.validity,
    required this.deleted,
  });

  factory InhouseJumeirahPolicyDetailsDatum.fromJson(
          Map<String, dynamic> json) =>
      InhouseJumeirahPolicyDetailsDatum(
        policydetailsId: json["policydetails_id"],
        policyId: json["policy_id"],
        type: json["type"],
        startDay: json["startDay"],
        valuePercent: json["valuePercent"],
        policyRemark: json["policyRemark"],
        policyType: json["policyType"],
        dayDifference: json["dayDifference"],
        canceldate: json["canceldate"],
        canceldays: json["canceldays"],
        validity: json["validity"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "policydetails_id": policydetailsId,
        "policy_id": policyId,
        "type": type,
        "startDay": startDay,
        "valuePercent": valuePercent,
        "policyRemark": policyRemark,
        "policyType": policyType,
        "dayDifference": dayDifference,
        "canceldate": canceldate,
        "canceldays": canceldays,
        "validity": validity,
        "deleted": deleted,
      };
}

class IwtxPolicyDetails {
  IwtxPolicyDetailsData data;

  IwtxPolicyDetails({
    required this.data,
  });

  factory IwtxPolicyDetails.fromJson(Map<String, dynamic> json) =>
      IwtxPolicyDetails(
        data: IwtxPolicyDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class IwtxPolicyDetailsData {
  dynamic errorMsg;
  Hotels hotels;

  IwtxPolicyDetailsData({
    required this.errorMsg,
    required this.hotels,
  });

  factory IwtxPolicyDetailsData.fromJson(Map<String, dynamic> json) =>
      IwtxPolicyDetailsData(
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
  RoomStatus roomStatus;
  MealPlan mealPlan;
  String roomTypeSupplierCode;
  BlackOut blackOut;
  CurrCode currCode;
  String ratePlanCode;
  int ratePlanId;
  int numberOfMeals;
  String buyRate;
  String commissionSellCharges;
  String taxSellCharges;
  CancellationPolicyDetails cancellationPolicyDetails;
  PackageYn promotionalContract;
  PackageYn packageYn;
  DynamicYn nonRefundable;
  DynamicYn dynamicYn;
  double rateBeforeTax;
  int totalDiscount;
  bool recommendedRetailPrice;
  String contractLabel;

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
    required this.roomStatus,
    required this.mealPlan,
    required this.roomTypeSupplierCode,
    required this.blackOut,
    required this.currCode,
    required this.ratePlanCode,
    required this.ratePlanId,
    required this.numberOfMeals,
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
        roomStatus: roomStatusValues.map[json["roomStatus"]]!,
        mealPlan: mealPlanValues.map[json["mealPlan"]]!,
        roomTypeSupplierCode: json["roomTypeSupplierCode"],
        blackOut: BlackOut.fromJson(json["blackOut"]),
        currCode: currCodeValues.map[json["currCode"]]!,
        ratePlanCode: json["ratePlanCode"],
        ratePlanId: json["ratePlanId"],
        numberOfMeals: json["numberOfMeals"],
        buyRate: json["buyRate"],
        commissionSellCharges: json["commissionSellCharges"],
        taxSellCharges: json["taxSellCharges"],
        cancellationPolicyDetails: CancellationPolicyDetails.fromJson(
            json["cancellationPolicyDetails"]),
        promotionalContract: packageYnValues.map[json["promotionalContract"]]!,
        packageYn: packageYnValues.map[json["packageYN"]]!,
        nonRefundable: dynamicYnValues.map[json["nonRefundable"]]!,
        dynamicYn: dynamicYnValues.map[json["dynamicYN"]]!,
        rateBeforeTax: json["rateBeforeTax"]?.toDouble(),
        totalDiscount: json["totalDiscount"],
        recommendedRetailPrice: json["recommendedRetailPrice"],
        contractLabel: json["contractLabel"],
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
        "roomStatus": roomStatusValues.reverse[roomStatus],
        "mealPlan": mealPlanValues.reverse[mealPlan],
        "roomTypeSupplierCode": roomTypeSupplierCode,
        "blackOut": blackOut.toJson(),
        "currCode": currCodeValues.reverse[currCode],
        "ratePlanCode": ratePlanCode,
        "ratePlanId": ratePlanId,
        "numberOfMeals": numberOfMeals,
        "buyRate": buyRate,
        "commissionSellCharges": commissionSellCharges,
        "taxSellCharges": taxSellCharges,
        "cancellationPolicyDetails": cancellationPolicyDetails.toJson(),
        "promotionalContract": packageYnValues.reverse[promotionalContract],
        "packageYN": packageYnValues.reverse[packageYn],
        "nonRefundable": dynamicYnValues.reverse[nonRefundable],
        "dynamicYN": dynamicYnValues.reverse[dynamicYn],
        "rateBeforeTax": rateBeforeTax,
        "totalDiscount": totalDiscount,
        "recommendedRetailPrice": recommendedRetailPrice,
        "contractLabel": contractLabel,
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

enum CurrCode { USD }

final currCodeValues = EnumValues({"USD": CurrCode.USD});

enum DynamicYn { Y }

final dynamicYnValues = EnumValues({"Y": DynamicYn.Y});

enum MealPlan { BREAKFAST, ROOM_ONLY }

final mealPlanValues = EnumValues(
    {"Breakfast": MealPlan.BREAKFAST, "Room Only": MealPlan.ROOM_ONLY});

enum PackageYn { N }

final packageYnValues = EnumValues({"N": PackageYn.N});

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
