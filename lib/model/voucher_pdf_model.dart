// To parse this JSON data, do
//
//     final voucherPdfModel = voucherPdfModelFromJson(jsonString);

import 'dart:convert';

VoucherPdfModel voucherPdfModelFromJson(String str) =>
    VoucherPdfModel.fromJson(json.decode(str));

String voucherPdfModelToJson(VoucherPdfModel data) =>
    json.encode(data.toJson());

class VoucherPdfModel {
  String filepath;
  String filelocationServer;
  dynamic hotelname;
  dynamic hotelbookingid;
  dynamic type;
  dynamic senttype;
  dynamic sentfiletype;
  dynamic referenceCode;
  dynamic bookingCode;
  dynamic hotelmails;
  dynamic employeemails;
  dynamic agentmail;
  dynamic agentname;
  dynamic subemployeemails;
  dynamic mainAgentName;
  dynamic mainAgentProfile;
  dynamic mainAgentId;
  dynamic mainagentMail;
  dynamic mobile;

  VoucherPdfModel({
    required this.filepath,
    required this.filelocationServer,
    required this.hotelname,
    required this.hotelbookingid,
    required this.type,
    required this.senttype,
    required this.sentfiletype,
    required this.referenceCode,
    required this.bookingCode,
    required this.hotelmails,
    required this.employeemails,
    required this.agentmail,
    required this.agentname,
    required this.subemployeemails,
    required this.mainAgentName,
    required this.mainAgentProfile,
    required this.mainAgentId,
    required this.mainagentMail,
    required this.mobile,
  });

  factory VoucherPdfModel.fromJson(Map<String, dynamic> json) =>
      VoucherPdfModel(
        filepath: json["filepath"],
        filelocationServer: json["filelocationServer"],
        hotelname: json["hotelname"],
        hotelbookingid: json["hotelbookingid"],
        type: json["type"],
        senttype: json["senttype"],
        sentfiletype: json["sentfiletype"],
        referenceCode: json["referenceCode"],
        bookingCode: json["bookingCode"],
        hotelmails: json["hotelmails"],
        employeemails: json["employeemails"],
        agentmail: json["agentmail"],
        agentname: json["agentname"],
        subemployeemails: json["subemployeemails"],
        mainAgentName: json["mainAgentName"],
        mainAgentProfile: json["mainAgentProfile"],
        mainAgentId: json["main_agent_id"],
        mainagentMail: json["mainagentMail"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "filepath": filepath,
        "filelocationServer": filelocationServer,
        "hotelname": hotelname ?? "",
        "hotelbookingid": hotelbookingid,
        "type": type,
        "senttype": senttype,
        "sentfiletype": sentfiletype,
        "referenceCode": referenceCode,
        "bookingCode": bookingCode,
        "hotelmails": hotelmails,
        "employeemails": employeemails,
        "agentmail": agentmail,
        "agentname": agentname,
        "subemployeemails": subemployeemails,
        "mainAgentName": mainAgentName,
        "mainAgentProfile": mainAgentProfile,
        "main_agent_id": mainAgentId,
        "mainagentMail": mainagentMail,
        "mobile": mobile,
      };
}
