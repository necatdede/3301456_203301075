import 'package:diyetlendin/main.dart';
import 'package:diyetlendin/widgets/besin_widget.dart';
import 'package:flutter/material.dart';

class BesinDetay extends StatelessWidget {
  const BesinDetay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BesinWidget besin =
        ModalRoute.of(context)?.settings.arguments as BesinWidget;
    final bos = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(besin.besinAd),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: MyApp().bgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(besin.besinFoto)),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(
                          besin.kalori, "images/kalori.png", Colors.blue),
                      buildBesinDetayWidget(besin.karbonhidrat,
                          "images/karbonhidrat.png", Colors.yellow),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBesinDetayWidget(
                          besin.protein, "images/protein.png", Colors.red),
                      buildBesinDetayWidget(
                          besin.yag, "images/yag.png", Colors.green),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildBesinDetayWidget(num besin, String resim, Color renk) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      elevation: 10,
      child: Column(
        children: [
          Image.asset(resim, width: 150, height: 120, color: renk),
          Text(
            besin.toString(),
            style: TextStyle(fontSize: 40, color: renk),
          ),
        ],
      ),
    );
  }
}
