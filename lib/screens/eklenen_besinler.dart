import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class EklenenBesinler extends StatefulWidget {
  const EklenenBesinler({Key? key}) : super(key: key);

  @override
  _EklenenBesinlerState createState() => _EklenenBesinlerState();
}

class _EklenenBesinlerState extends State<EklenenBesinler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diyetlendin"),),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        //width: queryWidth*0.9,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: globals.yenmisler.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                    globals.yenmisler.removeAt(index);
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: globals.urunler[globals.yenmisler[index]],
                ),
              );
            }),
        // color: MyApp().bgColor,
      ),
    );
  }
}
