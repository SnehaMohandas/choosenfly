// To parse this JSON data, do
//
//     final requestPdfModel = requestPdfModelFromJson(jsonString);

import 'dart:convert';

RequestPdfModel requestPdfModelFromJson(String str) =>
    RequestPdfModel.fromJson(json.decode(str));

String requestPdfModelToJson(RequestPdfModel data) =>
    json.encode(data.toJson());

class RequestPdfModel {
  String filepath;
  String filelocationServer;
  String hotelname;
  int hotelbookingid;
  int type;
  int senttype;
  int sentfiletype;
  dynamic referenceCode;
  dynamic bookingCode;
  List<String> hotelmails;
  dynamic employeemails;
  dynamic agentmail;
  String agentname;
  dynamic subemployeemails;
  String mainAgentName;
  String mainAgentProfile;
  int mainAgentId;
  String mainagentMail;
  dynamic mobile;

  RequestPdfModel({
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

  factory RequestPdfModel.fromJson(Map<String, dynamic> json) =>
      RequestPdfModel(
        filepath: json["filepath"],
        filelocationServer: json["filelocationServer"],
        hotelname: json["hotelname"],
        hotelbookingid: json["hotelbookingid"],
        type: json["type"],
        senttype: json["senttype"],
        sentfiletype: json["sentfiletype"],
        referenceCode: json["referenceCode"],
        bookingCode: json["bookingCode"],
        hotelmails: List<String>.from(json["hotelmails"].map((x) => x)),
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
        "hotelmails": List<dynamic>.from(hotelmails.map((x) => x)),
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
