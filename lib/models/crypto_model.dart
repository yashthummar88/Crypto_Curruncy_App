class CryptoModel {
  String bch;
  String btc;
  String eth;
  String xrp;
  String trx;
  CryptoModel({this.bch, this.btc, this.eth, this.xrp, this.trx});

  factory CryptoModel.fromJson(Map json, String val) {
    return CryptoModel(
      bch: json["data"]["BCH"]["quote"][val]["price"].toString(),
      xrp: json["data"]["XRP"]["quote"][val]["price"].toString(),
      eth: json["data"]["ETH"]["quote"][val]["price"].toString(),
      btc: json["data"]["BTC"]["quote"][val]["price"].toString(),
      trx: json["data"]["TRX"]["quote"][val]["price"].toString(),
    );
  }
}
