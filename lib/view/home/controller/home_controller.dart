import 'package:choose_n_fly/model/wallet_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var selecedTab = 0.obs;

  var isLoading = true.obs;
  WalletModel? walletModel;

  //fetching destination
  FetchWallet(id) async {
    try {
      var response = await http.get(
          Uri.parse("${baseUrl}custom/agentCreditLimitAPIout?agentId=${id}"),
          headers: {'apikey': 'CONNECTWORLD123'});
      if (response.statusCode == 200) {
        print("object");
        var data = walletModelFromJson(response.body);
        walletModel = data;
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    FetchWallet("5");
    // TODO: implement onInit
    super.onInit();
  }
}
