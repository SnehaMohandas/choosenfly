// To parse this JSON data, do
//
//     final atharvaCancelPolicyModel = atharvaCancelPolicyModelFromJson(jsonString);

import 'dart:convert';

AtharvaCancelPolicyModel atharvaCancelPolicyModelFromJson(String str) =>
    AtharvaCancelPolicyModel.fromJson(json.decode(str));

String atharvaCancelPolicyModelToJson(AtharvaCancelPolicyModel data) =>
    json.encode(data.toJson());

class AtharvaCancelPolicyModel {
  String tokenId;
  String hCode;
  String hName;
  bool available;
  String currency;
  int discountAmount;
  int supplementAmount;
  double amount;
  int expectedAmount;
  bool withinTimeLimit;
  bool packageRate;
  String hKey;
  List<RoomDetail> roomDetails;
  bool roomwisePolicy;
  List<Policy> policies;
  dynamic errorCode;
  dynamic error;

  AtharvaCancelPolicyModel({
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

  factory AtharvaCancelPolicyModel.fromJson(Map<String, dynamic> json) =>
      AtharvaCancelPolicyModel(
        tokenId: json["TokenId"],
        hCode: json["HCode"],
        hName: json["HName"],
        available: json["Available"],
        currency: json["Currency"],
        discountAmount: json["DiscountAmount"],
        supplementAmount: json["SupplementAmount"],
        amount: json["Amount"]?.toDouble(),
        expectedAmount: json["ExpectedAmount"],
        withinTimeLimit: json["WithinTimeLimit"],
        packageRate: json["PackageRate"],
        hKey: json["HKey"],
        roomDetails: List<RoomDetail>.from(
            json["RoomDetails"].map((x) => RoomDetail.fromJson(x))),
        roomwisePolicy: json["RoomwisePolicy"],
        policies:
            List<Policy>.from(json["Policies"].map((x) => Policy.fromJson(x))),
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
        "RoomDetails": List<dynamic>.from(roomDetails.map((x) => x.toJson())),
        "RoomwisePolicy": roomwisePolicy,
        "Policies": List<dynamic>.from(policies.map((x) => x.toJson())),
        "Error_Code": errorCode,
        "Error": error,
      };
}

class Policy {
  int roomSrNo;
  String remark;
  dynamic offers;
  List<CancellationPolicy> cancellationPolicy;

  Policy({
    required this.roomSrNo,
    required this.remark,
    required this.offers,
    required this.cancellationPolicy,
  });

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
        roomSrNo: json["RoomSrNo"],
        remark: json["Remark"],
        offers: json["Offers"],
        cancellationPolicy: List<CancellationPolicy>.from(
            json["CancellationPolicy"]
                .map((x) => CancellationPolicy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RoomSrNo": roomSrNo,
        "Remark": remark,
        "Offers": offers,
        "CancellationPolicy":
            List<dynamic>.from(cancellationPolicy.map((x) => x.toJson())),
      };
}

class CancellationPolicy {
  int srNo;
  String fromDate;
  String toDate;
  int amount;
  String policyType;

  CancellationPolicy({
    required this.srNo,
    required this.fromDate,
    required this.toDate,
    required this.amount,
    required this.policyType,
  });

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      CancellationPolicy(
        srNo: json["SrNo"],
        fromDate: json["FromDate"],
        toDate: json["ToDate"],
        amount: json["Amount"],
        policyType: json["PolicyType"],
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "FromDate": fromDate,
        "ToDate": toDate,
        "Amount": amount,
        "PolicyType": policyType,
      };
}

class RoomDetail {
  int roomSrNo;
  String roomCategory;
  String meal;
  String rateKey;
  List<NightRate> nightRates;

  RoomDetail({
    required this.roomSrNo,
    required this.roomCategory,
    required this.meal,
    required this.rateKey,
    required this.nightRates,
  });

  factory RoomDetail.fromJson(Map<String, dynamic> json) => RoomDetail(
        roomSrNo: json["RoomSrNo"],
        roomCategory: json["RoomCategory"],
        meal: json["Meal"],
        rateKey: json["RateKey"],
        nightRates: List<NightRate>.from(
            json["NightRates"].map((x) => NightRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "RoomSrNo": roomSrNo,
        "RoomCategory": roomCategory,
        "Meal": meal,
        "RateKey": rateKey,
        "NightRates": List<dynamic>.from(nightRates.map((x) => x.toJson())),
      };
}

class NightRate {
  String date;
  int amount;

  NightRate({
    required this.date,
    required this.amount,
  });

  factory NightRate.fromJson(Map<String, dynamic> json) => NightRate(
        date: json["Date"],
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date,
        "Amount": amount,
      };
}
