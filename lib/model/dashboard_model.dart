// To parse this JSON data, do
//
//     final dashboardCountModel = dashboardCountModelFromJson(jsonString);

import 'dart:convert';

DashboardCountModel dashboardCountModelFromJson(String str) =>
    DashboardCountModel.fromJson(json.decode(str));

String dashboardCountModelToJson(DashboardCountModel data) =>
    json.encode(data.toJson());

class DashboardCountModel {
  int status;
  String message;
  Data data;
  dynamic token;

  DashboardCountModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  factory DashboardCountModel.fromJson(Map<String, dynamic> json) =>
      DashboardCountModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  AvailableLimit cancel;
  AvailableLimit availableLimit;
  AvailableLimit booking;
  AvailableLimit checkIn;
  AvailableLimit pending;
  AvailableLimit creditLimit;
  AvailableLimit used;
  AvailableLimit checkOut;

  Data({
    required this.cancel,
    required this.availableLimit,
    required this.booking,
    required this.checkIn,
    required this.pending,
    required this.creditLimit,
    required this.used,
    required this.checkOut,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cancel: AvailableLimit.fromJson(json["cancel"]),
        availableLimit: AvailableLimit.fromJson(json["availableLimit"]),
        booking: AvailableLimit.fromJson(json["booking"]),
        checkIn: AvailableLimit.fromJson(json["checkIn"]),
        pending: AvailableLimit.fromJson(json["pending"]),
        creditLimit: AvailableLimit.fromJson(json["creditLimit"]),
        used: AvailableLimit.fromJson(json["used"]),
        checkOut: AvailableLimit.fromJson(json["checkOut"]),
      );

  Map<String, dynamic> toJson() => {
        "cancel": cancel.toJson(),
        "availableLimit": availableLimit.toJson(),
        "booking": booking.toJson(),
        "checkIn": checkIn.toJson(),
        "pending": pending.toJson(),
        "creditLimit": creditLimit.toJson(),
        "used": used.toJson(),
        "checkOut": checkOut.toJson(),
      };
}

class AvailableLimit {
  dynamic data;

  AvailableLimit({
    required this.data,
  });

  factory AvailableLimit.fromJson(Map<String, dynamic> json) => AvailableLimit(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
