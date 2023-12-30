import 'package:choose_n_fly/model/destination_model.dart';
import 'package:choose_n_fly/model/native_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  List destination = [].obs;
  List<DestinationModel>? destinationModel;
  var isLoading = true.obs;
  List<NativeModel>? nativeModel;
  List native = [].obs;
  var exceptionCatched = false.obs;

  FetchDestination(searchKey) async {
    try {
      var exceptionCatched = false.obs;

      var response = await http.get(
          Uri.parse("${baseUrl}custom/destinationAPIout?term=${searchKey}"),
          headers: {'apikey': 'CONNECTWORLD123'});
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
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  FetchNative() async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/nationalityAPIout"),
          headers: {'apikey': 'CONNECTWORLD123'});
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
    } finally {
      // isLoading.value = false;
    }
  }

  @override
  void onInit() {
    FetchDestination("");
    super.onInit();
  }
}
