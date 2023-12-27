// import 'dart:convert';

// import 'package:amazon_payfort/amazon_payfort.dart';
// import 'package:choose_n_fly/view/payment/font_constants.dart';
// import 'package:choose_n_fly/view/payment/sdk_token_response.dart';

// import 'package:http/http.dart';

// class PayFortApi {
//   PayFortApi._();

//   static Future<SdkTokenResponse?> generateSdkToken(
//       SdkTokenRequest request) async {
//     var response = await post(
//       Uri.parse(FortConstants.environment.paymentApi),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(request.asRequest()),
//     );
//     if (response.statusCode == 200) {
//       var decodedResponse = jsonDecode(response.body);
//       print("decoderesppp==>${decodedResponse}");
//       return SdkTokenResponse.fromMap(decodedResponse);
//     }
//     return null;
//   }
// }
