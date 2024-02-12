// To parse this JSON data, do
//
//     final inhouseBookingModel = inhouseBookingModelFromJson(jsonString);

import 'dart:convert';

InhouseBookingModel inhouseBookingModelFromJson(String str) =>
    InhouseBookingModel.fromJson(json.decode(str));

String inhouseBookingModelToJson(InhouseBookingModel data) =>
    json.encode(data.toJson());

class InhouseBookingModel {
  int status;
  String message;
  Data data;
  dynamic token;

  InhouseBookingModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  factory InhouseBookingModel.fromJson(Map<String, dynamic> json) =>
      InhouseBookingModel(
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
  String bookingId;
  String hotelBookingId;
  String balancePayment;
  String paymentStatus;

  Data({
    required this.bookingId,
    required this.hotelBookingId,
    required this.balancePayment,
    required this.paymentStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookingId: json["booking_id"],
        hotelBookingId: json["hotel_booking_id"],
        balancePayment: json["balancePayment"],
        paymentStatus: json["paymentStatus"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "hotel_booking_id": hotelBookingId,
        "balancePayment": balancePayment,
        "paymentStatus": paymentStatus,
      };
}
