import 'package:choose_n_fly/model/destination_model.dart';
import 'package:choose_n_fly/model/native_model.dart';
import 'package:choose_n_fly/network/network_controller.dart';
import 'package:choose_n_fly/utils/common_fctn.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:choose_n_fly/view/home/Home%20Page.dart';
import 'package:choose_n_fly/view/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  List destination = [].obs;
  List<DestinationModel>? destinationModel;
  var isLoading = true.obs;
  List<NativeModel>? nativeModel;
  List native = [].obs;
  var exceptionCatched = false.obs;
  final NetworkController networkController = Get.find<NetworkController>();

  FetchDestination(searchKey) async {
    print("destinationcalledddd----------->");
    try {
      var exceptionCatched = false.obs;

      var response = await http.get(
          Uri.parse("${baseUrl}custom/destinationAPIout?term=${searchKey}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = destinationModelFromJson(response.body);
        destinationModel = data;
        for (int i = 0; i < destinationModel!.length; i++) {
          // destination.add(destinationModel![i].hotelDetails);
          destination.add([
            destinationModel![i].hotelDetails,
            destinationModel![i].hotelCode,
            destinationModel![i].hotelType
          ]);
        }
        print("desssss==>${destination}");
      } else {
        exceptionCatched.value = true;
        print("000000");
      }

      await FetchNative();
      isLoading.value = false;
      print("lloollll==>${isLoading.value}");
    } catch (e) {
    } finally {}
  }

  FetchNative() async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/nationalityAPIout"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = nativeModelFromJson(response.body);
        nativeModel = data;
        for (int i = 0; i < nativeModel!.length; i++) {
          // nat.add(nativeModel![i].hotelDetails);
          native.add([
            nativeModel![i].name,
            nativeModel![i].countryId,
          ]);
        }
        print("desssss==>${native}");
      } else {
        exceptionCatched.value = true;
        print("000000");
      }
    } catch (e) {
      print(e);
    } finally {
      // isLoading.value = false;
    }
  }

  splashOn() {
    Future.delayed(
      const Duration(seconds: 6),
      () async {
        name = await CommonFunction.getSavedKey('username');
        token = await CommonFunction.getSavedKey('token');
        userId = await CommonFunction.getSavedKey('userId');
        companyName = await CommonFunction.getSavedKey('companyName');
        agentProfile = await CommonFunction.getSavedKey('profileImage');

        print("useridd==>${userId}");

        // if (!networkController.isConnected.value) {
        //   isNoNet.value = true;
        //   print("nonetttt${isNoNet}");
        // } else {
        //   isNoNet.value = false;
        //   print("elseee${isNoNet}");
        // }

        if (name == null) {
          Get.offAll(SignInPage());
        } else if (name != null) {
          print(token);
          Get.offAll(HomeScreen());

          // checkToken();
        }
      },
    );
  }

//   checkToken()async{
//     checkTokenModel = await HttpServices.checkToken(token);
//     if(checkTokenModel != null && checkTokenModel!.status == true){
//       Get.to(BottomNavigationScreen());
//     }else{
//       Get.offAll( LoginSignupSelectionScreen());
//     }

// }

  // var isNoNet = false.obs;
  @override
  void onInit() {
    splashOn();
    // FetchDestination("");
    super.onInit();
  }
}
