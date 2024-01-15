import 'package:choose_n_fly/model/dashboard_model.dart';
import 'package:choose_n_fly/model/wallet_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var selecedTab = 0.obs;

  var isLoading = true.obs;
  WalletModel? walletModel;
  DashboardCountModel? dashboardCountModel;
  var exceptionCatched = false.obs;

  //fetching wallet
  FetchWallet(id) async {
    isLoading.value = true;
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/agentCreditLimitAPIout?agentId=${id}"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = walletModelFromJson(response.body);
        walletModel = data;
      } else {
        exceptionCatched.value = true;
        print("000000");
      }

      await FetchDashboard();
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {}
  }

  FetchDashboard() async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/dashBoardAPIOut"),
          headers: {'apikey': header});
      if (response.statusCode == 200) {
        print("object");
        var data = dashboardCountModelFromJson(response.body);
        dashboardCountModel = data;
        print("dashboaddddd===>${data}");
      } else {
        //exceptionCatched.value = true;
        print("000000");
      }
      //isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {}
  }

  @override
  void onInit() {
    FetchWallet(agentId);
    // TODO: implement onInit
    super.onInit();
  }
}
