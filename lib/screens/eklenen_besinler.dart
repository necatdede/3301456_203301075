import 'package:diyetlendin/widgets/build_besin_widget.dart';
import 'package:flutter/material.dart';
import '../models/besin.dart';
import '../globals.dart' as globals;

class EklenenBesinler extends StatefulWidget {
  const EklenenBesinler({Key? key}) : super(key: key);

  @override
  _EklenenBesinlerState createState() => _EklenenBesinlerState();
}

class _EklenenBesinlerState extends State<EklenenBesinler> {
  @override
  Widget build(BuildContext context) {

    List<Besin> eklenenBesinler = ModalRoute.of(context)!.settings.arguments as List<Besin>;


    return Scaffold(
      appBar: AppBar(title: Text("Eklenenler"),),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        //width: queryWidth*0.9,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: eklenenBesinler.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                   eklenenBesinler.removeAt(index);
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: Stack(children: [
                    build_besin_widget(besinler: eklenenBesinler, index: index),
                  ],),
                ),
              );
            }),
        // color: MyApp().bgColor,
      ),
    );
  }
}
