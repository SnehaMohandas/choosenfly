// To parse this JSON data, do
//
//     final allBookingsModel = allBookingsModelFromJson(jsonString);

import 'dart:convert';

AllBookingsModel allBookingsModelFromJson(String str) =>
    AllBookingsModel.fromJson(json.decode(str));

String allBookingsModelToJson(AllBookingsModel data) =>
    json.encode(data.toJson());

class AllBookingsModel {
  List<Datum> data;
  int totalCount;
  int pageSize;
  int pageNumber;
  int recordsTotal;
  int recordsFiltered;
  int draw;

  AllBookingsModel({
    required this.data,
    required this.totalCount,
    required this.pageSize,
    required this.pageNumber,
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.draw,
  });

  factory AllBookingsModel.fromJson(Map<String, dynamic> json) =>
      AllBookingsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalCount: json["totalCount"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        draw: json["draw"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalCount": totalCount,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "draw": draw,
      };
}

class Datum {
  int bookingId;
  int hotelbookingId;
  int agentId;
  dynamic hotelId;
  dynamic hBookId;
  dynamic resNo;
  String paymentStatus;
  dynamic userType;
  String bookingdate;
  dynamic sellingprice;
  String customerName;
  String agentName;
  dynamic agentlpo;
  String inhouserefernce;
  dynamic jumeirahrefernce;
  String confirmationStatus;
  String bookingCode;
  String checkIn;
  String checkOut;
  int apitype;
  int apiId;
  String hotelname;
  String totalprice;
  String clientrefernce;
  dynamic supplierrefernce;
  String hotelrefernce;
  String pricerefernce;
  String tourismDirhams;
  dynamic deadlineTime;
  List<dynamic> deadLineList;
  dynamic cancelDate;
  bool refund;
  bool rebooking;
  List<PolicyDetailsDtoList1> policyDetailsDtoList1;

  Datum({
    required this.bookingId,
    required this.hotelbookingId,
    required this.agentId,
    required this.hotelId,
    required this.hBookId,
    required this.resNo,
    required this.paymentStatus,
    required this.userType,
    required this.bookingdate,
    required this.sellingprice,
    required this.customerName,
    required this.agentName,
    required this.agentlpo,
    required this.inhouserefernce,
    required this.jumeirahrefernce,
    required this.confirmationStatus,
    required this.bookingCode,
    required this.checkIn,
    required this.checkOut,
    required this.apitype,
    required this.apiId,
    required this.hotelname,
    required this.totalprice,
    required this.clientrefernce,
    required this.supplierrefernce,
    required this.hotelrefernce,
    required this.pricerefernce,
    required this.tourismDirhams,
    required this.deadlineTime,
    required this.deadLineList,
    required this.cancelDate,
    required this.refund,
    required this.rebooking,
    required this.policyDetailsDtoList1,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bookingId: json["booking_id"],
        hotelbookingId: json["hotelbooking_id"],
        agentId: json["agent_id"],
        hotelId: json["hotel_id"],
        hBookId: json["hBookId"],
        resNo: json["resNo"],
        paymentStatus: json["paymentStatus"],
        userType: json["userType"],
        bookingdate: json["bookingdate"],
        sellingprice: json["sellingprice"],
        customerName: json["customerName"],
        agentName: json["agentName"],
        agentlpo: json["agentlpo"],
        inhouserefernce: json["inhouserefernce"],
        jumeirahrefernce: json["jumeirahrefernce"],
        confirmationStatus: json["confirmationStatus"],
        bookingCode: json["booking_code"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        apitype: json["apitype"],
        apiId: json["api_id"],
        hotelname: json["hotelname"],
        totalprice: json["totalprice"],
        clientrefernce: json["clientrefernce"],
        supplierrefernce: json["supplierrefernce"],
        hotelrefernce: json["hotelrefernce"],
        pricerefernce: json["pricerefernce"],
        tourismDirhams: json["tourism_dirhams"],
        deadlineTime: json["deadline_time"],
        deadLineList: List<dynamic>.from(json["deadLineList"].map((x) => x)),
        cancelDate: json["cancelDate"],
        refund: json["refund"],
        rebooking: json["rebooking"],
        policyDetailsDtoList1: List<PolicyDetailsDtoList1>.from(
            json["policyDetailsDTOList1"]
                .map((x) => PolicyDetailsDtoList1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "hotelbooking_id": hotelbookingId,
        "agent_id": agentId,
        "hotel_id": hotelId,
        "hBookId": hBookId,
        "resNo": resNo,
        "paymentStatus": paymentStatus,
        "userType": userType,
        "bookingdate": bookingdate,
        "sellingprice": sellingprice,
        "customerName": customerName,
        "agentName": agentName,
        "agentlpo": agentlpo,
        "inhouserefernce": inhouserefernce,
        "jumeirahrefernce": jumeirahrefernce,
        "confirmationStatus": confirmationStatus,
        "booking_code": bookingCode,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "apitype": apitype,
        "api_id": apiId,
        "hotelname": hotelname,
        "totalprice": totalprice,
        "clientrefernce": clientrefernce,
        "supplierrefernce": supplierrefernce,
        "hotelrefernce": hotelrefernce,
        "pricerefernce": pricerefernce,
        "tourism_dirhams": tourismDirhams,
        "deadline_time": deadlineTime,
        "deadLineList": List<dynamic>.from(deadLineList.map((x) => x)),
        "cancelDate": cancelDate,
        "refund": refund,
        "rebooking": rebooking,
        "policyDetailsDTOList1":
            List<dynamic>.from(policyDetailsDtoList1.map((x) => x.toJson())),
      };
}

class PolicyDetailsDtoList1 {
  int policydetailsId;
  int policyId;
  int type;
  int startDay;
  dynamic valuePercent;
  dynamic policyRemark;
  dynamic policyType;
  int dayDifference;
  dynamic canceldate;
  int canceldays;
  bool validity;
  bool deleted;

  PolicyDetailsDtoList1({
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

  factory PolicyDetailsDtoList1.fromJson(Map<String, dynamic> json) =>
      PolicyDetailsDtoList1(
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
