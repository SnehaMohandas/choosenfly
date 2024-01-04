import 'dart:convert';
import 'dart:ui';

import 'package:choose_n_fly/model/login_model.dart';
import 'package:choose_n_fly/utils/clr_constant.dart';
import 'package:choose_n_fly/utils/common_fctn.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  LoginModel? loginModel;
  RxString deviceToken = '123'.obs;
  //LoginModel? loginModel;
  var obscureText = true.obs;
  var exceptionCatched = false.obs;

  toggleVisibility() {
    obscureText.value = !obscureText.value;
  }

  login(userName, password) async {
    var response = await http.post(
      Uri.parse("${baseUrl}custom/loginAPIout"),
      body: ({"j_username": userName, "j_password": "${password}"}),
    );

    if (response.statusCode == 200) {
      var jsonstring = json.decode(response.body);
      print(jsonstring["status"]);
      if (jsonstring["status"] == 200) {
        loginModel = loginModelFromJson(response.body);
        token = loginModel!.token.toString();
        name = loginModel!.data.userName;
        userId = loginModel!.data.agentId.toString();
        companyName = loginModel!.data.companyName.toString();
        agentProfile = loginModel!.data.agentProfile.toString() ?? "";

        CommonFunction.addDataToSharedPreferences(
            'token', loginModel!.token.toString());
        CommonFunction.addDataToSharedPreferences(
            'username', loginModel!.data.userName);
        CommonFunction.addDataToSharedPreferences(
            'userId', loginModel!.data.agentId.toString());
        CommonFunction.addDataToSharedPreferences(
            'companyName', loginModel!.data.companyName.toString());
        CommonFunction.addDataToSharedPreferences(
            'profileImage', loginModel!.data.agentProfile.toString());
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: ColorConstant.black,
          textColor: ColorConstant.white,
        );
        Get.offAll(HomeScreen(), transition: Transition.rightToLeftWithFade);
      } else {
        Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 131, 23, 15),
          textColor: ColorConstant.white,
        );
      }
    }
  }
}
