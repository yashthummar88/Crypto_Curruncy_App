import 'package:crypto_curruncy/models/crypto_model.dart';
import 'package:crypto_curruncy/screens/IOS/ios.dart';
import 'package:crypto_curruncy/services/crypto_service.dart';
import 'package:crypto_curruncy/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AndroidApp extends StatefulWidget {
  const AndroidApp({Key key}) : super(key: key);

  @override
  _AndroidAppState createState() => _AndroidAppState();
}

class _AndroidAppState extends State<AndroidApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeAndroid(),
    );
  }
}

class HomeAndroid extends StatefulWidget {
  const HomeAndroid({Key key}) : super(key: key);

  @override
  _HomeAndroidState createState() => _HomeAndroidState();
}

class _HomeAndroidState extends State<HomeAndroid> {
  String _chosenValue;
  Future<CryptoModel> crypto;
  String curruncyname;

  List<Drop> l = [
    Drop(val: "USD"),
    Drop(val: "ALL"),
    Drop(val: "DZD"),
    Drop(val: "ARS"),
    Drop(val: "AMD"),
    Drop(val: "AUD"),
    Drop(val: "AZN"),
    Drop(val: "BHD"),
    Drop(val: "BDT"),
    Drop(val: "EUR"),
    Drop(val: "DOP"),
    Drop(val: "IDR"),
    Drop(val: "INR"),
    Drop(val: "JOD"),
    Drop(val: "KWD"),
    Drop(val: "NAD"),
    Drop(val: "PKR"),
    Drop(val: "ZAR"),
  ];

  List<DropdownMenuItem> _generatedList(List<Drop> l) {
    List<DropdownMenuItem> item = [];
    l.forEach((element) {
      item.add(DropdownMenuItem(
        child: Text(
          element.val,
          style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.025),
        ),
        value: element.val,
      ));
    });
    return item;
  }

  bool _value = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crypto = CryptoService.getData(l[0].val);
    _chosenValue = l[0].val;
    curruncyname = l[0].val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Current Currency",
              style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.white),
            ),
            Container(
              alignment: Alignment.center,
              child: DropdownButton(
                dropdownColor: Colors.red,
                icon: Icon(
                  Icons.home,
                  size: MediaQuery.of(context).size.height * 0.025,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    _chosenValue = value;
                    curruncyname = value;
                    crypto = CryptoService.getData(_chosenValue);
                  });
                },
                value: _chosenValue,
                items: _generatedList(l),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Switch(
          value: _value,
          onChanged: (val) {
            setState(() {
              _value = val;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IosScreen(),
                ),
              );
            });
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "Crypto Converter",
          style: GoogleFonts.lato(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                getContainer("BCH", curruncyname, 1),
                SizedBox(
                  height: 10,
                ),
                getContainer("BTC", curruncyname, 2),
                SizedBox(
                  height: 10,
                ),
                getContainer("XRP", curruncyname, 3),
                SizedBox(
                  height: 10,
                ),
                getContainer("ETH", curruncyname, 4),
                SizedBox(
                  height: 10,
                ),
                getContainer("TRX", curruncyname, 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getContainer(String name, String curruncyname, int val) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "1 ${name}        = ",
                style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: crypto,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Eroor");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    "?",
                    style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                        color: Colors.white),
                  );
                }

                switch (val) {
                  case 1:
                    return Center(
                      child: Text(
                        snapshot.data.bch + " ${curruncyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 2:
                    return Center(
                      child: Text(
                        snapshot.data.btc + " ${curruncyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 3:
                    return Center(
                      child: Text(
                        snapshot.data.xrp + " ${curruncyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 4:
                    return Center(
                      child: Text(
                        snapshot.data.eth + " ${curruncyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                  case 5:
                    return Center(
                      child: Text(
                        snapshot.data.trx + " ${curruncyname}",
                        style: GoogleFonts.lato(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            color: Colors.white),
                      ),
                    );
                    break;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
