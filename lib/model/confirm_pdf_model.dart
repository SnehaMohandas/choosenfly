// To parse this JSON data, do
//
//     final confirmPdfModel = confirmPdfModelFromJson(jsonString);

import 'dart:convert';

ConfirmPdfModel confirmPdfModelFromJson(String str) =>
    ConfirmPdfModel.fromJson(json.decode(str));

String confirmPdfModelToJson(ConfirmPdfModel data) =>
    json.encode(data.toJson());

class ConfirmPdfModel {
  String filepath;
  String filelocationServer;
  dynamic hotelname;
  int hotelbookingid;
  int type;
  int senttype;
  int sentfiletype;
  String referenceCode;
  String bookingCode;
  dynamic hotelmails;
  String employeemails;
  String agentmail;
  String agentname;
  String subemployeemails;
  String mainAgentName;
  String mainAgentProfile;
  int mainAgentId;
  String mainagentMail;
  dynamic mobile;

  ConfirmPdfModel({
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

  factory ConfirmPdfModel.fromJson(Map<String, dynamic> json) =>
      ConfirmPdfModel(
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
        "hotelname": hotelname,
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
