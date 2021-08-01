import 'dart:convert';

import 'package:crypto_curruncy/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  static Future<CryptoModel> getData(String val) async {
    http.Response res = await http.get(Uri.parse(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?convert=" +
            val +
            "&symbol=BTC,ETH,XRP,BCH,TRX&CMC_PRO_API_KEY=3ddd4fe6-bad5-461d-8cfd-5923ea65143f"));
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
      var a = await CryptoModel.fromJson(json.decode(res.body), val);
      print(a);
      return a;
    }
  }
}
