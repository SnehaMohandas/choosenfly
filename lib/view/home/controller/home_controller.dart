import 'package:choose_n_fly/model/wallet_model.dart';
import 'package:choose_n_fly/utils/consts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var selecedTab = 0.obs;

  var isLoading = true.obs;
  WalletModel? walletModel;
  var exceptionCatched = false.obs;

  //fetching wallet
  FetchWallet(id) async {
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
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    FetchWallet(agentId);
    // TODO: implement onInit
    super.onInit();
  }
}

void login() async {
  var respone = await http
      .get(Uri.parse("${baseUrl}custom/agentCreditLimitAPIout?agentId=539"));
  if (respone.statusCode == 200) {
    print(respone.body);
  } else {
    print("no resonse");
  }
}
