import 'package:diyetlendin/main.dart';
import 'package:flutter/material.dart';

import '../models/besin.dart';

class BesinDetay extends StatelessWidget {
  const BesinDetay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



      Besin besin = ModalRoute.of(context)?.settings.arguments as Besin;


      MediaQueryData queryData;
      queryData = MediaQuery.of(context);
      var queryHeight = queryData.size.height;
      var queryWidth = queryData.size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text(besin.besinAd),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
        color: MyApp().bgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(besin.besinFoto)),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(
                          besin.kalori, "images/kalori.png", Colors.blue,context),
                      buildBesinDetayWidget(besin.karbonhidrat,
                          "images/karbonhidrat.png", Colors.yellow,context),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(
                          besin.protein, "images/protein.png", Colors.red,context),
                      buildBesinDetayWidget(
                          besin.yag, "images/yag.png", Colors.green,context),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildBesinDetayWidget(num besin, String resim, Color renk,BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      elevation: 10,
      child: Column(
        children: [
          Image.asset(resim, width:MediaQuery.of(context).size.width/4, height: MediaQuery.of(context).size.height/8, color: renk),
          Text(
            besin.toString(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width/21, color: renk),
          ),
        ],
      ),
    );
  }
}
